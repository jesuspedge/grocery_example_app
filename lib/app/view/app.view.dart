import 'package:flutter/material.dart';
import 'package:grocery_store_app/app/app.dart';
import 'package:grocery_store_app/home/home.dart';
import 'package:grocery_store_app/providers/providers.dart';
import 'package:grocery_store_app/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final appBloc = AppBloc();

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      bloc: appBloc,
      child: AnimatedBuilder(
        animation: appBloc,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appBloc.appThemeState == AppThemeState.light
                ? lightTheme
                : darkTheme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
