import 'package:flutter/material.dart';
import 'package:grocery_store_app/data_repository/data_repository.dart';

enum HomeState { list, details, cart }

class HomeBloc with ChangeNotifier {
  HomeState homeState = HomeState.list;
  List<GroceryProduct> catalog = List.unmodifiable(groceryProductsList);

  void changeToList() {
    homeState = HomeState.list;
    notifyListeners();
  }

  void changeToCart() {
    homeState = HomeState.cart;
    notifyListeners();
  }
}
