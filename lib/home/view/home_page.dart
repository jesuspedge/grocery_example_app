import 'package:flutter/material.dart';
import 'package:grocery_store_app/home/home.dart';
import 'package:grocery_store_app/providers/providers.dart';

const Color _listBackgroundColor = Color(0xFFF5F5F5);
const Color _backgroundColor = Colors.black;
const cartBarHeight = 100.0;
const _panelTransitionDuration = Duration(milliseconds: 500);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeBloc = HomeBloc();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -7) {
      homeBloc.changeToCart();
    } else if (details.primaryDelta! > 10) {
      homeBloc.changeToList();
    }
  }

  double _getTopForListPanel(HomeState state, Size size) {
    if (state == HomeState.list) {
      return -cartBarHeight;
    } else if (state == HomeState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    }
    return -cartBarHeight;
  }

  double _getTopForCartPanel(HomeState state, Size size) {
    if (state == HomeState.list) {
      return size.height - kToolbarHeight - cartBarHeight;
    } else if (state == HomeState.cart) {
      return cartBarHeight / 2;
    }
    return size.height - kToolbarHeight - cartBarHeight;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return GroceryProvider(
      bloc: homeBloc,
      child: AnimatedBuilder(
          animation: homeBloc,
          builder: (context, _) {
            return Scaffold(
              backgroundColor: _backgroundColor,
              body: SafeArea(
                child: Column(
                  children: [
                    const _AppGroceryAppBarr(),
                    Expanded(
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            curve: Curves.decelerate,
                            duration: _panelTransitionDuration,
                            left: 0,
                            right: 0,
                            top: _getTopForListPanel(homeBloc.homeState, size),
                            height: size.height - kToolbarHeight,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: _listBackgroundColor,
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(30))),
                              child: const GroceryStoreList(),
                            ),
                          ),
                          AnimatedPositioned(
                            curve: Curves.decelerate,
                            duration: _panelTransitionDuration,
                            left: 0,
                            right: 0,
                            top: _getTopForCartPanel(homeBloc.homeState, size),
                            height: size.height,
                            child: GestureDetector(
                              onVerticalDragUpdate: _onVerticalGesture,
                              child: Container(
                                color: _backgroundColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class _AppGroceryAppBarr extends StatelessWidget {
  const _AppGroceryAppBarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: _listBackgroundColor,
      child: Row(
        children: [
          const BackButton(
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Fruits and Vegatbles',
              style: TextStyle(color: Colors.black),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings_input_composite_rounded),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
