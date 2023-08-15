import 'package:flutter/material.dart';
import 'package:grocery_store_app/home/home.dart';
import 'package:grocery_store_app/providers/providers.dart';
import 'package:grocery_store_app/app/app.dart';

class GroceryStoreList extends StatelessWidget {
  const GroceryStoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = GroceryProvider.of(context)!.bloc;

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: cartBarHeight),
      color: Colors.transparent,
      child: SatggeredDualView(
        itemCount: homeBloc.catalog.length,
        aspectRatio: 0.7,
        spacing: 3.0,
        translation: 0.2,
        itemBuilder: (context, index) {
          final fruit = homeBloc.catalog[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, __) {
                    return FadeTransition(
                      opacity: animation,
                      child: FruitDetails(
                          onProductAddedToCart: (quantity) {
                            homeBloc.addProductToCart(fruit, quantity);
                          },
                          fruit: fruit),
                    );
                  },
                ),
              );
            },
            child: Card(
              elevation: 10.0,
              shadowColor: Theme.of(context).shadowColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'list_${fruit.name}',
                        child: Image.asset(
                          fruit.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      '\$${fruit.price}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).dividerColor,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      fruit.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).dividerColor,
                          fontSize: 14),
                    ),
                    Text(
                      fruit.weight,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
