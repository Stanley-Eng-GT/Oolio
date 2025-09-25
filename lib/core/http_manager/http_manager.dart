import 'package:web_services/http_inspector/alice/core/alice_dio_interceptor.dart';
import 'package:web_services/http_request/request_entity.dart';
import 'package:web_services/http_request/result.dart';
import 'package:web_services/http_request/web_service_exports.dart';
import 'package:web_services/http_request/web_services.dart';
import 'package:web_services/http_request/web_services_constants.dart';

import '../app_constants.dart';
import 'authentication_interceptor.dart';

class HttpManager {
  HttpManager({
    WebServices? webServices,
    // AnalyticsManager? analyticsManager,
    // AppInfoManager? appInfoManager,
    required AliceDioInterceptor aliceDioInterceptor,
  })  :
        // _analyticsManager = analyticsManager ?? sl<AnalyticsManager>(),
        // _appInfoManager = appInfoManager ?? AppInfoManager(),
        _webServices = webServices ??
            WebServices(baseUrl: AppConstants.productionBaseUrl) {
    _webServices.setInterceptors([
      AuthenticationInterceptor(
        // appInfoManager: _appInfoManager,
        webServices: _webServices,
      ),
      aliceDioInterceptor,
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    ]);
  }
  late final WebServices _webServices;
  // final AnalyticsManager _analyticsManager;
  // final AppInfoManager _appInfoManager;

  Future<Result<dynamic, Exception>> request({
    required RequestEntity requestEntity,
  }) async {
    try {
      final responseData =
          await _webServices.request(requestEntity: requestEntity);
      return Success(responseData);
    } on Exception catch (e) {
      // _analyticsManager.logEvent(
      //     event: AnalyticsEvent.exception,
      //     params: {AnalyticsParams.errorMessage: e.toString()});
      return Failure(e);
    } on Error catch (e) {
      // _analyticsManager.logEvent(
      //     event: AnalyticsEvent.error,
      //     params: {AnalyticsParams.errorMessage: e.toString()});
      return Failure(Exception(e.toString()));
    }
  }
}
