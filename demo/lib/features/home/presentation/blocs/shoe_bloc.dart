import 'package:demo/features/favorites/data/repositories/favorite_shoe_repository.dart';
import 'package:demo/features/favorites/domain/entities/favorite_shoe.dart';
import 'package:demo/features/home/data/repositories/shoe_repository.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/blocs/shoe_event.dart';
import 'package:demo/features/home/presentation/blocs/shoe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  final _shoeRepository = ShoeRepository();
  final _favoriteShoeRepository = FavoriteShoeRepository();

  ShoeBloc() : super(InitialShoeState()) {
    on<GetShoes>((event, emit) async {
      emit(LoadingShoeState());

      try {
        List<Shoe> shoes = await _shoeRepository.getShoes();
        emit(LoadedShoeState(shoes: shoes));
      } catch (e) {
        emit(ErrorShoeState(message: e.toString()));
      }
    });

    on<ToggleShoeEvent>((event, emit) async {
      if (state is LoadedShoeState) {
        final currentShoes = (state as LoadedShoeState).shoes;

        if (event.shoe.isFavorite) {
          await _favoriteShoeRepository.deleteFavorite(event.shoe.id);
        } else {
          await _favoriteShoeRepository.insertFavorite(
            FavoriteShoe(
              id: event.shoe.id,
              name: event.shoe.name,
              image: event.shoe.image,
              price: event.shoe.price,
            ),
          );
        }

        final updatedShoes = currentShoes.map((shoe) {
          if (shoe.id == event.shoe.id) {
            return shoe.copy(isFavorite: !shoe.isFavorite);
          }
          return shoe;
        }).toList();
        emit(LoadedShoeState(shoes: updatedShoes));
      }
    });
  }
}
