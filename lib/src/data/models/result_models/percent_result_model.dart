import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'percent_result_model.g.dart';

@HiveType(typeId: 3)
class PercentResult {
  @HiveField(0)
  final Crypto crypto;

  @HiveField(1)
  final double currentRange;

  @HiveField(2)
  final double percentWeWant;

  @HiveField(3)
  final double lastPrice;

  PercentResult(
      {required this.crypto,
      required this.currentRange,
      required this.percentWeWant,
      required this.lastPrice});
}
