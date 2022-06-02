import 'package:auto_route/auto_route.dart';
import 'package:collect_data/screens/home/home_page.dart';
import 'package:collect_data/screens/map/map_page.dart';
import 'package:collect_data/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'route_name.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: '',
  routes: [
    AutoRoute(page: MapPage, path: RouteName.mapPage),
    AutoRoute(page: HomePage, path: RouteName.homePage),
    AutoRoute(page: SplashPage, path: RouteName.splashScreen),
  ],
)
class AppRouter extends _$AppRouter {}