import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:web_services/http_request/request_entity.dart';
import 'package:web_services/http_request/request_method.dart';
import 'package:web_services/http_request/result.dart';
import 'package:web_services/http_request/web_services_constants.dart';

import '../generated/l10n.dart';

class WebServices {
  final Dio dio;
  final Connectivity connectivity;
  final String baseUrl;

  WebServices({
    Dio? d,
    Connectivity? c,
    List<Interceptor>? interceptors,
    required this.baseUrl,
  })  : dio = d ?? Dio(),
        connectivity = c ?? Connectivity() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout =
        const Duration(seconds: WebServicesConstants.connectTimeoutInSeconds);
    dio.options.receiveTimeout =
        const Duration(seconds: WebServicesConstants.receiveTimeoutInSeconds);
    dio.options.sendTimeout =
        const Duration(seconds: WebServicesConstants.sendTimeoutInSeconds);
  }
  void setInterceptors(List<Interceptor>? interceptors) {
    dio.interceptors.addAll(interceptors ?? []);
  }

  // Function to make a generic api request
  Future<dynamic> request({
    required RequestEntity requestEntity,
  }) async {
    try {
      if (requestEntity.baseUrl != null) {
        dio.options.baseUrl = requestEntity.baseUrl!;
      }
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        throw Exception(S.current.noInternetErrorMessage);
      }
      final response = await dio.request(requestEntity.path,
          data: requestEntity.data,
          queryParameters: requestEntity.queryParameters,
          cancelToken: requestEntity.cancelToken,
          options: Options(
            method: requestEntity.method.value,
            headers: requestEntity.headers,
            responseType: requestEntity.responseType,
            contentType: Headers.jsonContentType,
          ));
      log(response.data.toString());
      switch (response.statusCode) {
        case 200:
          return response.data;
        case 204:
          return <String, Object?>{}; // no content
        default:
          throw ApiException(
              message: response.data.toString(),
              statusCode: response.statusCode);
      }
    } on DioException catch (e) {
      log(e.toString());
      String errorMessage = e.message ?? S.current.unknownError;
      final errorResponse = e.response?.data;
      if (errorResponse != null && errorResponse is Map<String, dynamic>) {
        const keyName = WebServicesConstants.errorResponseMessageKeyName;
        if (errorResponse.containsKey(keyName)) {
          errorMessage = errorResponse[keyName];
        } else {
          errorMessage = errorResponse.toString();
        }
      }
      // timeout exception
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        errorMessage = S.current.timeoutErrorMessage;
      }
      throw ApiException(
        message: errorMessage,
        statusCode: e.response?.statusCode,
      );
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    } on Error catch (e) {
      log(e.toString());
      rethrow;
    } finally {
      dio.options.baseUrl = baseUrl;
    }
  }
}
