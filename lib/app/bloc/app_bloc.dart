import 'package:flutter/material.dart';

enum AppThemeState { light, dark }

class AppBloc with ChangeNotifier {
  AppThemeState appThemeState = AppThemeState.light;

  void changeTheme() {
    if (appThemeState == AppThemeState.light) {
      appThemeState = AppThemeState.dark;
    } else {
      appThemeState = AppThemeState.light;
    }
    notifyListeners();
  }
}
