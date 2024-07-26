class ProductModel {
  final String title;
  final int productCount;
  final String imageUrl;

  ProductModel({
    required this.title,
    required this.productCount,
    required this.imageUrl,
  });
}

final List<ProductModel> products = [
  ProductModel(
    title: 'New Arrivals',
    productCount: 208,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpQiS6CnUvl0ZZDfcQah6k3OoFFTrVy2zDOQ&s',
  ),
  ProductModel(
    title: 'Clothes',
    productCount: 358,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbdmlgsOYF7Wtujz21xSk65kyHHz1yOMmKcQ&s',
  ),
  ProductModel(
    title: 'Bags',
    productCount: 160,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdeoIzyivSK73TP8ZpjG5LAt2CJZpknkp0VA&s',
  ),
  ProductModel(
    title: 'Shoes',
    productCount: 230,
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdeoIzyivSK73TP8ZpjG5LAt2CJZpknkp0VA&s',
  ),
  ProductModel(
    title: 'Electronics',
    productCount: 130,
    imageUrl:
        'https://files.cdn.printful.com/o/upload/blog-post-img-upload/b8/b8d322f371c7cd4a87cc8523d59429d1_t',
  ),
  ProductModel(
    title: 'Jewelry',
    productCount: 87,
    imageUrl:
        'https://files.cdn.printful.com/o/upload/blog-post-img-upload/b8/b8d322f371c7cd4a87cc8523d59429d1_t',
  ),
];
