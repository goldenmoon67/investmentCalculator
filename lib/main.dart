import 'package:crypto_price/app.dart';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CryptoAdapter());
  Hive.registerAdapter(PercentResultAdapter());
  Hive.registerAdapter(PriceResultAdapter());
  Hive.registerAdapter(FavoriteModelAdapter());
  await Hive.openBox<FavoriteModel>("favs");
  setupGetIt();
  EasyLoading.instance;
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}
