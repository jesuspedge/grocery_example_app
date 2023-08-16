import 'package:flutter/material.dart';
import 'package:data_repository/data_repository.dart';

enum HomeStateOld { list, details, cart }

class HomeBlocOld with ChangeNotifier {
  HomeStateOld homeState = HomeStateOld.list;
  List<GroceryProduct> catalog = List.unmodifiable(groceryProductsList);
  List<GroceryProductSelectedOld> cart = [];

  void changeToList() {
    homeState = HomeStateOld.list;
    notifyListeners();
  }

  void changeToCart() {
    homeState = HomeStateOld.cart;
    notifyListeners();
  }

  void addProductToCart(GroceryProduct fruit, int quantity) {
    for (GroceryProductSelectedOld product in cart) {
      if (product.fruit.name == fruit.name) {
        product.quantity = product.quantity + quantity;
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductSelectedOld(fruit: fruit, quantity: quantity));
    notifyListeners();
  }

  void removeProductToCart(GroceryProductSelectedOld product) {
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

class GroceryProductSelectedOld {
  GroceryProductSelectedOld({this.quantity = 1, required this.fruit});

  int quantity;
  final GroceryProduct fruit;

  void increment() {
    quantity++;
  }

  void decrement() {
    quantity--;
  }
}
