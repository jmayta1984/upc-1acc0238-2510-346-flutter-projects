import 'package:demo/features/favorites/data/datasources/favorite_shoe_dao.dart';
import 'package:demo/features/home/data/datasources/shoe_service.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';

class ShoeRepository {
  final ShoeService _service = ShoeService();
  final FavoriteShoeDao _dao = FavoriteShoeDao();

  Future<List<Shoe>> getShoes() async {
    final shoeDtos = await _service.getShoes();
    final favoriteDtos = await _dao.fetchAll();

    final ids = favoriteDtos.map((dto) => dto.id).toList();

    return shoeDtos
        .map((dto) => dto.toDomain(isFavorite: ids.contains(dto.id)))
        .toList();
  }
}
