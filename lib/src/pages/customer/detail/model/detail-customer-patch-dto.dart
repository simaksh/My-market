class DetailCustomerPathDto{
  final String title;
  final String? image, description,userId;
  final List<String> colors;
  final int price, count, selectedCount;
  final String id,productId;

  DetailCustomerPathDto(
      this.image,
      this.description,
      this.colors, {
        required this.id,
        required this.userId,
        required this.productId,
        required this.title,
        required this.price,
        required this.count,
        required this.selectedCount,
      });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'productId': productId,
      'tittle': title,
      'description': description,
      'count': count,
      'price': price,
      'image': image,
      'colors': colors,
      'selectedCount': selectedCount,
    };
  }
}