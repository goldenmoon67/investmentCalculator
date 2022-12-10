import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:flutter/widgets.dart';

abstract class CryptoRepository {
  Future<List<String>> getCryptoNames(BuildContext context);
  Future<List<Crypto>> getAllCryptos(BuildContext context);
  getCrypto(BuildContext context, String name);
  addNewCrypto(Crypto crypto);
}
