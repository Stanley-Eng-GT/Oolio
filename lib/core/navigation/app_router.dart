import 'package:go_router/go_router.dart';

import '../../features/product/views/product_screen.dart';

final GoRouter router = GoRouter(initialLocation: "/product", routes: [
  GoRoute(
      name: "/product",
      path: "/product",
      builder: (context, state) {
        return ProductScreen();
      })
]);
