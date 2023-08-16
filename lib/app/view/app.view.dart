import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_store_app/app/app.dart';
import 'package:grocery_store_app/home/home.dart';
import 'package:grocery_store_app/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState appState = const AppState(themeState: AppThemeState.light);
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AppBloc(appState)),
      BlocProvider(create: (context) => HomeBloc())
    ], child: const AppView());
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:
              state.themeState == AppThemeState.light ? lightTheme : darkTheme,
          home: const HomePage(),
        );
      },
    );
  }
}
