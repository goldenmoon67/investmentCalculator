// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    DashboardScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DashboardScreen());
    },
    HomeScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeScreen());
    },
    FavoriteScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const FavoriteScreen());
    },
    PercentResultScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PercentResultScreenRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PercentResultScreen(
              key: args.key, percentResult: args.percentResult));
    },
    PriceResultScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PriceResultScreenRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              PriceResultScreen(key: args.key, priceResult: args.priceResult));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(DashboardScreenRoute.name, path: '/'),
        RouteConfig(HomeScreenRoute.name, path: 'home'),
        RouteConfig(FavoriteScreenRoute.name, path: 'fav'),
        RouteConfig(PercentResultScreenRoute.name, path: '/percent-result'),
        RouteConfig(PercentResultScreenRoute.name, path: '/percent-result'),
        RouteConfig(PriceResultScreenRoute.name, path: '/price-result')
      ];
}

/// generated route for
/// [DashboardScreen]
class DashboardScreenRoute extends PageRouteInfo<void> {
  const DashboardScreenRoute() : super(DashboardScreenRoute.name, path: '/');

  static const String name = 'DashboardScreenRoute';
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: 'home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [FavoriteScreen]
class FavoriteScreenRoute extends PageRouteInfo<void> {
  const FavoriteScreenRoute() : super(FavoriteScreenRoute.name, path: 'fav');

  static const String name = 'FavoriteScreenRoute';
}

/// generated route for
/// [PercentResultScreen]
class PercentResultScreenRoute
    extends PageRouteInfo<PercentResultScreenRouteArgs> {
  PercentResultScreenRoute({Key? key, required PercentResult percentResult})
      : super(PercentResultScreenRoute.name,
            path: '/percent-result',
            args: PercentResultScreenRouteArgs(
                key: key, percentResult: percentResult));

  static const String name = 'PercentResultScreenRoute';
}

class PercentResultScreenRouteArgs {
  const PercentResultScreenRouteArgs({this.key, required this.percentResult});

  final Key? key;

  final PercentResult percentResult;

  @override
  String toString() {
    return 'PercentResultScreenRouteArgs{key: $key, percentResult: $percentResult}';
  }
}

/// generated route for
/// [PriceResultScreen]
class PriceResultScreenRoute extends PageRouteInfo<PriceResultScreenRouteArgs> {
  PriceResultScreenRoute({Key? key, required PriceResult priceResult})
      : super(PriceResultScreenRoute.name,
            path: '/price-result',
            args:
                PriceResultScreenRouteArgs(key: key, priceResult: priceResult));

  static const String name = 'PriceResultScreenRoute';
}

class PriceResultScreenRouteArgs {
  const PriceResultScreenRouteArgs({this.key, required this.priceResult});

  final Key? key;

  final PriceResult priceResult;

  @override
  String toString() {
    return 'PriceResultScreenRouteArgs{key: $key, priceResult: $priceResult}';
  }
}
