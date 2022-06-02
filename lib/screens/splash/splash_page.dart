import 'package:auto_route/auto_route.dart';
import 'package:collect_data/configs/constants/app_variables.dart';
import 'package:collect_data/configs/injector/di.dart';
import 'package:collect_data/models/power_poles.dart';
import 'package:collect_data/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../configs/navigator/route_name.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Box<PowerPoles> powerPolesBox = DI.resolve();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      FlutterNativeSplash.remove();
      if (powerPolesBox.values.isEmpty) {
        _initData();
      } else {
        _navigateToMain();
      }
    });
  }

  void _initData() async {
    final mockList = AppVariable.mockPowerPolesList();
    powerPolesBox.addAll(mockList);
    await _navigateToMain();
  }

  Future<void> _navigateToMain() async {
    await Future.delayed(const Duration(milliseconds: 500));
    context.router.replaceNamed(RouteName.homePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            child: Image.asset(
              "assets/icons/logo.png",
              width: context.screenWidth * 0.8,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Đang khởi tạo dữ liệu..."),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
