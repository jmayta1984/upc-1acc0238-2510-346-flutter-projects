import 'package:demo/features/home/domain/entities/shoe.dart';

class ShoeDto {
  final int id;
  final String name;
  final String brand;
  final String image;
  final int price;
  final String description;
  final double rating;
  final List<ShoeSizeDto> sizes;
  final String category;

  const ShoeDto({
    required this.id,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.description,
    required this.rating,
    required this.sizes,
    required this.category,
  });

  factory ShoeDto.fromJson(Map<String, dynamic> json) {
    return ShoeDto(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      rating: json['rating']?.toDouble() ?? 0.0,
      category: json['category'],
      sizes: (json['sizes_available'] as List)
          .map((size) => ShoeSizeDto.fromJson(size as Map<String, dynamic>))
          .toList(),
    );
  }

  Shoe toDomain({bool isFavorite = false}) {
    return Shoe(
      id: id,
      name: name,
      brand: brand,
      image: image,
      price: price,
      description: description,
      rating: rating,
      sizes: sizes.map((size) => size.toDomain()).toList(),
      category: category,
      isFavorite: isFavorite,
    );
  }
}

class ShoeSizeDto {
  final double size;
  final int stock;

  const ShoeSizeDto({required this.size, required this.stock});

  factory ShoeSizeDto.fromJson(Map<String, dynamic> json) {
    return ShoeSizeDto(
      size: json['size']?.toDouble() ?? 0.0,
      stock: json['quantity'],
    );
  }

  ShoeSize toDomain() {
    return ShoeSize(size: size.toString(), stock: stock);
  }
}
