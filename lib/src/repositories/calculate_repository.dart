import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';

abstract class CalculateRepositroy {
  PercentResult calculateWithPercent(
      String name, double percent, double currentPrice);
  PriceResult calculateWithPrice(
      String name, double currentPrice, double howMuch, expectingProfit);
  void setSliderPercent(double percent);
  void setWhichPercent(bool wannaMore);
}
