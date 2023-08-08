import 'package:flutter/material.dart';
import 'package:grocery_store_app/home/home.dart';
import 'package:grocery_store_app/providers/providers.dart';

class GroceryStoreList extends StatelessWidget {
  const GroceryStoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = GroceryProvider.of(context)!.bloc;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.transparent,
      child: SatggeredDualView(
        itemCount: homeBloc.catalog.length,
        aspectRatio: 0.7,
        spacing: 10.0,
        itemBuilder: (context, index) {
          final fruit = homeBloc.catalog[index];
          return Card(
            elevation: 10.0,
            shadowColor: Colors.black26,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Image.asset(
                  fruit.image,
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                )
              ],
            ),
          );
        },
      ),
    );
    /*return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
          padding: const EdgeInsets.only(top: cartBarHeight),
          itemCount: homeBloc.catalog.length,
          itemBuilder: (contex, index) {
            return Container(
              height: 100,
              width: 100,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }),
    );*/
  }
}
