part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class ChangePage extends HomeEvent {
  const ChangePage({this.status = HomeStatus.list});

  final HomeStatus status;
}

final class AddProductToCart extends HomeEvent {
  AddProductToCart(this.product, this.quantity);

  final GroceryProduct product;
  final int quantity;
}

final class RemoveProductToCart extends HomeEvent {
  final ProductInCart productInCart;

  RemoveProductToCart(this.productInCart);
}
