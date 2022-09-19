import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';

class CalculateApi {
  double? _sliderPercent;
  bool _wannaMore = false;

  PercentResult calculateWithPercent(
    String name,
    double currentRange,
    double percent,
  ) {
    double lastPercent = _wannaMore == true
        ? percent
        : _wannaMore == false && _sliderPercent != null
            ? _sliderPercent!
            : 0;
    double profit = currentRange * lastPercent / 100;
    double lastPrice = currentRange + profit;

    return PercentResult(
        investmentName: name,
        currentRange: currentRange,
        percentWeWant: lastPercent,
        lastPrice: lastPrice);
  }

  PriceResult calculateWithPrice(String name, double currentRange,
      double howMuch, double expectingProfit) {
    double constValue = currentRange * howMuch;
    double lastMoney = constValue + expectingProfit;

    double lastPrice = lastMoney / howMuch;

    return PriceResult(
      expectingProfit: expectingProfit,
      investmentName: name,
      currentRange: currentRange,
      howMuch: howMuch,
      lastPrice: lastPrice,
    );
  }

  void setSliderPercent(double percent) {
    _sliderPercent = percent;
  }

  void setWhichPercent(bool wannaMore) {
    _wannaMore = wannaMore;
  }
}
