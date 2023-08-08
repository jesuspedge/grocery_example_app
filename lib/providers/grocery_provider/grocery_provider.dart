import 'package:flutter/material.dart';
import 'package:grocery_store_app/home/home.dart';

class GroceryProvider extends InheritedWidget {
  const GroceryProvider({super.key, required this.bloc, required this.child})
      : super(child: child);

  final HomeBloc bloc;
  // ignore: annotate_overrides, overridden_fields
  final Widget child;

  static GroceryProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GroceryProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
