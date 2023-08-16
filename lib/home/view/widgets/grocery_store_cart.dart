// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_store_app/home/home.dart';

class GroceryStoreCart extends StatelessWidget {
  GroceryStoreCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Cart',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: context.read<HomeBloc>().productsInCart.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var element = context.read<HomeBloc>().productsInCart[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(element.product.name),
                    onDismissed: (direction) {
                      context
                          .read<HomeBloc>()
                          .add(RemoveProductToCart(element));
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(element.product.image),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${element.quantity}  x     ${element.product.name}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 17),
                        ),
                        const Spacer(),
                        Text(
                          '\$${element.product.price}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(color: Colors.grey, fontSize: 25),
                ),
                Text(
                  '\$${context.read<HomeBloc>().totalCartPrice().toStringAsFixed(2)}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color(0xFFF4C459)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 13),
              child: Text(
                'Pay',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
