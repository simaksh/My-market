class SellerHomeDto{
  final String title;
  final String? image, description;
  final List<String> colors;
  final int price, count;
  final String id;
  final bool isActive;
  final String ?sellerId;

  SellerHomeDto(
      this.image,
      this.description,
      this.colors, {
        required this.id,
        required this.title,
        required this.price,
        required this.sellerId,
        required this.count,
        required this.isActive,
      });

  Map<String , dynamic> toJson(){
    return {
      'id' : id ,
      'image' : image ,
      'description' : description ,
      'colors' : colors ,
      'tittle' : title ,
      'price' : price ,
      'sellerId' : sellerId ,
      'count' : count ,
      'isActive' : isActive ,
    };
  }
}