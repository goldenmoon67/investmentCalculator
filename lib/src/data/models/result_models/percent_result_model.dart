import 'package:crypto_price/src/data/models/crypto/crypto.dart';

class PercentResult {
  final Crypto crypto;
  final double currentRange;
  final double percentWeWant;
  final double lastPrice;

  PercentResult(
      {required this.crypto,
      required this.currentRange,
      required this.percentWeWant,
      required this.lastPrice});
}
