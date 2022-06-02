import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'configs/injector/di.dart';
import 'configs/navigator/app_router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.montserratTextTheme(textTheme).copyWith(
            overline: GoogleFonts.dancingScript(
              textStyle: textTheme.overline,
            ),
            headline6: GoogleFonts.raleway(
              textStyle: textTheme.headline6,
            ),
          )),
      routerDelegate: router.delegate(initialRoutes: [const SplashPageRoute()]),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
