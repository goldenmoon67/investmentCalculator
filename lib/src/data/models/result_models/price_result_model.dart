import 'package:crypto_price/src/data/models/crypto/crypto.dart';

class PriceResult {
  final Crypto crypto;
  final double currentRange;
  final double howMuch;
  final double lastPrice;
  final double expectingProfit;

  PriceResult(
      {required this.crypto,
      required this.expectingProfit,
      required this.currentRange,
      required this.howMuch,
      required this.lastPrice});
}
