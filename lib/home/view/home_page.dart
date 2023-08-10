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
      return -cartBarHeight + kToolbarHeight;
    } else if (state == HomeState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    }
    return -cartBarHeight;
  }

  double _getTopForCartPanel(HomeState state, Size size) {
    if (state == HomeState.list) {
      return size.height - cartBarHeight;
    } else if (state == HomeState.cart) {
      return cartBarHeight / 2;
    }
    return size.height - cartBarHeight;
  }

  double _getTopForAppBar(HomeState state) {
    if (state == HomeState.list) {
      return 0.0;
    } else if (state == HomeState.cart) {
      return -cartBarHeight;
    }
    return 0.0;
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
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      curve: Curves.decelerate,
                      duration: _panelTransitionDuration,
                      left: 0,
                      right: 0,
                      top: _getTopForListPanel(homeBloc.homeState, size),
                      height: size.height - kToolbarHeight,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(30)),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: _listBackgroundColor,
                          ),
                          child: const GroceryStoreList(),
                        ),
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
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Cart',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: List.generate(
                                              homeBloc.cart.length,
                                              (index) => Hero(
                                                tag:
                                                    'list_${homeBloc.cart[index].fruit.name}toCart',
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 3),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: AssetImage(
                                                        homeBloc.cart[index]
                                                            .fruit.image),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Color(0xFFF4C459),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Placeholder()
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                        curve: Curves.decelerate,
                        duration: _panelTransitionDuration,
                        left: 0,
                        right: 0,
                        top: _getTopForAppBar(homeBloc.homeState),
                        child: const _AppGroceryAppBarr()),
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
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Fruits and vegetables',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.display_settings_rounded),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
