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




class ManShoe {
  final String id;
  final String name;
  final String price;
  final String image;
  final String category;
  final String color;

  ManShoe({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.color,
  });

  factory ManShoe.fromJson(Map<String, dynamic> json) {
    return ManShoe(
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




class WomanShoe {
  final String id;
  final String name;
  final String price;
  final String image;
  final String category;
  final String color;

WomanShoe({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.color,
  });

  factory WomanShoe.fromJson(Map<String, dynamic> json) {
    return WomanShoe(
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

