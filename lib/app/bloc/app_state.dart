part of 'app_bloc.dart';

enum AppThemeState { light, dark }

final class AppState extends Equatable {
  const AppState({this.themeState = AppThemeState.light});

  final AppThemeState themeState;

  const AppState.enableLightTheme() : themeState = AppThemeState.light;

  const AppState.enableDarkTheme() : themeState = AppThemeState.dark;

  @override
  List<Object> get props => [themeState];
}
