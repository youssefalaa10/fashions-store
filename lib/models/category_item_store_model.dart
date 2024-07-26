class Product {
  final String imageUrl;
  final String name;
  final String description;
  final double price;

  Product({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });
}

final List<Product> products = [
  Product(
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpQiS6CnUvl0ZZDfcQah6k3OoFFTrVy2zDOQ&s',
    name: 'Roller Rabbit',
    description: 'Vado Odelle Dress',
    price: 198.00,
  ),
  Product(
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpQiS6CnUvl0ZZDfcQah6k3OoFFTrVy2zDOQ&s',
    name: 'endless rose',
    description: 'Bubble Elastic T-shirt',
    price: 50.00,
  ),
  Product(
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpQiS6CnUvl0ZZDfcQah6k3OoFFTrVy2zDOQ&s',
    name: 'Theory',
    description: 'Irregular Rib Skirt',
    price: 345.00,
  ),
  Product(
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpQiS6CnUvl0ZZDfcQah6k3OoFFTrVy2zDOQ&s',
    name: 'Madewell',
    description: 'Giselle Top in White Linen',
    price: 69.50,
  ),
  // Add more products as needed
];
