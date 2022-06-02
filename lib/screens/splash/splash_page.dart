import 'package:auto_route/auto_route.dart';
import 'package:collect_data/configs/constants/app_variables.dart';
import 'package:collect_data/configs/injector/di.dart';
import 'package:collect_data/configs/navigator/route_name.dart';
import 'package:collect_data/models/power_poles.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Box<PowerPoles> powerPolesBox = DI.resolve();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (powerPolesBox.values.isEmpty) {
        _initData();
      } else {
        context.router.replaceNamed(RouteName.homePage);
      }
    });
  }

  void _initData() async {
    final mockList = AppVariable.mockPowerPolesList();
    powerPolesBox.addAll(mockList);
    await Future.delayed(const Duration(milliseconds: 500));
    context.router.replaceNamed(RouteName.homePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 24,
                  height: 24,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Đang khởi tạo dữ liệu..."),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
