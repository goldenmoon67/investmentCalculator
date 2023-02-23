// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    DashBoardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    PriceResultRoute.name: (routeData) {
      final args = routeData.argsAs<PriceResultRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PriceResultScreen(
          key: args.key,
          priceResult: args.priceResult,
        ),
      );
    },
    PercentResultRoute.name: (routeData) {
      final args = routeData.argsAs<PercentResultRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PercentResultScreen(
          key: args.key,
          percentResult: args.percentResult,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FavoriteScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/dashboard',
          fullMatch: true,
        ),
        RouteConfig(
          DashBoardRoute.name,
          path: '/dashboard',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: DashBoardRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: DashBoardRoute.name,
            ),
            RouteConfig(
              FavoriteRoute.name,
              path: 'fav',
              parent: DashBoardRoute.name,
            ),
          ],
        ),
        RouteConfig(
          PriceResultRoute.name,
          path: '/priceResult',
        ),
        RouteConfig(
          PercentResultRoute.name,
          path: '/priceResult',
        ),
      ];
}

/// generated route for
/// [DashboardScreen]
class DashBoardRoute extends PageRouteInfo<void> {
  const DashBoardRoute({List<PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';
}

/// generated route for
/// [PriceResultScreen]
class PriceResultRoute extends PageRouteInfo<PriceResultRouteArgs> {
  PriceResultRoute({
    Key? key,
    required PriceResult priceResult,
  }) : super(
          PriceResultRoute.name,
          path: '/priceResult',
          args: PriceResultRouteArgs(
            key: key,
            priceResult: priceResult,
          ),
        );

  static const String name = 'PriceResultRoute';
}

class PriceResultRouteArgs {
  const PriceResultRouteArgs({
    this.key,
    required this.priceResult,
  });

  final Key? key;

  final PriceResult priceResult;

  @override
  String toString() {
    return 'PriceResultRouteArgs{key: $key, priceResult: $priceResult}';
  }
}

/// generated route for
/// [PercentResultScreen]
class PercentResultRoute extends PageRouteInfo<PercentResultRouteArgs> {
  PercentResultRoute({
    Key? key,
    required PercentResult percentResult,
  }) : super(
          PercentResultRoute.name,
          path: '/priceResult',
          args: PercentResultRouteArgs(
            key: key,
            percentResult: percentResult,
          ),
        );

  static const String name = 'PercentResultRoute';
}

class PercentResultRouteArgs {
  const PercentResultRouteArgs({
    this.key,
    required this.percentResult,
  });

  final Key? key;

  final PercentResult percentResult;

  @override
  String toString() {
    return 'PercentResultRouteArgs{key: $key, percentResult: $percentResult}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [FavoriteScreen]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute()
      : super(
          FavoriteRoute.name,
          path: 'fav',
        );

  static const String name = 'FavoriteRoute';
}
