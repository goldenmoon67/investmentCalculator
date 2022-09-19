import 'dart:convert';

import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:flutter/material.dart';

class CryptoApi {
  final List<String> _cryptoNames = [];
  List<Crypto>? _cryptos;
  getAllCryptoNames(BuildContext context) async {
    String stringResponse = await DefaultAssetBundle.of(context)
        .loadString('assets/datas/cryptos.json');

    var jsonResponse = jsonDecode(stringResponse);

    _cryptos = (jsonResponse as List)
        .map((cryptoMap) => Crypto.fromMap(cryptoMap))
        .toList();

    await transferToNames(_cryptos);

    return _cryptoNames;
  }

  transferToNames(List<Crypto>? cryptos) {
    for (int i = 0; i < cryptos!.length; i++) {
      _cryptoNames.add(cryptos[i].name);
    }
  }
}
