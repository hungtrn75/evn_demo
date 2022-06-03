
import 'package:collect_data/configs/network/app_repository.dart';
import 'package:collect_data/models/power_poles.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';


import '../navigator/app_router.dart';
import '../network/dio_provider.dart';
import '../network/rest_client.dart';
import 'pref.dart';

class DI {
  DI._();
  static final _getIt = GetIt.instance;

  static Future configureDependencies() async {
    final localPref = LocalPref();
    final dioIns = DioProvider.instance(localPref);
    final restClient = RestClient(dioIns);

    _getIt.registerSingleton(localPref);
    _getIt.registerSingleton(AppRouter());
    _getIt.registerSingleton(dioIns);
    _getIt.registerSingleton(restClient);

    /** Repositories **/
    _getIt.registerSingleton(AppRepository(restClient: restClient));

    /** Hive **/
    await Hive.initFlutter();
    Hive.registerAdapter(PowerPolesAdapter());

    final powerPolesBox = await Hive.openBox<PowerPoles>('powerPolesBox');

    _getIt.registerSingleton(powerPolesBox);
  }

  static T resolve<T extends Object>() => _getIt.get();
}
