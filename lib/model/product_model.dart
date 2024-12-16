class ProductModel {
  int id;
  String title;
  // String brand;
  String description;
  double price;
  double rating;
  String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    // required this.brand,
    required this.description,
    required this.price,
    required this.rating,
    required this.thumbnail,
  });

  static fromMapToObject(Map<String, dynamic> map) {
    return ProductModel(
        id: map['id'],
        title: map['title'],
        // brand: map['brand'],
        description: map['description'],
        price: map['price'],
        rating: map['rating'],
        thumbnail: map['thumbnail']);
  }
}
