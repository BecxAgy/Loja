class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});
  //método para caso for chamado, alternar entre true e false na propriedade isfavorite
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
