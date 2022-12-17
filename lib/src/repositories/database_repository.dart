import 'package:crypto_price/src/data/models/crypto/crypto.dart';

abstract class DatabaseRepository {
  Future<void> save2Favorite(Crypto crypto);
  Future<void> removeFromFavs(Crypto crypto);
  Future<List<Crypto>> getFavorites();
}
