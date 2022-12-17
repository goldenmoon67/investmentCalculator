import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/services/client/client.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/repositories/database_repository.dart';

class DatabaseRepositroyImpl extends DatabaseRepository {
  Client client = getIt<Client>();

  @override
  Future<List<Crypto>> getFavorites() async {
    var result = await client.getFavs();
    return result;
  }

  @override
  Future<void> removeFromFavs(Crypto crypto) async {
    await client.removeFromFavs(crypto);
  }

  @override
  Future<void> save2Favorite(Crypto crypto) async {
    await client.add2Favs(crypto);
  }
}
