import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:grocery_store_app/app/app.dart';

void main() {
  Bloc.observer = const AppBlocObserver();

  runApp(const App());
}
