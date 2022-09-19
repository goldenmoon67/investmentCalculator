import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';
import 'package:crypto_price/src/data/services/api/calculate_api.dart';
import 'package:crypto_price/src/data/services/api/crypto_api.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:flutter/cupertino.dart';

class Client {
  final CalculateApi _calculateApi = getIt<CalculateApi>();
  final CryptoApi _cryptoApi = getIt<CryptoApi>();
  PercentResult calculateWithPercent(
      String name, double currentRange, double percent) {
    return _calculateApi.calculateWithPercent(name, currentRange, percent);
  }

  PriceResult calculateWithPrice(String name, double currentRange,
      double howMuch, double expectingProfit) {
    return _calculateApi.calculateWithPrice(
        name, currentRange, howMuch, expectingProfit);
  }

  void setSliderPercent(double percent) {
    _calculateApi.setSliderPercent(percent);
  }

  void setWhichPercent(bool wannaMore) {
    _calculateApi.setWhichPercent(wannaMore);
  }

  Future<List<String>> getCryptoNames(BuildContext context) async {
    return await _cryptoApi.getAllCryptoNames(context);
  }
}
