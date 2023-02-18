import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';
import 'package:crypto_price/src/data/services/api/calculate_api.dart';
import 'package:crypto_price/src/data/services/api/crypto_api.dart';
import 'package:crypto_price/src/data/services/api/hive_database_api.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:flutter/cupertino.dart';

class Client {
  final CalculateApi _calculateApi = getIt<CalculateApi>();
  final CryptoApi _cryptoApi = getIt<CryptoApi>();
  final HiveDataBaseApi _hiveDataBaseApi = getIt<HiveDataBaseApi>();

  PercentResult calculateWithPercent(
      Crypto crypto, double currentRange, double percent) {
    return _calculateApi.calculateWithPercent(crypto, currentRange, percent);
  }

  PriceResult calculateWithPrice(Crypto crypto, double currentRange,
      double howMuch, double expectingProfit) {
    return _calculateApi.calculateWithPrice(
        crypto, currentRange, howMuch, expectingProfit);
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

  Future<Crypto> getCryptoModel(BuildContext context, String name) async {
    return await _cryptoApi.getCryptoModelFromJson(context, name);
  }

  Future<List<Crypto>> getAllCryptos(BuildContext context) async {
    return await _cryptoApi.getAllCryptos(context);
  }

  List<FavoriteModel?> getFavs() {
    return _hiveDataBaseApi.getAllItems();
  }

  Future<String?> add2Favs(FavoriteModel favoriteModel) async {
    return await _hiveDataBaseApi.addItem(favoriteModel);
  }

  Future<void> removeFromFavs(FavoriteModel favoriteModel) async {
    return await _hiveDataBaseApi.deleteItem(favoriteModel);
  }
}
