import 'package:auto_route/annotations.dart';
import 'package:crypto_price/src/modules/dashboard/screen/dashboard_screen.dart';
import 'package:crypto_price/src/modules/favorite/screen/favorite_screen.dart';
import 'package:crypto_price/src/modules/home/screens/home_screen.dart';
import 'package:crypto_price/src/modules/result/screens/percent_result_screen.dart';
import 'package:crypto_price/src/modules/result/screens/price_result_screen.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
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
class $AppRouter {}

//nested group route with a tab router