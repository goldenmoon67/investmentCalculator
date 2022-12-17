import 'dart:convert';

import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:flutter/material.dart';

class CryptoApi {
  final List<String> _cryptoNames = [];
  List<Crypto>? _cryptos;
  getAllCryptoNames(BuildContext context) async {
    try {
      String stringResponse = await DefaultAssetBundle.of(context)
          .loadString('assets/datas/cryptos.json');

      var jsonResponse = jsonDecode(stringResponse);

      _cryptos = (jsonResponse as List)
          .map((cryptoMap) => Crypto.fromMap(cryptoMap))
          .toList();

      await transferToNames(_cryptos);
      debugPrint(
          "CryproNames list is ready. CryptoNames length: ${_cryptos!.length}");

      return _cryptoNames;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getAllCryptos(BuildContext context) async {
    try {
      String stringResponse = await DefaultAssetBundle.of(context)
          .loadString('assets/datas/cryptos.json');

      var jsonResponse = jsonDecode(stringResponse);

      _cryptos = (jsonResponse as List)
          .map((cryptoMap) => Crypto.fromMap(cryptoMap))
          .toList();
      debugPrint("Crypto list is ready. Cryptos length: ${_cryptos!.length}");
      return _cryptos;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  transferToNames(List<Crypto>? cryptos) {
    for (int i = 0; i < cryptos!.length; i++) {
      _cryptoNames.add(cryptos[i].name);
    }
  }

  Future<Crypto> getCryptoModelFromJson(
      BuildContext context, String name) async {
    Crypto? cryptoModel;
    String stringResponse = await DefaultAssetBundle.of(context)
        .loadString('assets/datas/cryptos.json');

    var jsonResponse = jsonDecode(stringResponse);

    _cryptos = (jsonResponse as List)
        .map((cryptoMap) => Crypto.fromMap(cryptoMap))
        .toList();

    for (int i = 0; i < _cryptos!.length; i++) {
      if (_cryptos![i].name == name) {
        cryptoModel = _cryptos![i];
      }
    }
    debugPrint(
      "Crypto model is ready.`{`${cryptoModel?.name ?? ""}, ${cryptoModel?.symbol ?? ""},  ${cryptoModel?.icon ?? ""} `}`",
    );
    return cryptoModel ?? Crypto(symbol: "symbol", name: "name", icon: "icon");
  }
}
