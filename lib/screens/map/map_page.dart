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
  static const String MAP_SOURCE = "map_source";
  static const String MAP_SYMBOL_LAYER = "map_symbol_layer";
  static const String DEFINED_ICON = "defined_icon";
  static const String NON_DEFINED_ICON = "non_defined_icon";

  MapboxMapController? mapController;
  final Box<PowerPoles> powerPolesBox = DI.resolve();

  _onMapCreated(MapboxMapController controller) async {
    mapController = controller;

    final ByteData definedBytes = await rootBundle.load('assets/icons/defined_pin.png');
    final ByteData nonDefinedBytes = await rootBundle.load('assets/icons/non_defined_pin.png');
    await mapController?.addImage(DEFINED_ICON, definedBytes.buffer.asUint8List());
    await mapController?.addImage(NON_DEFINED_ICON, nonDefinedBytes.buffer.asUint8List());

    final definedPowerPolesList = powerPolesBox.values
        .where((powerPoles) =>
            powerPoles.longitude != null && powerPoles.latitude != null)
        .toList();
    final geoSourceData = AppVariable.listToGeoJson(definedPowerPolesList);

    await controller.addSource(
        MAP_SOURCE, GeojsonSourceProperties(data: geoSourceData));
    await controller.addSymbolLayer(
      MAP_SOURCE,
      MAP_SYMBOL_LAYER,
      const SymbolLayerProperties(
        iconImage: DEFINED_ICON,
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
