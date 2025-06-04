import 'package:demo/features/home/domain/entities/shoe.dart';

class ShoeDto {
  final int id;
  final String name;
  final String brand;
  final String image;
  final int price;

  ShoeDto({
    required this.id,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
  });

  factory ShoeDto.fromJson(Map<String, dynamic> json) {
    return ShoeDto(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      image: json['image'],
      price: json['price'],
    );
  }

  Shoe toDomain() {
    return Shoe(id: id, name: name, brand: brand, image: image, price: price);
  }
}
