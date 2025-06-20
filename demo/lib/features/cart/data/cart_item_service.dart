import 'dart:convert';
import 'dart:io';
import 'package:demo/features/cart/data/cart_item_dto.dart';
import 'package:demo/features/cart/data/cart_item_request_dto.dart';
import 'package:demo/features/cart/domain/cart_item.dart';
import 'package:http/http.dart' as http;


class CartItemService {
  Future<CartItem> addCartItem(int shoeId, String username) async {
    final Uri uri = Uri.parse('https://sugary-wool-penguin.glitch.me/items');
    http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        CartItemRequestDto(shoeId: shoeId, username: username).toJson(),
      ),
    );
      if (response.statusCode == HttpStatus.created) {
        final json = jsonDecode(response.body);
        return CartItemDto.fromJson(json).toDomain();
      }
      throw Exception('Failed to add item to cart');
    
  }
}