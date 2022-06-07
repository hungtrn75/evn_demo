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
    MapPageRoute.name: (routeData) {
      final args = routeData.argsAs<MapPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: MapPage(
              key: args.key,
              screenHeight: args.screenHeight,
              active: args.active));
    },
    HomePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    SplashPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    FormPageRoute.name: (routeData) {
      final args = routeData.argsAs<FormPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: FormPage(key: args.key, powerPoles: args.powerPoles));
    },
    MapCollectPageRoute.name: (routeData) {
      final args = routeData.argsAs<MapCollectPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: MapCollectPage(key: args.key, powerPoles: args.powerPoles));
    },
    GeocodingPageRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const GeocodingPage(),
          transitionsBuilder: TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(MapPageRoute.name, path: 'MapPage'),
        RouteConfig(HomePageRoute.name, path: 'HomePage'),
        RouteConfig(SplashPageRoute.name, path: 'SplashScreen'),
        RouteConfig(FormPageRoute.name, path: 'FormPage'),
        RouteConfig(MapCollectPageRoute.name, path: 'MapCollectPage'),
        RouteConfig(GeocodingPageRoute.name, path: 'GeocodingPage')
      ];
}

/// generated route for
/// [MapPage]
class MapPageRoute extends PageRouteInfo<MapPageRouteArgs> {
  MapPageRoute({Key? key, required double screenHeight, String? active})
      : super(MapPageRoute.name,
            path: 'MapPage',
            args: MapPageRouteArgs(
                key: key, screenHeight: screenHeight, active: active));

  static const String name = 'MapPageRoute';
}

class MapPageRouteArgs {
  const MapPageRouteArgs({this.key, required this.screenHeight, this.active});

  final Key? key;

  final double screenHeight;

  final String? active;

  @override
  String toString() {
    return 'MapPageRouteArgs{key: $key, screenHeight: $screenHeight, active: $active}';
  }
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: 'HomePage');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [SplashPage]
class SplashPageRoute extends PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: 'SplashScreen');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [FormPage]
class FormPageRoute extends PageRouteInfo<FormPageRouteArgs> {
  FormPageRoute({Key? key, required PowerPoles powerPoles})
      : super(FormPageRoute.name,
            path: 'FormPage',
            args: FormPageRouteArgs(key: key, powerPoles: powerPoles));

  static const String name = 'FormPageRoute';
}

class FormPageRouteArgs {
  const FormPageRouteArgs({this.key, required this.powerPoles});

  final Key? key;

  final PowerPoles powerPoles;

  @override
  String toString() {
    return 'FormPageRouteArgs{key: $key, powerPoles: $powerPoles}';
  }
}

/// generated route for
/// [MapCollectPage]
class MapCollectPageRoute extends PageRouteInfo<MapCollectPageRouteArgs> {
  MapCollectPageRoute({Key? key, required PowerPoles powerPoles})
      : super(MapCollectPageRoute.name,
            path: 'MapCollectPage',
            args: MapCollectPageRouteArgs(key: key, powerPoles: powerPoles));

  static const String name = 'MapCollectPageRoute';
}

class MapCollectPageRouteArgs {
  const MapCollectPageRouteArgs({this.key, required this.powerPoles});

  final Key? key;

  final PowerPoles powerPoles;

  @override
  String toString() {
    return 'MapCollectPageRouteArgs{key: $key, powerPoles: $powerPoles}';
  }
}

/// generated route for
/// [GeocodingPage]
class GeocodingPageRoute extends PageRouteInfo<void> {
  const GeocodingPageRoute()
      : super(GeocodingPageRoute.name, path: 'GeocodingPage');

  static const String name = 'GeocodingPageRoute';
}
