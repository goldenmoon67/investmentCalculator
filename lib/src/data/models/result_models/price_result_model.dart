import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'price_result_model.g.dart';

@HiveType(typeId: 4)
class PriceResult {
  @HiveField(0)
  final Crypto crypto;

  @HiveField(1)
  final double currentRange;

  @HiveField(2)
  final double howMuch;

  @HiveField(3)
  final double lastPrice;

  @HiveField(4)
  final double expectingProfit;

  PriceResult({
    required this.crypto,
    required this.expectingProfit,
    required this.currentRange,
    required this.howMuch,
    required this.lastPrice,
  });
}
