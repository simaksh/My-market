class SellerHomeViewModel {
  final String title;
  final String ?description;
  final String? image;
  final List<String> colors;
  final int price, count;
  final String id;
  final bool isActive;

  SellerHomeViewModel(
      this.image,
      this.description,
      this.colors, {
        required this.id,
        required this.title,
        required this.price,
        required this.count,
        required this.isActive,
      });

  factory SellerHomeViewModel.fromJson(Map<String, dynamic> json) {
    return SellerHomeViewModel(
      json['image'],
      json['description'],
      json['colors'].cast<String>(),
      id: json['id'],
      title: json['tittle'],
      price: json['price'],
      count: json['count'],
      isActive: json['isActive'],
    );
  }
}