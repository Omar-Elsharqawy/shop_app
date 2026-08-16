import 'package:store/models/cart_item.dart';

class CartState {
  final List<CartItem> items;

  CartState({
    this.items = const [],
  });

  int get totalItems {
    return items.fold(
      0,
          (total, item) => total + item.quantity,
    );
  }

  double get totalAmount {
    return items.fold(
      0,
          (total, item) => total + item.totalPrice,
    );
  }

  CartState copyWith({
    List<CartItem>? items,
  }) {
    return CartState(
      items: items ?? this.items,
    );
  }
}