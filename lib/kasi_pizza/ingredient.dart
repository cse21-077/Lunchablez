class Ingredient {
  const Ingredient(this.image);
  final String image;

  // boolean st
bool compare(Ingredient ingredient) => ingredient.image == image;
}



// Ingrids init and images list

final Ingredients = const <Ingredient>[
  Ingredient('lib/assets/pizza_ods/chili.png'),
  Ingredient('lib/assets/pizza_ods/garlic.png'),
  Ingredient('lib/assets/pizza_ods/olive.png'),
  Ingredient('lib/assets/pizza_ods/onion.png'),
  Ingredient('lib/assets/pizza_ods/pea.png'),
  Ingredient('lib/assets/pizza_ods/pickle.png'),
  Ingredient('lib/assets/pizza_ods/potato.png'),
];
