import 'package:auto_route/auto_route.dart';
import 'package:collect_data/configs/injector/di.dart';
import 'package:collect_data/models/power_poles.dart';
import 'package:collect_data/screens/home/display_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../configs/navigator/app_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Box<PowerPoles> powerPolesBox = DI.resolve();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Danh sách cột điện"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Đã xác định",
              ),
              Tab(
                text: "Chưa xác định",
              ),
            ],
          ),
        ),
        body: ValueListenableBuilder<Box<PowerPoles>>(
          valueListenable: powerPolesBox.listenable(),
          builder: (_, box, __) {
            return TabBarView(
              children: [
                DisplayPage(
                  type: 1,
                  data: box.values
                      .where((powerPoles) =>
                          powerPoles.longitude != null &&
                          powerPoles.latitude != null)
                      .toList(),
                ),
                DisplayPage(
                  type: 2,
                  data: box.values
                      .where((powerPoles) =>
                          powerPoles.longitude == null ||
                          powerPoles.latitude == null)
                      .toList(),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.map),
          onPressed: (){
            context.router.push(const MapPageRoute());
          },
        ),
      ),
    );
  }
}
