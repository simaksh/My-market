class DetailCustomerPostDto{
  final String tittle,  productId;
  final String? image, description, userId;
  final List<String> colors;
  final int price, count, selectedCount;
  DetailCustomerPostDto(
      this.image,
      this.description,
      this.colors, {
        required this.userId,
        required this.productId,
        required this.tittle,
        required this.price,
        required this.count,
        required this.selectedCount,
      });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'productId': productId,
      'tittle': tittle,
      'description': description,
      'count': count,
      'price': price,
      'image': image,
      'colors': colors,
      'selectedCount': selectedCount,
    };
  }
}