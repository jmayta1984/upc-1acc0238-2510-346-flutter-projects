import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';

abstract class FavoriteEvent {
  const FavoriteEvent();
}

class AddFavoriteEvent extends FavoriteEvent {
  final FavoriteShoe favoriteShoe;
  const AddFavoriteEvent({required this.favoriteShoe});
}

class RemoveFavoriteEvent extends FavoriteEvent {
  final int id;
  const RemoveFavoriteEvent({required this.id});
}

class GetAllFavoriteEvent extends FavoriteEvent {}

