import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/favorites/presentation/widgets/favorite_shoe_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<FavoriteShoe> favorites = [
      const FavoriteShoe(
        id: 1,
        name: 'Nike Air Max',
        image:
            'https://images.footlocker.com/is/image/EBFL2/IE1377_01?wid=500&hei=500&fmt=png',
        price: 150,
      ),
      const FavoriteShoe(
        id: 2,
        name: 'Adidas Ultraboost',
        image:
            'https://images.footlocker.com/is/image/EBFL2/IE1377_01?wid=500&hei=500&fmt=png',
        price: 180,
      ),
      const FavoriteShoe(
        id: 3,
        name: 'Puma RS-X',
        image:
            'https://images.footlocker.com/is/image/EBFL2/IE1377_01?wid=500&hei=500&fmt=png',
        price: 120,
      ),
    ];
    return Scaffold(
      body: FavoriteShoeListView(
        favorites: favorites,
      ),
    );
  }
}
