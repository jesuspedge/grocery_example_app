import 'package:flutter/material.dart';
import 'package:data_repository/data_repository.dart';

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

  void addProductToCart(GroceryProduct fruit, int quantity) {
    for (GroceryProductSelected product in cart) {
      if (product.fruit.name == fruit.name) {
        product.quantity = product.quantity + quantity;
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductSelected(fruit: fruit, quantity: quantity));
    notifyListeners();
  }

  void removeProductToCart(GroceryProductSelected product) {
    cart.remove(product);
    notifyListeners();
  }

  int totalCartElements() => cart.fold<int>(
      0, (previousValue, fruit) => previousValue + fruit.quantity);

  double totalCartPrice() => cart.fold<double>(
      0,
      (previousValue, product) =>
          previousValue + product.fruit.price * product.quantity);
}

class GroceryProductSelected {
  GroceryProductSelected({this.quantity = 1, required this.fruit});

  int quantity;
  final GroceryProduct fruit;

  void increment() {
    quantity++;
  }

  void decrement() {
    quantity--;
  }
}
