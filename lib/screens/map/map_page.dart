import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_data/configs/constants/app_url.dart';
import 'package:collect_data/configs/constants/app_variables.dart';
import 'package:collect_data/configs/injector/di.dart';
import 'package:collect_data/configs/navigator/app_router.dart';
import 'package:collect_data/models/power_poles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapboxMapController? mapController;
  final Box<PowerPoles> powerPolesBox = DI.resolve();

  void _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
    controller.onFeatureTapped.add(onFeatureTap);
  }

  void onFeatureTap(dynamic featureId, Point<double> point, LatLng latLng) {
    final selected =
        powerPolesBox.values.firstWhere((element) => element.uuid == featureId);
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AutoSizeText(
                  'Cột #$featureId',
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                Text("Vĩ độ: ${latLng.latitude.toStringAsFixed(6)}"),
                const SizedBox(
                  height: 3,
                ),
                Text("Kinh độ: ${latLng.longitude.toStringAsFixed(6)}"),
                const SizedBox(
                  height: 3,
                ),
                selected.elevation != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Độ cao: ${selected.elevation} mét"),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                              "Trị số tiếp địa: ${selected.property ?? "Chưa có thông tin"}"),
                        ],
                      )
                    : const Text("Chưa có thông tin về cột hạ thế"),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: Text(
                          '${selected.elevation != null ? "Chỉnh sửa" : "Thêm mới"} thông tin'),
                      onPressed: (){
                        Navigator.pop(context);
                        context.router.push(const FormPageRoute());
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Chỉ đường'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  Future<void> _injectMapResources() async {
    final ByteData definedBytes =
        await rootBundle.load('assets/icons/defined_pin.png');
    final ByteData nonDefinedBytes =
        await rootBundle.load('assets/icons/non_defined_pin.png');
    await mapController?.addImage(
        AppVariable.DEFINED_ICON, definedBytes.buffer.asUint8List());
    await mapController?.addImage(
        AppVariable.NON_DEFINED_ICON, nonDefinedBytes.buffer.asUint8List());

    final definedPowerPolesList = powerPolesBox.values
        .where((powerPoles) =>
            powerPoles.longitude != null && powerPoles.latitude != null)
        .toList();
    final geoSourceData = AppVariable.listToGeoJson(definedPowerPolesList);

    await mapController?.addSource(
        AppVariable.MAP_SOURCE, GeojsonSourceProperties(data: geoSourceData));
    await mapController?.addSymbolLayer(
      AppVariable.MAP_SOURCE,
      AppVariable.MAP_SYMBOL_LAYER,
      const SymbolLayerProperties(
          iconImage: ["get", "defined"], iconSize: 1.5, iconAllowOverlap: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        styleString: AppUrl.vectorTileUrl,
        accessToken: const String.fromEnvironment("ACCESS_TOKEN"),
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            const CameraPosition(target: LatLng(20.99759, 105.81299), zoom: 15),
        onStyleLoadedCallback: _injectMapResources,
        myLocationEnabled: true,
        myLocationRenderMode: MyLocationRenderMode.GPS,
        compassEnabled: true,
      ),
    );
  }

  @override
  void dispose() {
    mapController?.onFeatureTapped.remove(onFeatureTap);
    super.dispose();
  }
}
