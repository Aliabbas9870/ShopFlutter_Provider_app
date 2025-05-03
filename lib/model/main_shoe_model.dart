// model/main_shoe_model.dart
class Shoe {
  final String id;
  final String name;
  final String price;
  final String image;
  final String category;
  final String color;

  Shoe({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.color,
  });

  factory Shoe.fromJson(Map<String, dynamic> json) {
    return Shoe(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      category: json['category'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'category': category,
      'color': color,
    };
  }
}
