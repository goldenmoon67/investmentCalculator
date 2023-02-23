import 'package:auto_route/auto_route.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';
import 'package:crypto_price/src/modules/dashboard/screen/dashboard_screen.dart';
import 'package:crypto_price/src/modules/favorite/screen/favorite_screen.dart';
import 'package:crypto_price/src/modules/home/screens/home_screen.dart';
import 'package:crypto_price/src/modules/result/screens/percent_result_screen.dart';
import 'package:crypto_price/src/modules/result/screens/price_result_screen.dart';
import 'package:flutter/material.dart';
part 'router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(
      path: '/dashboard',
      name: 'DashBoardRoute',
      page: DashboardScreen,
      initial: true,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeRoute',
          page: HomeScreen,
          initial: true,
        ),
        AutoRoute(
          path: 'fav',
          name: 'FavoriteRoute',
          page: FavoriteScreen,
        ),
      ]),
  AutoRoute(
    path: '/priceResult',
    name: 'PriceResultRoute',
    page: PriceResultScreen,
  ),
  AutoRoute(
    path: '/priceResult',
    name: 'PercentResultRoute',
    page: PercentResultScreen,
  ),
])
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
