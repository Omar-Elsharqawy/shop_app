import 'package:store/models/product.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final Product product;

  AddToCart(this.product);
}

class IncreaseQuantity extends CartEvent {
  final String productId;

  IncreaseQuantity({
    required this.productId,
  });
}

class DecreaseQuantity extends CartEvent {
  final String productId;

  DecreaseQuantity({
    required this.productId,
  });
}

class RemoveFromCart extends CartEvent {
  final String productId;

  RemoveFromCart({
    required this.productId,
  });
}

class ClearCart extends CartEvent {}