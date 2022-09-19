import 'dart:convert';

Crypto cryptoFromMap(String str) => Crypto.fromMap(json.decode(str));

String cryptoToMap(Crypto data) => json.encode(data.toMap());

class Crypto {
  Crypto({
    required this.symbol,
    required this.name,
    required this.icon,
  });

  final String symbol;
  final String name;
  final String icon;

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
