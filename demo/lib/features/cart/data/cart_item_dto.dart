import 'package:demo/features/cart/domain/cart_item.dart';

class CartItemDto {
  final int id;
  final int shoeId; 
  final String username;
  
  const CartItemDto({
    required this.id,
    required this.shoeId,
    required this.username,
  });

  factory CartItemDto.fromJson(Map<String, dynamic> json) {
    return CartItemDto(
      id: json['id'] as int,
      shoeId: json['shoe_id'] as int,
      username: json['username'] as String,
    );
  }

  CartItem toDomain() {
    return CartItem(
      id: id,
      shoeId: shoeId,
    );
  }
}