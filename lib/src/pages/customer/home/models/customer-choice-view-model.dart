class CustomerChoiceViewModel{
  final String title;
  final String? image, description;
  final List<String> colors;
  final int price, count, selectedCount, id, userId, productId;

  CustomerChoiceViewModel(
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

  factory CustomerChoiceViewModel.fromJson(Map<String , dynamic> json){
    return CustomerChoiceViewModel(
      json['image'],
      json['description'],
      json['colors'].cast<String>(),
      id: json['id'],
      userId: json['userId'],
      productId: json['productId'],
      title: json['tittle'],
      price: json['price'],
      count: json['count'],
      selectedCount: json['selectedCount'],
    );
  }
}