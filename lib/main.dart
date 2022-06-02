import 'package:flutter/material.dart';

import 'configs/injector/di.dart';
import 'configs/navigator/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = DI.resolve<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: router.delegate(initialRoutes: [const SplashPageRoute()]),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
