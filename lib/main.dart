import 'package:collect_data/configs/bloc/delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

import 'configs/injector/di.dart';
import 'configs/navigator/app_router.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await DI.configureDependencies();
  BlocOverrides.runZoned(() {}, blocObserver: AppBlocObserver());
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
          useMaterial3: true,
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.montserratTextTheme(textTheme).copyWith(
            overline: GoogleFonts.dancingScript(
              textStyle: textTheme.overline,
            ),
          )),
      routerDelegate: router.delegate(initialRoutes: [const SplashPageRoute()]),
      routeInformationParser: router.defaultRouteParser(),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
      ],
    );
  }
}
