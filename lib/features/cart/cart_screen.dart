import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_widgets/widgets/alerts/alert.dart';
import 'cubit/cart_cubit.dart';
import 'cubit/cart_state.dart';
import 'package:ui_widgets/widgets/buttons/cta_confirm_button.dart';
import '../../../core/navigation/ordering_navigation.dart';
import 'package:go_router/go_router.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.cartCubit});

  final CartCubit cartCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: BlocProvider.value(
        value: cartCubit,
        child: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state.submitted) {
              GoRouter.of(context).push(
                  OrderingNavigation.submitSuccessPath);
            } else if (state.errorMessage != null) {
              showDialog(
                context: context,
                builder: (BuildContext _) {
                  return Alert(
                    title: 'Error',
                    content: Text(state.errorMessage.toString()),
                    confirmButtonTitle: 'Ok',
                    onTap: (buttonType) {
                      Navigator.of(context).pop();
                      context.read<CartCubit>().dismissErrorAlert();
                    },
                  );
                },
              );
            }
          },
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount: state.items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.network(
                                    item.product.image.thumbnail,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      item.product.name,
                                      style: const TextStyle(fontSize: 16),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                          ),
                                          onPressed: () {
                                            context
                                                .read<CartCubit>()
                                                .decreaseProduct(item.product);
                                          },
                                        ),
                                        Text(
                                          '${item.count}',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                          ),
                                          onPressed: () {
                                            context
                                                .read<CartCubit>()
                                                .addProduct(item.product);
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '\$${item.cost.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Price:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${state.grandTotal.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        CTAConfirmButton(
                          label: 'submit',
                          buttonStyle: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.primary,
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                            side: WidgetStateProperty.all<BorderSide>(
                              BorderSide(
                                color:
                                Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.read<CartCubit>().submitOrder();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
