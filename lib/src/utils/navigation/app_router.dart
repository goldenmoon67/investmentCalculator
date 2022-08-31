import 'package:auto_route/auto_route.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';
import 'package:crypto_price/src/modules/home/screens/home_screen.dart';
import 'package:crypto_price/src/modules/result/screens/percent_result_screen.dart';
import 'package:crypto_price/src/modules/result/screens/price_result_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(path: "/percent-result", page: PercentResultScreen),
    AutoRoute(path: "/price-result", page: PriceResultScreen),
  ],
)
class AppRouter extends _$AppRouter {}

extension StackRouterExtension on StackRouter {
  Future setRoot(PageRouteInfo route) {
    return pushAndPopUntil(route, predicate: (route) => false);
  }
}

extension AppRouterExtension on AppRouter {
  Future setRoot(PageRouteInfo route) {
    return pushAndPopUntil(route, predicate: (route) => false);
  }
}
