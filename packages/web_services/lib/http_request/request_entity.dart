import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_services/http_request/request_method.dart';

part 'request_entity.freezed.dart';

@freezed
class RequestEntity with _$RequestEntity {
  const factory RequestEntity({
    required String path,
    @Default(RequestMethod.get) RequestMethod method,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    @Default(ResponseType.json) ResponseType responseType,
    String? baseUrl,
  }) = _RequestEntity;
}
