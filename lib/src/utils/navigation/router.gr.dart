// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart'
    as _i10;
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart'
    as _i9;
import 'package:crypto_price/src/modules/dashboard/screen/dashboard_screen.dart'
    as _i1;
import 'package:crypto_price/src/modules/favorite/screen/favorite_screen.dart'
    as _i5;
import 'package:crypto_price/src/modules/home/screens/home_screen.dart' as _i4;
import 'package:crypto_price/src/modules/result/screens/percent_result_screen.dart'
    as _i3;
import 'package:crypto_price/src/modules/result/screens/price_result_screen.dart'
    as _i2;
import 'package:flutter/cupertino.dart' as _i8;
import 'package:flutter/material.dart' as _i7;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DashBoardRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardScreen(),
      );
    },
    PriceResultRoute.name: (routeData) {
      final args = routeData.argsAs<PriceResultRouteArgs>();
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.PriceResultScreen(
          key: args.key,
          priceResult: args.priceResult,
        ),
      );
    },
    PercentResultRoute.name: (routeData) {
      final args = routeData.argsAs<PercentResultRouteArgs>();
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.PercentResultScreen(
          key: args.key,
          percentResult: args.percentResult,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.FavoriteScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/dashboard',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          DashBoardRoute.name,
          path: '/dashboard',
          children: [
            _i6.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: DashBoardRoute.name,
            ),
            _i6.RouteConfig(
              FavoriteRoute.name,
              path: 'fav',
              parent: DashBoardRoute.name,
            ),
          ],
        ),
        _i6.RouteConfig(
          PriceResultRoute.name,
          path: '/priceResult',
        ),
        _i6.RouteConfig(
          PercentResultRoute.name,
          path: '/priceResult',
        ),
      ];
}

/// generated route for
/// [_i1.DashboardScreen]
class DashBoardRoute extends _i6.PageRouteInfo<void> {
  const DashBoardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';
}

/// generated route for
/// [_i2.PriceResultScreen]
class PriceResultRoute extends _i6.PageRouteInfo<PriceResultRouteArgs> {
  PriceResultRoute({
    _i8.Key? key,
    required _i9.PriceResult priceResult,
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

  final _i8.Key? key;

  final _i9.PriceResult priceResult;

  @override
  String toString() {
    return 'PriceResultRouteArgs{key: $key, priceResult: $priceResult}';
  }
}

/// generated route for
/// [_i3.PercentResultScreen]
class PercentResultRoute extends _i6.PageRouteInfo<PercentResultRouteArgs> {
  PercentResultRoute({
    _i8.Key? key,
    required _i10.PercentResult percentResult,
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

  final _i8.Key? key;

  final _i10.PercentResult percentResult;

  @override
  String toString() {
    return 'PercentResultRouteArgs{key: $key, percentResult: $percentResult}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.FavoriteScreen]
class FavoriteRoute extends _i6.PageRouteInfo<void> {
  const FavoriteRoute()
      : super(
          FavoriteRoute.name,
          path: 'fav',
        );

  static const String name = 'FavoriteRoute';
}
