class Item {
  String name;
  int price;
  String imageUrl;
  String description;
  double rating;
  int stock;
  String category;

  Item({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.stock,
    this.category = 'Fashion',
  });
}
