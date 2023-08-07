import 'package:flutter/material.dart';

const Color _appBarBackgroundColor = Color(0xFFF6F5F2);
const Color _listBackgroundColor = Colors.white;
const Color _backgroundColor = Colors.black;
const _cartBarHeight = 100.0;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: _backgroundColor,
          child: Column(
            children: [
              const _AppGroceryAppBarr(),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: -_cartBarHeight,
                      height: size.height - kToolbarHeight,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: _listBackgroundColor,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30))),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: size.height - kTextTabBarHeight - _cartBarHeight,
                      height: size.height,
                      child: Container(
                        color: _backgroundColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppGroceryAppBarr extends StatelessWidget {
  const _AppGroceryAppBarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: _appBarBackgroundColor,
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
