import 'package:flutter/material.dart';
import 'package:grocery_store_app/data_repository/data_repository.dart';

enum HomeState { list, details, cart }

class HomeBloc with ChangeNotifier {
  HomeState homeState = HomeState.list;
  List<GroceryProduct> catalog = List.unmodifiable(groceryProductsList);
  List<GroceryProductSelected> cart = [];

  void changeToList() {
    homeState = HomeState.list;
    notifyListeners();
  }

  void changeToCart() {
    homeState = HomeState.cart;
    notifyListeners();
  }

  void addProductToCart(GroceryProduct fruit) {
    for (GroceryProductSelected product in cart) {
      if (product.fruit.name == fruit.name) {
        product.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductSelected(fruit: fruit));
    notifyListeners();
  }
}

class GroceryProductSelected {
  GroceryProductSelected({this.quantity = 1, required this.fruit});

  int quantity;
  final GroceryProduct fruit;

  void increment() {
    quantity++;
  }

  void decrement() {}
}
