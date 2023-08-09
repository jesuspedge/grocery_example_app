import 'package:flutter/material.dart';
import 'package:grocery_store_app/data_repository/data_repository.dart';

class FruitDetails extends StatelessWidget {
  final GroceryProduct fruit;

  const FruitDetails({Key? key, required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Hero(
                          tag: 'list_${fruit.name}',
                          child: Image.asset(
                            fruit.image,
                            fit: BoxFit.contain,
                            height: MediaQuery.sizeOf(context).height * 0.4,
                          ),
                        ),
                        Text(
                          fruit.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          fruit.weight,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Spacer(),
                            Text(
                              '\$${fruit.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'About the product',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          fruit.decription,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.black26,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 5,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color(0xFFF4C459)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*Hero(
          tag: 'list_${fruit.name}',
          child: Image.asset(
            fruit.image,
            fit: BoxFit.cover,
          ),
        ),*/