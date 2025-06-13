import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';

abstract class FavoriteState {
  const FavoriteState();
}

class InitialFavoriteState extends FavoriteState {}

class LoadedFavoriteState extends FavoriteState {
  final List<FavoriteShoe> favorites;
  const LoadedFavoriteState({required this.favorites});
}
