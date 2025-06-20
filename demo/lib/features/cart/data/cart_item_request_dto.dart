class CartItemRequestDto {
  final int shoeId;
  final String username;

  CartItemRequestDto({
    required this.shoeId,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'shoe_id': shoeId,
      'username': username,
    };
  }
  
}