part of 'home_bloc.dart';

enum HomeStatus { list, details, cart }

final class HomeState extends Equatable {
  const HomeState(
      {this.status = HomeStatus.list,
      this.productsInCart = const [],
      this.total = 0});

  final HomeStatus status;
  final List<ProductInCart> productsInCart;
  final double total;

  const HomeState.enableList(List<ProductInCart> products, double totalResult)
      : status = HomeStatus.list,
        productsInCart = products,
        total = totalResult;

  const HomeState.enableDetails(
      List<ProductInCart> products, double totalResult)
      : status = HomeStatus.details,
        productsInCart = products,
        total = totalResult;

  const HomeState.enableCart(List<ProductInCart> products, double totalResult)
      : status = HomeStatus.cart,
        productsInCart = products,
        total = totalResult;

  @override
  List<Object> get props => [status, productsInCart, total];
}
