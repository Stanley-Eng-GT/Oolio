import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:foundation/app_info_manager/app_info_manager.dart';
import 'package:foundation/local_storage_manager/local_storage_keys.dart';
import 'package:foundation/local_storage_manager/local_storage_manager.dart';
import 'package:my_plus/app_constants.dart';
import 'package:web_services/http_request/request_entity.dart';
import 'package:web_services/http_request/request_method.dart';
import 'package:web_services/http_request/web_service_exports.dart';
import 'package:web_services/http_request/web_services.dart';
import 'package:web_services/http_request/web_services_constants.dart';

import '../../features/onboarding/screens/loading/models/api_key_response.dart';
import '../../features/onboarding/screens/login/models/login_response.dart';
import '../app_constants.dart';
import '../environment/env.dart';
import 'end_points.dart';
import 'http_manager_constants.dart';

class AuthenticationInterceptor extends Interceptor {
  AuthenticationInterceptor({
    required WebServices webServices,
    required AppInfoManager appInfoManager,
  })  : _appInfoManager = appInfoManager,
        _webServices = webServices;

  late final WebServices _webServices;
  final AppInfoManager _appInfoManager;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.baseUrl == AppConstants.uatBaseUrl ||
        options.baseUrl == AppConstants.productionBaseUrl) {
      options.headers.addAll(
        getInterceptorHeaders(
          deviceId: _appInfoManager.deviceId,
          appVersion: _appInfoManager.version,
          platformName: _appInfoManager.platform,
        ),
      );
    }

    return handler.next(options);
  }

  @visibleForTesting
  Map<String, dynamic> getInterceptorHeaders({
    String? apiKey,
    String? accessToken,
    String? deviceId,
    required String appVersion,
    required String platformName,
    bool requestApiKey = false,
  }) {
    final Map<String, dynamic> headers = {};
    if (apiKey?.isNotEmpty == true) {
      headers[HttpManagerConstants.apiKeyHeaderName] = apiKey;
    }
    if (!requestApiKey && accessToken?.isNotEmpty == true) {
      headers[HttpManagerConstants.authorizationHeaderName] =
          HttpManagerConstants.bearer(accessToken!);
    }
    if (deviceId?.isNotEmpty == true) {
      headers[HttpManagerConstants.deviceId] = deviceId;
    }
    headers[HttpManagerConstants.appVersionHeaderName] = appVersion;
    headers[HttpManagerConstants.platform] = platformName;
    return headers;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.requestOptions.path == EndPoints.apiKey) {
      return handler.next(err);
    } else if (err.requestOptions.path == EndPoints.refresh &&
        err.response?.statusCode !=
            WebServicesConstants.apiKeyInvalidStatusCode) {
      return handler.next(err);
    } else {
      switch (err.response?.statusCode) {
        case WebServicesConstants.apiKeyInvalidStatusCode:
          // get a new api key
          final ApiKeyResponse? apiKeyResponse = await getApiKey();
          if (apiKeyResponse != null) {
            // assign the new key to header
            err.requestOptions.headers[HttpManagerConstants.apiKeyHeaderName] =
                apiKeyResponse.data;
            // retry the previous api request with new access token
            return _retryApiRequest(
              requestOptions: err.requestOptions,
              handler: handler,
            );
          }
        case WebServicesConstants.tokenExpiredStatusCode:
          // get a new access token with the current refresh token
          final LoginResponse? loginResponse = await getTokens();
          if (loginResponse != null) {
            // assign the new access token to header
            err.requestOptions
                    .headers[HttpManagerConstants.authorizationHeaderName] =
                HttpManagerConstants.bearer(loginResponse.accessToken);
            // retry the previous api request with new access token
            return _retryApiRequest(
              requestOptions: err.requestOptions,
              handler: handler,
            );
          }
      }
      return handler.next(err);
    }
  }

  Future<void> _retryApiRequest({
    required RequestOptions requestOptions,
    required ErrorInterceptorHandler handler,
  }) async {
    try {
      final response = await _webServices.dio.fetch(requestOptions);
      return handler.resolve(response);
    } on DioException catch (e) {
      log(e.toString());
      return handler.next(e);
    }
  }

  @visibleForTesting
  Future<LoginResponse?> getTokens() async {
    final refreshToken =
        _localStorageManager.getString(keyName: LocalStorageKeys.refreshToken);
    try {
      final responseData = await _webServices.request(
        requestEntity: RequestEntity(
          method: RequestMethod.post,
          path: EndPoints.refresh,
          data: {
            HttpManagerConstants.refreshToken: refreshToken,
          },
        ),
      );
      final LoginResponse loginResponse = LoginResponse.fromJson(responseData);
      await _localStorageManager.setString(
          keyName: LocalStorageKeys.refreshToken,
          value: loginResponse.refreshToken);
      await _localStorageManager.setString(
          keyName: LocalStorageKeys.accessToken,
          value: loginResponse.accessToken);
      return loginResponse;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    } on Error catch (e) {
      log(e.toString());
      return null;
    }
  }

  @visibleForTesting
  Future<ApiKeyResponse?> getApiKey() async {
    try {
      final encodedHeader = base64Encode(
        utf8.encode('${Env.apiKeyUsername}:${Env.apiKeyPassword}'),
      );
      final responseData = await _webServices.request(
        requestEntity: RequestEntity(
            method: RequestMethod.get,
            path: EndPoints.apiKey,
            queryParameters: {},
            headers: {
              HttpManagerConstants.authorizationHeaderName:
                  HttpManagerConstants.basic(encodedHeader)
            }),
      );

      final ApiKeyResponse apiKeyResponse =
          ApiKeyResponse.fromJson(responseData);
      final apiKey = apiKeyResponse.data;
      if (apiKey.isNotEmpty == true) {
        _localStorageManager.setString(
            keyName: LocalStorageKeys.apiKey, value: apiKey);
        return apiKeyResponse;
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    } on Error catch (e) {
      log(e.toString());
      return null;
    }
  }
}
