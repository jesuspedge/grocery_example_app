class GroceryProduct {
  GroceryProduct({
    required this.price,
    required this.name,
    required this.decription,
    required this.image,
    required this.weight,
  });

  final double price;
  final String name;
  final String decription;
  final String image;
  final String weight;
}

List<GroceryProduct> groceryProductsList = <GroceryProduct>[
  GroceryProduct(
    price: 9.30,
    name: 'Avocado',
    decription:
        'Avocados are native to the Western Hemisphere from Mexico south to the Andean regions and are widely grown in warm climates. Avocado fruits have greenish or yellowish flesh with a buttery consistency and a rich nutty flavour.',
    image: 'assets/images/Avocado.png',
    weight: '500g',
  ),
  GroceryProduct(
    price: 11.00,
    name: 'Banana',
    decription:
        'A banana is an elongated, edible fruit produced by several kinds of large herbaceous flowering plants in the genus Musa.',
    image: 'assets/images/Banana.png',
    weight: '1 kg',
  ),
  GroceryProduct(
    price: 15.40,
    name: 'Mango',
    decription:
        'A mango is an edible stone fruit produced by the tropical tree Mangifera indica. It is believed to have originated in southern Asia, particularly in eastern India, Bangladesh, and the Andaman Islands.',
    image: 'assets/images/Mango.png',
    weight: '500g',
  ),
  GroceryProduct(
    price: 4.15,
    name: 'Pineapple',
    decription:
        'The pineapple is a tropical plant with an edible fruit; it is the most economically significant plant in the family Bromeliaceae.',
    image: 'assets/images/Pineapple.png',
    weight: '1 kg',
  ),
  GroceryProduct(
    price: 10.20,
    name: 'Cherry',
    decription:
        'A cherry is the fruit of many plants of the genus Prunus, and is a fleshy drupe (stone fruit).',
    image: 'assets/images/Cherry.png',
    weight: '500g',
  ),
  GroceryProduct(
    price: 8.50,
    name: 'Quince',
    decription:
        'The quince is the sole member of the genus Cydonia in the Malinae subtribe (which also contains apples and pears, among other fruits) of the Rosaceae family.',
    image: 'assets/images/Quince.png',
    weight: '500g',
  ),
  GroceryProduct(
    price: 7.80,
    name: 'Kiwi',
    decription:
        'Kiwi has a thin, fuzzy, fibrous, tart but edible light brown skin and light green or golden flesh with rows of tiny, black, edible seeds. The fruit has a soft texture with a sweet and unique flavour.',
    image: 'assets/images/Kiwi.png',
    weight: '1 kg',
  ),
  GroceryProduct(
    price: 12.10,
    name: 'Watermelon',
    decription:
        'Watermelon is grown in favorable climates from tropical to temperate regions worldwide for its large edible fruit, which is a berry with a hard rind and no internal divisions, and is botanically called a pepo.',
    image: 'assets/images/Watermelon.png',
    weight: '500g',
  ),
];
