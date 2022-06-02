import 'package:collect_data/configs/constants/app_variables.dart';
import 'package:collect_data/configs/injector/di.dart';
import 'package:collect_data/models/power_poles.dart';
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

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;

    final ByteData definedBytes = await rootBundle.load('assets/icons/defined_pin.png');
    final ByteData nonDefinedBytes = await rootBundle.load('assets/icons/non_defined_pin.png');
    await mapController?.addImage(AppVariable.DEFINED_ICON, definedBytes.buffer.asUint8List());
    await mapController?.addImage(AppVariable.NON_DEFINED_ICON, nonDefinedBytes.buffer.asUint8List());

    final definedPowerPolesList = powerPolesBox.values
        .where((powerPoles) =>
            powerPoles.longitude != null && powerPoles.latitude != null)
        .toList();
    final geoSourceData = AppVariable.listToGeoJson(definedPowerPolesList);

    await controller.addSource(
        AppVariable.MAP_SOURCE, GeojsonSourceProperties(data: geoSourceData));
    await controller.addSymbolLayer(
      AppVariable.MAP_SOURCE,
      AppVariable.MAP_SYMBOL_LAYER,
      const SymbolLayerProperties(
        iconImage: ["get", "defined"],
        iconSize: 0.2,
        iconAllowOverlap: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        styleString: MapboxStyles.LIGHT,
        accessToken: const String.fromEnvironment("ACCESS_TOKEN"),
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            const CameraPosition(target: LatLng(20.99759, 105.81299), zoom: 17),
      ),
    );
  }
}
