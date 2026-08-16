import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/blocs/cart_bloc/cart_event.dart';
import 'package:store/blocs/cart_bloc/cart_state.dart';
import 'package:store/models/cart_item.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddToCart>((event, emit) {
      final index = state.items.indexWhere(
            (item) => item.product.id == event.product.id,
      );
      if (index != -1) {
        final updatedItems = List<CartItem>.from(state.items);
        final currentItem = updatedItems[index];

        updatedItems[index] = currentItem.copyWith(
          quantity: currentItem.quantity + 1,
        );

        emit(state.copyWith(items: updatedItems));
        return;
      }

      emit(
        state.copyWith(
          items: [
            ...state.items,
            CartItem(
              product: event.product,
              quantity: 1,
            ),
          ],
        ),
      );
    });

    on<IncreaseQuantity>((event, emit) {
      final index = state.items.indexWhere(
            (item) => item.product.id == event.productId,
      );

      if (index == -1) return;

      final updatedItems = List<CartItem>.from(state.items);
      final currentItem = updatedItems[index];

      updatedItems[index] = currentItem.copyWith(
        quantity: currentItem.quantity + 1,
      );

      emit(state.copyWith(items: updatedItems));
    });

    on<DecreaseQuantity>((event, emit) {
      final index = state.items.indexWhere(
            (item) => item.product.id == event.productId,
      );

      if (index == -1) return;

      final updatedItems = List<CartItem>.from(state.items);
      final currentItem = updatedItems[index];

      if (currentItem.quantity == 1) {
        updatedItems.removeAt(index);
      } else {
        updatedItems[index] = currentItem.copyWith(
          quantity: currentItem.quantity - 1,
        );
      }

      emit(state.copyWith(items: updatedItems));
    });

    on<RemoveFromCart>((event, emit) {
      final updatedItems = state.items.where(
            (item) => item.product.id != event.productId,
      ).toList();

      emit(state.copyWith(items: updatedItems));
    });

    on<ClearCart>((event, emit) {
      emit(state.copyWith(items: []));
    });
  }
}