import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:web_services/http_request/web_service_exports.dart';
import 'package:web_services/http_request/web_services.dart';
import 'http_manager_constants.dart';

class AuthenticationInterceptor extends Interceptor {
  AuthenticationInterceptor({
    required WebServices webServices,
  })  :_webServices = webServices;

  late final WebServices _webServices;


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

}
