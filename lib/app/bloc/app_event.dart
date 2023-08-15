part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

// ignore: unused_element
final class AppThemeChanged extends AppEvent {
  const AppThemeChanged({this.enableLightTheme = true});

  final bool enableLightTheme;
}
