import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/blocs/cart_bloc/cart_bloc.dart';
import 'package:store/blocs/cart_bloc/cart_event.dart';
import 'package:store/blocs/cart_bloc/cart_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            actions: [
              if (state.items.isNotEmpty)
                IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(ClearCart());
                  },
                  icon: const Icon(Icons.delete_outline),
                  tooltip: 'Clear cart',
                ),
            ],
          ),
          body: state.items.isEmpty
              ? const Center(
            child: Text(
              'Your cart is empty',
              style: TextStyle(fontSize: 18),
            ),
          )
              : ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: Image.asset(
                    item.product.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.product.title),
                  subtitle: Text(
                    '\$${item.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(
                            DecreaseQuantity(
                              productId: item.product.id,
                            ),
                          );
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        '${item.quantity}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(
                            IncreaseQuantity(
                              productId: item.product.id,
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          bottomSheet: state.items.isEmpty
              ? null
              : Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total quantity: ${state.totalItems}'),
                  const SizedBox(height: 4),
                  Text(
                    'Total price: \$${state.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                      },
                      child: const Text('Order now'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}