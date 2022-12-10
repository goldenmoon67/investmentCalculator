import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/services/client/client.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/repositories/crypto_repository.dart';
import 'package:flutter/widgets.dart';

class CryptoRepositoryImpl extends CryptoRepository {
  Client client = getIt<Client>();

  @override
  addNewCrypto(Crypto crypto) {}

  @override
  getCrypto(BuildContext context, String name) async {
    return await client.getCryptoModel(context, name);
  }

  @override
  getCryptoNames(BuildContext context) async {
    return await client.getCryptoNames(context);
  }
}
