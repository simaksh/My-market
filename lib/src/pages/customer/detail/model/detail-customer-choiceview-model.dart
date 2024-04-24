class DetailCustomerChoiceViewModel{
  final String title;
  final String? image, description, userId;
  final List<String> colors;
  final int price, count, selectedCount;
  final String id,productId;

  DetailCustomerChoiceViewModel(
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

  factory DetailCustomerChoiceViewModel.fromJson(Map<String, dynamic> json) {
    return DetailCustomerChoiceViewModel(
      json['image'],
      json['description'],
      json['colors'].cast<String>(),
      id: json['id'],
      title: json['tittle'],
      price: json['price'],
      count: json['count'],
      userId: json['userId'],
      productId: json['productId'],
      selectedCount: json['selectedCount'],
    );
  }
}