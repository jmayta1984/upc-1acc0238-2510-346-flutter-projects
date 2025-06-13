import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';

class FavoriteShoeDto {
  final int id;
  final String name;
  final String image;
  final int price;

  const FavoriteShoeDto({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory FavoriteShoeDto.fromDomain(FavoriteShoe shoe) {
    return FavoriteShoeDto(
      id: shoe.id,
      name: shoe.name,
      image: shoe.image,
      price: shoe.price,
    );
  }

  FavoriteShoe toDomain() {
    return FavoriteShoe(id: id, name: name, image: image, price: price);
  }

  factory FavoriteShoeDto.fromMap(Map<String, dynamic> map) {
    return FavoriteShoeDto(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'image': image, 'price': price};
  }
}
