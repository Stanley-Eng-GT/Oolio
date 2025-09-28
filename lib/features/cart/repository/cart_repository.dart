import 'package:oolio/features/cart/model/cart_item_model.dart';
import 'package:web_services/http_request/request_entity.dart';
import 'package:web_services/http_request/request_method.dart';
import 'package:web_services/http_request/result.dart';

import '../../../core/environment/dependency_injection.dart';
import '../../../core/http_manager/end_points.dart';
import '../../../core/http_manager/http_manager.dart';

class CartRepository {
  CartRepository({
    HttpManager? httpManager,
  }) : _httpManager = httpManager ?? sl<HttpManager>();

  final HttpManager _httpManager;

  Future<Result<void, Exception>> submitOrder(
      List<CartItemModel> cartItems) async {
    try {
      final result = await _httpManager.request(
          requestEntity: RequestEntity(
        path: EndPoints.order,
        method: RequestMethod.post,
        data: {
          'couponCode': '',
          'items': cartItems
              .map((e) => {
                    'productId': e.product.id,
                    'quantity': e.count,
                  })
              .toList(),
        },
      ));

      final Result<void, Exception> value = switch (result) {
        Success(value: final _) => Success(null),
        Failure(exception: final exception) => Failure(exception),
      };

      return value;
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
