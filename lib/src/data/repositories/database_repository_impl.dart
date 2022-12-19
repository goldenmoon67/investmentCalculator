import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:crypto_price/src/data/services/client/client.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/repositories/database_repository.dart';

class DatabaseRepositroyImpl extends DatabaseRepository {
  Client client = getIt<Client>();

  @override
  List<FavoriteModel?> getFavorites() {
    var result = client.getFavs();
    return result;
  }

  @override
  Future<void> removeFromFavs(FavoriteModel favoriteModel) async {
    await client.removeFromFavs(favoriteModel);
  }

  @override
  Future<void> save2Favorite(FavoriteModel favoriteModel) async {
    await client.add2Favs(favoriteModel);
  }
}
