import 'dart:convert';
import 'dart:io';

import 'package:demo/features/home/data/models/shoe_dto.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:http/http.dart' as http;

class ShoeService {
  Future<List<Shoe>> getShoes() async {
    final Uri uri = Uri.parse('https://sugary-wool-penguin.glitch.me/shoes');
    http.Response response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      List maps = jsonDecode(response.body);
      return maps.map((e) => ShoeDto.fromJson(e).toDomain()).toList();
    }
    return [];
  }
}
