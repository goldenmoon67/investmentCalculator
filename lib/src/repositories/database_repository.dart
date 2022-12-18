import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';

abstract class DatabaseRepository {
  Future<void> save2Favorite(FavoriteModel favoriteModel);
  Future<void> removeFromFavs(FavoriteModel favoriteModel);
  Future<List<FavoriteModel>> getFavorites();
}
