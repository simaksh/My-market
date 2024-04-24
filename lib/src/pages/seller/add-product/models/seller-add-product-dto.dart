class SellerAddProductDto {
  final String tittle;
  final String ?sellerId;
  final String? description , image;
  final int count, price;
  final List<String> colors;
  final bool isActive;

  SellerAddProductDto(
      this.description,
      this.image,
      this.colors, {
        required this.tittle,
        required this.count,
        required this.price,
        required this.sellerId,
      })  : isActive = true;

  Map<String, dynamic> toJson() {
    return {
      'tittle': tittle,
      'description': description,
      'count': count,
      'price': price,
      'sellerId': sellerId,
      'image': image,
      'colors': colors,
      'isActive': isActive,
    };
  }
}
