import 'dart:convert';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';
import 'package:hive/hive.dart';
part 'favorite_model.g.dart';

FavoriteModel favoriteFromMap(String str) =>
    FavoriteModel.fromMap(json.decode(str));

String favoriteModelToMap(FavoriteModel data) => json.encode(data.toMap());

@HiveType(typeId: 2)
class FavoriteModel {
  FavoriteModel({
    required this.crypto,
    required this.priceResult,
    required this.percentResult,
  });
  @HiveField(0)
  final Crypto crypto;

  @HiveField(1)
  final PriceResult? priceResult;

  @HiveField(2)
  final PercentResult? percentResult;

  FavoriteModel copyWith({
    required Crypto crypto,
    PriceResult? priceResult,
    PercentResult? percentResult,
  }) =>
      FavoriteModel(
        crypto: crypto,
        priceResult: priceResult,
        percentResult: percentResult,
      );

  factory FavoriteModel.fromMap(Map<String, dynamic> json) => FavoriteModel(
        crypto: json["crypto"],
        priceResult: json["priceResult"],
        percentResult: json["percentResult"],
      );

  Map<String, dynamic> toMap() => {
        "crypto": crypto,
        "priceResult": priceResult,
        "percentResult": percentResult,
      };
}
