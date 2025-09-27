import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oolio/features/product/cubit/product_cubit.dart';
import 'package:oolio/utils/extensions/double_extensions.dart';
import 'package:oolio/widgets/scaffolds/landing_scaffold.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/widgets/progress/loading_indicator/loading_indicator.dart';

import '../../../widgets/error/error_view.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController(text: '');
    return BlocProvider<ProductCubit>(
      create: (context) => ProductCubit()..loadData(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          state.maybeMap(
            loaded: (loaded) {
              // Handle side effects if needed
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: LoadingIndicator()),
            error: (message) => Padding(
              padding: const EdgeInsets.all(Gaps.spacing16),
              child: Center(
                child: ErrorView(
                  message: message,
                  onPressed: () => context.read<ProductCubit>().loadData(),
                ),
              ),
            ),
            loaded: (response, query) {
              return LandingScaffold(
                titleLabel: 'Product',
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Search...',

                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: _controller.text.isEmpty
                              ? null
                              : IconButton(
                            icon: const Icon(Icons.cancel_outlined),
                            onPressed: () {
                              _controller.clear();
                              context.read<ProductCubit>().filterProducts(''); // notify Cubit
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (value) {
                          context.read<ProductCubit>().filterProducts(value);
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: response.length,
                        itemBuilder: (context, index) {
                          final item = response[index];
                          return Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final width =
                                          MediaQuery.of(context).size.width;

                                      // Pick correct image based on screen width
                                      final imageUrl = width < 600
                                          ? item.image.mobile
                                          : width < 1024
                                          ? item.image.tablet
                                          : item.image.desktop;

                                      return Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 180,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                        const Icon(Icons.broken_image,
                                            size: 80),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item.name,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        item.price.toCurrency(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
