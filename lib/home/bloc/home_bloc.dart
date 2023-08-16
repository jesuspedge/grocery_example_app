import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:data_repository/data_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ChangePage>(_onChangePage);
    on<AddProductToCart>(_addProductToCart);
    on<RemoveProductToCart>(_onRemoveProductToCart);
  }

  List<GroceryProduct> catalog = List.unmodifiable(groceryProductsList);
  List<ProductInCart> productsInCart = [];

  void _onChangePage(ChangePage event, Emitter<HomeState> emit) {
    switch (event.status) {
      case HomeStatus.list:
        emit(const HomeState.enableList());
        break;
      case HomeStatus.cart:
        emit(const HomeState.enableCart());
        break;
      case HomeStatus.details:
        emit(const HomeState.enableDetails());
        break;
    }
  }

  void _addProductToCart(AddProductToCart event, Emitter<HomeState> emit) {
    for (ProductInCart element in productsInCart) {
      if (element.product.name == event.product.name) {
        element.quantity = element.quantity + event.quantity;
        emit(const HomeState.enableList());
        return;
      }
    }
    productsInCart
        .add(ProductInCart(product: event.product, quantity: event.quantity));
    emit(const HomeState.enableList());
  }

  void _onRemoveProductToCart(
      RemoveProductToCart event, Emitter<HomeState> emit) {
    productsInCart.remove(event.productInCart);
    emit(const HomeState.enableCart());
  }

  int totalCartElements() => productsInCart.fold<int>(
      0, (previousValue, fruit) => previousValue + fruit.quantity);

  double totalCartPrice() => productsInCart.fold<double>(
      0,
      (previousValue, productInCart) =>
          previousValue + productInCart.product.price * productInCart.quantity);
}

class ProductInCart {
  ProductInCart({this.quantity = 1, required this.product});

  int quantity;
  final GroceryProduct product;
}
