class DetailCustomerViewModel {
  final String title;
  final String? image, description;
  final List<dynamic> colors;
  final int price, count;
  final String id;
  final bool isActive;

  DetailCustomerViewModel(
      this.image,
      this.description,
      this.colors, {
        required this.id,
        required this.title,
        required this.price,
        required this.count,
        required this.isActive,
      });

  factory DetailCustomerViewModel.fromJson(Map<String, dynamic> json) {
    return DetailCustomerViewModel(
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
