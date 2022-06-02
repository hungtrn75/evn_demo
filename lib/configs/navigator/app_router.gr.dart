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
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MapPage());
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
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const FormPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(MapPageRoute.name, path: 'MapPage'),
        RouteConfig(HomePageRoute.name, path: 'HomePage'),
        RouteConfig(SplashPageRoute.name, path: 'SplashScreen'),
        RouteConfig(FormPageRoute.name, path: 'FormPage')
      ];
}

/// generated route for
/// [MapPage]
class MapPageRoute extends PageRouteInfo<void> {
  const MapPageRoute() : super(MapPageRoute.name, path: 'MapPage');

  static const String name = 'MapPageRoute';
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
class FormPageRoute extends PageRouteInfo<void> {
  const FormPageRoute() : super(FormPageRoute.name, path: 'FormPage');

  static const String name = 'FormPageRoute';
}
