import 'dart:convert';
import 'package:hive/hive.dart';
part 'crypto.g.dart';

Crypto cryptoFromMap(String str) => Crypto.fromMap(json.decode(str));

String cryptoToMap(Crypto data) => json.encode(data.toMap());

@HiveType(typeId: 1)
class Crypto {
  Crypto({
    required this.symbol,
    required this.name,
    required this.icon,
  });
  @HiveField(0)
  final String symbol;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? icon;

  Crypto copyWith({
    required String symbol,
    required String name,
    String? icon,
  }) =>
      Crypto(
        symbol: symbol,
        name: name,
        icon: icon ?? "",
      );

  factory Crypto.fromMap(Map<String, dynamic> json) => Crypto(
        symbol: json["symbol"],
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "symbol": symbol,
        "name": name,
        "icon": icon,
      };
}
