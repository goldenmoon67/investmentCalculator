import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';
import 'package:crypto_price/src/data/services/funcs/client.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/repositories/calculate_repository.dart';

class CalculateRepositroyImpl extends CalculateRepositroy {
  Client client = getIt<Client>();

  @override
  PriceResult calculateWithPrice(
      String name, double currentPrice, double howMuch, expectingProfit) {
    var result =
        client.calculateWithPrice(name, currentPrice, howMuch, expectingProfit);

    return result;
  }

  @override
  PercentResult calculateWithPercent(
      String name, double percent, double currentPrice) {
    var result = client.calculateWithPercent(name, currentPrice, percent);

    return result;
  }

  @override
  void setSliderPercent(double percent) {
    client.setSliderPercent(percent);
  }

  @override
  void setWhichPercent(bool wannaMore) {
    client.setWhichPercent(wannaMore);
  }
}
