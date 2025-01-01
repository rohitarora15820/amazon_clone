import 'dart:convert';

class ProductModel {
  final String name;
  final String description;
  final String category;
  final String? id;
  final double quantity;
  final double price;
  final List<String> images;

  ProductModel({
    required this.name,
    required this.description,
    required this.category,
    this.id,
    required this.quantity,
    required this.price,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'category': category,
      '_id': id,
      'quantity': quantity,
      'price': price,
      'images': images,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      id: map['_id'],
      quantity: map['quantity']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
