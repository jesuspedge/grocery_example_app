import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(AppState appState)
      : super(appState.themeState == AppThemeState.light
            ? const AppState.enableLightTheme()
            : const AppState.enableDarkTheme()) {
    on<AppThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(AppThemeChanged event, Emitter<AppState> emit) {
    emit(event.enableLightTheme
        ? const AppState.enableLightTheme()
        : const AppState.enableDarkTheme());
  }
}
