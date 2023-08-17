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
  double totalPrice = 0;

  void _onChangePage(ChangePage event, Emitter<HomeState> emit) {
    switch (event.status) {
      case HomeStatus.list:
        emit(HomeState.enableList(productsInCart, totalPrice));
        break;
      case HomeStatus.cart:
        emit(HomeState.enableCart(productsInCart, totalPrice));
        break;
      case HomeStatus.details:
        emit(HomeState.enableDetails(productsInCart, totalPrice));
        break;
    }
  }

  void _addProductToCart(AddProductToCart event, Emitter<HomeState> emit) {
    for (ProductInCart element in productsInCart) {
      if (element.product.name == event.product.name) {
        element.quantity = element.quantity + event.quantity;
        totalPrice = totalCartPrice();
        emit(HomeState.enableList(productsInCart, totalPrice));
        return;
      }
    }

    productsInCart
        .add(ProductInCart(product: event.product, quantity: event.quantity));
    totalPrice = totalCartPrice();
    emit(HomeState.enableList(productsInCart, totalPrice));
  }

  void _onRemoveProductToCart(
      RemoveProductToCart event, Emitter<HomeState> emit) {
    productsInCart.remove(event.productInCart);
    totalPrice = totalCartPrice();
    emit(HomeState.enableCart(productsInCart, totalPrice));
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
