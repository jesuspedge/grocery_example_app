import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:grocery_store_app/home/home.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    log('Event: ${event.runtimeType}');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    if (change.nextState is HomeState) {
      HomeState state = change.nextState;
      List<ProductInCart> products = state.productsInCart;
      List<String> namesOfProducts = [];
      for (var element in products) {
        namesOfProducts.add('${element.product.name} x ${element.quantity}');
      }
      log('Change: ${state.status}, $namesOfProducts, ${state.total}');
    } else {
      log('Change: ${change.nextState}');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('Change: ${error.toString()}');
  }
}
