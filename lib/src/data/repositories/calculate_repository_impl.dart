import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';
import 'package:crypto_price/src/data/services/client/client.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/repositories/calculate_repository.dart';

class CalculateRepositroyImpl extends CalculateRepositroy {
  Client client = getIt<Client>();

  @override
  PriceResult calculateWithPrice(
      Crypto crypto, double currentPrice, double howMuch, expectingProfit) {
    var result = client.calculateWithPrice(
        crypto, currentPrice, howMuch, expectingProfit);

    return result;
  }

  @override
  PercentResult calculateWithPercent(
      Crypto crypto, double percent, double currentPrice) {
    var result = client.calculateWithPercent(crypto, currentPrice, percent);

    return result;
  }

  @override
  void setSliderPercent(double percent) {
    client.setSliderPercent(percent);
  }

  @override
  double? getSliderValue() {
    return client.getSliderValue();
  }
}
