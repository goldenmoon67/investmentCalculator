import 'dart:convert';
import 'package:crypto_price/src/data/models/cryptos/cryptos.dart';
import 'package:http/http.dart' as http;

Future<CryptoModel> getCryptoPrices() async {
  var response = await http.get(
      Uri.parse(
          "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"),
      headers: {
        'X-CMC_PRO_API_KEY': '563b0dc9-2212-43d1-9af8-6968ed5cfe02',
        "Accept": "application/json",
      });
  if (response.statusCode == 200) {
    Map<String, dynamic> responseJSON = json.decode(response.body);
    var result = CryptoModel.fromJson(responseJSON);
    return result;
  } else {
    return Future.error("error in api");
  }
}
