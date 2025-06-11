import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/favorites/presentation/widgets/favorite_shoe_card_view.dart';
import 'package:flutter/material.dart';

class FavoriteShoeListView extends StatelessWidget {
  const FavoriteShoeListView({super.key, required this.favorites});
  final List<FavoriteShoe> favorites;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final shoe = favorites[index];
        return FavoriteShoeCardView(shoe: shoe);
      });
  }
}

