import 'package:go_router/go_router.dart';
import 'package:oolio/core/navigation/ordering_navigation.dart';
import 'package:oolio/features/cart/cart_screen.dart';
import 'package:oolio/features/submit_success/submit_success_screen.dart';
import 'package:oolio/features/cart/cubit/cart_cubit.dart';

import '../../features/product/views/product_screen.dart';

final GoRouter router = GoRouter(initialLocation: "/product", routes: [
  GoRoute(
      name: "/product",
      path: "/product",
      builder: (context, state) {
        return ProductScreen();
      }),
  GoRoute(
    name: OrderingNavigation.cartPath,
    path: OrderingNavigation.cartPath,
    builder: (context, state) {
      final cartCubit = state.extra as CartCubit; // get the existing Cubit
      return CartScreen(cartCubit:  cartCubit);
    },
  ),
  GoRoute(
    name: OrderingNavigation.submitSuccessPath,
    path: OrderingNavigation.submitSuccessPath,
    builder: (context, state) {
      return SubmitSuccessScreen();
    },
  ),
]);
