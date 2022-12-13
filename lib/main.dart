import 'package:crypto_price/app.dart';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("favorites");
  Hive.registerAdapter(CryptoAdapter());
  setupGetIt();
  EasyLoading.instance;
  runApp(const MyApp());
}
