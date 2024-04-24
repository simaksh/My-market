

class ShoppingCartDto{
  final String title;
  final String? image, description;
  final List<String> colors;
  final int price, count;
  final String id;
  final bool isActive;

  ShoppingCartDto(
      this.image,
      this.description,
      this.colors, {
        required this.id,
        required this.title,
        required this.price,
        required this.count,
      }) : isActive = true ;

  Map<String , dynamic> toJson(){
    return{
      'id': id,
      'tittle': title,
      'description': description,
      'count': count,
      'price': price,
      'image': image,
      'colors': colors,
      'isActive': isActive,
    };
  }
}