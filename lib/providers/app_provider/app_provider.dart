import 'package:flutter/material.dart';
import 'package:grocery_store_app/app/app.dart';

class AppProvider extends InheritedWidget {
  const AppProvider({super.key, required this.bloc, required this.child})
      : super(child: child);

  final AppBloc bloc;
  // ignore: annotate_overrides, overridden_fields
  final Widget child;

  static AppProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
