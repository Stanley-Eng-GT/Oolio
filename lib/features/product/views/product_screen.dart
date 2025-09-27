import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oolio/features/product/cubit/product_cubit.dart';
import 'package:oolio/widgets/scaffolds/landing_scaffold.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/widgets/progress/loading_indicator/loading_indicator.dart';
import 'package:ui_widgets/widgets/progress/loading_indicator/loading_indicator.dart';

import '../../../widgets/error/error_view.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) => ProductCubit()..loadData(), // Call loadData initially
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
            loading: () => const Center(
              child: LoadingIndicator(),
            ),
            error: (message) => Padding(
              padding: const EdgeInsets.all(Gaps.spacing16),
              child: Center(
                child: ErrorView(
                  message: message,
                  onPressed: () =>
                      context.read<ProductCubit>().loadData(),
                ),
              ),
            ),
            loaded: (response) {
              return LandingScaffold(
                titleLabel: 'Product',
                body: ListView.builder(
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
                            child: Image.network(
                              item.image.mobile,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 180,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 80),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              item.name,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}


