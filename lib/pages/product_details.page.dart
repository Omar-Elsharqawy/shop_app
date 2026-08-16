import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/blocs/cart_bloc/cart_bloc.dart';
import 'package:store/blocs/cart_bloc/cart_event.dart';
import 'package:store/blocs/cart_bloc/cart_state.dart';
import 'package:store/models/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final cartItem = state.items.where(
              (item) => item.product.id == product.id,
        );

        final quantityInCart =
        cartItem.isEmpty ? 0 : cartItem.first.quantity;

        return Scaffold(
          appBar: AppBar(
            title: Text(product.title),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                if (quantityInCart > 0) ...[
                  const SizedBox(height: 20),
                  Text(
                    'In your cart: $quantityInCart',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (quantityInCart == 0) {
                      context.read<CartBloc>().add(AddToCart(product));
                    } else {
                      context.read<CartBloc>().add(
                        IncreaseQuantity(productId: product.id),
                      );
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Product added to cart'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: Text(
                    quantityInCart == 0
                        ? 'Add to cart'
                        : 'Add another one',
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}