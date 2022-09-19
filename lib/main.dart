import 'package:crypto_price/app.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  setupGetIt();
  EasyLoading.instance;
  runApp(const MyApp());
}
