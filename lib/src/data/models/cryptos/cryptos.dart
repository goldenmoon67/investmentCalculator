// To parse this JSON data, do
//
//     final CryptoModel = CryptoModelFromJson(jsonString);

import 'dart:convert';

CryptoModel cryptoModelFromJson(String str) =>
    CryptoModel.fromJson(json.decode(str));

String cryptoModelToJson(CryptoModel data) => json.encode(data.toJson());

class CryptoModel {
  CryptoModel({
    required this.data,
    required this.status,
  });

  List<Datum> data;
  Status status;

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status.toJson(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.quote,
  });

  int id;
  String name;
  String symbol;
  String slug;
  Quote quote;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"] ?? "",
        symbol: json["symbol"] ?? "",
        slug: json["slug"],
        quote: Quote.fromJson(json["quote"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "quote": quote.toJson(),
      };
}

class Quote {
  Quote({
    required this.usd,
  });

  Usd usd;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: Usd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
      };
}

class Usd {
  Usd({
    required this.price,
    required this.volume24H,
    required this.volumeChange24H,
    required this.percentChange1H,
    required this.marketCap,
  });

  double price;
  double volume24H;
  double volumeChange24H;
  double percentChange1H;
  double marketCap;

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        price: json["price"].toDouble(),
        volume24H: json["volume_24h"],
        volumeChange24H: json["volume_change_24h"].toDouble(),
        percentChange1H: json["percent_change_1h"].toDouble(),
        marketCap: json["market_cap"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "volume_24h": volume24H,
        "volume_change_24h": volumeChange24H,
        "percent_change_1h": percentChange1H,
        "market_cap": marketCap,
      };
}

class Status {
  Status({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
  });

  DateTime timestamp;
  int errorCode;
  String errorMessage;
  int elapsed;
  int creditCount;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"] ?? "",
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
      };
}
