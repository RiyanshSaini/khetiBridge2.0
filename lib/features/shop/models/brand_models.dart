class BrandModel {
  final String name;
  final String image;
  final int? productsCount;

  BrandModel({
    required this.name,
    required this.image,
    this.productsCount,
  });
}
