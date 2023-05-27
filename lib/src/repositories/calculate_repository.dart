import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';

abstract class CalculateRepositroy {
  PercentResult calculateWithPercent(
      Crypto crypto, double percent, double currentPrice);
  PriceResult calculateWithPrice(
      Crypto crypto, double currentPrice, double howMuch, expectingProfit);
  void setSliderPercent(double percent);
  double? getSliderValue();
}
