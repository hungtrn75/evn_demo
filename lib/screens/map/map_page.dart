  import 'dart:convert';
  import 'dart:math';

  import 'package:auto_route/auto_route.dart';
  import 'package:auto_size_text/auto_size_text.dart';
  import 'package:collect_data/configs/constants/app_url.dart';
  import 'package:collect_data/configs/constants/app_variables.dart';
  import 'package:collect_data/configs/injector/di.dart';
  import 'package:collect_data/configs/navigator/app_router.dart';
  import 'package:collect_data/models/power_poles.dart';
  import 'package:collect_data/screens/map/bloc/map_bloc.dart';
  import 'package:collect_data/screens/map/bloc/power_poles_detail_bloc.dart';
  import 'package:collect_data/screens/map/power_poles_bottomsheet.dart';
  import 'package:collect_data/utils/map_utils.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:geolocator/geolocator.dart';
  import 'package:hive_flutter/hive_flutter.dart';
  import 'package:mapbox_gl/mapbox_gl.dart';

  class MapPage extends StatefulWidget implements AutoRouteWrapper {
    const MapPage({Key? key}) : super(key: key);

    @override
    State<MapPage> createState() => _MapPageState();

    @override
    Widget wrappedRoute(BuildContext context) {
      return BlocProvider(
        create: (_) => MapBloc(),
        child: this,
      );
    }
  }

  class _MapPageState extends State<MapPage> {
    final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

    MapboxMapController? mapController;
    final Box<PowerPoles> powerPolesBox = DI.resolve();

    MyLocationRenderMode renderMode = MyLocationRenderMode.COMPASS;
    String styleString = AppUrl.vectorTileUrl;

    void _onMapCreated(MapboxMapController controller) async {
      mapController = controller;
      controller.onFeatureTapped.add(onFeatureTap);
    }

    void onFeatureTap(dynamic featureId, Point<double> point, LatLng latLng) {
      if (featureId == 1 || featureId == 2) {
      } else {
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return BlocProvider(
                create: (_) => PowerPolesDetailBloc(),
                child: PowerPolesBottomSheet(
                  featureId: featureId,
                  latLng: latLng,
                  onRouting: _onRouting,
                ),
              );
            });
      }
    }

    void _onRouting(LatLng destination) async {
      final position = await _geolocatorPlatform.getCurrentPosition();
      BlocProvider.of<MapBloc>(context).add(
        MapRoutingEvent(
          source: LatLng(position.latitude, position.longitude),
          destination: destination,
        ),
      );
    }

    Future<void> _injectMapResources() async {
      //
      final ByteData definedBytes =
          await rootBundle.load('assets/icons/defined_pin.png');
      final ByteData nonDefinedBytes =
          await rootBundle.load('assets/icons/non_defined_pin.png');
      final ByteData headArrowBytes =
          await rootBundle.load('assets/icons/head_arrow.png');

      await mapController?.addImage(
          AppVariable.DEFINED_ICON, definedBytes.buffer.asUint8List());
      await mapController?.addImage(
          AppVariable.NON_DEFINED_ICON, nonDefinedBytes.buffer.asUint8List());
      await mapController?.addImage(
          AppVariable.HEAD_ARROW, headArrowBytes.buffer.asUint8List());

      //
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
        const SymbolLayerProperties(iconImage: [
          "get",
          "defined"
        ], iconSize: [
          "interpolate",
          ["linear"],
          ["zoom"],
          8,
          3.5,
          16,
          1.5
        ], iconAllowOverlap: false),
      );

      /** ROUTiNG **/
      await mapController?.addSource(
        AppVariable.ROUTING_SOURCE,
        const GeojsonSourceProperties(
          data: AppVariable.emptyFeatureCollection,
        ),
      );

      const innerProps = LineLayerProperties(
        lineWidth: [
          "interpolate",
          ["linear"],
          ["zoom"],
          12,
          2,
          16,
          9
        ],
        lineJoin: "round",
        lineColor: "#4da479",
      );
      const outerProps = LineLayerProperties(
        lineWidth: 2.0,
        lineJoin: "round",
        lineGapWidth: [
          "interpolate",
          ["linear"],
          ["zoom"],
          12,
          2,
          16,
          9
        ],
        lineColor: "#00725b",
      );

      await mapController?.addLineLayer(
        AppVariable.ROUTING_SOURCE,
        AppVariable.ROUTING_INNER_LINE_LAYER,
        innerProps,
        belowLayerId: AppVariable.ROUTING_SOURCE_CIRCLE_LAYER,
        filter: ['==', 'id', 1],
      );
      await mapController?.addLineLayer(
        AppVariable.ROUTING_SOURCE,
        AppVariable.ROUTING_OUTER_LINE_LAYER,
        outerProps,
        belowLayerId: AppVariable.ROUTING_SOURCE_CIRCLE_LAYER,
        filter: ['==', 'id', 2],
      );

      const sourceProps = CircleLayerProperties(
        circleRadius: 5,
        circleStrokeWidth: 1.5,
        circleStrokeColor: "#000000",
        circleColor: "#FFFFFF",
      );

      await mapController?.addCircleLayer(
        AppVariable.ROUTING_SOURCE,
        AppVariable.ROUTING_SOURCE_CIRCLE_LAYER,
        sourceProps,
        filter: ['==', 'id', 3],
      );

      const innerDestinationProps = CircleLayerProperties(
        circleRadius: 2,
        circleColor: "#000000",
      );
      await mapController?.addCircleLayer(
          AppVariable.ROUTING_SOURCE,
          AppVariable.ROUTING_INNER_DESTINATION_CIRCLE_LAYER,
          innerDestinationProps,
          filter: ['==', 'id', 4]);

      const outerDestinationProps = CircleLayerProperties(
        circleRadius: 5,
        circleStrokeColor: "#000000",
        circleStrokeWidth: 1.5,
        circleColor: "#FFFFFF",
      );
      await mapController?.addCircleLayer(
        AppVariable.ROUTING_SOURCE,
        AppVariable.ROUTING_OUTER_DESTINATION_CIRCLE_LAYER,
        outerDestinationProps,
        belowLayerId: AppVariable.ROUTING_INNER_DESTINATION_CIRCLE_LAYER,
        filter: ['==', 'id', 5],
      );

      /** NAVIGATION **/
      await mapController?.addSource(
        AppVariable.ROUTING_NAVIGATION_SOURCE,
        const GeojsonSourceProperties(
          data: AppVariable.emptyFeatureCollection,
        ),
      );
      const bodyArrowProps = LineLayerProperties(
        lineWidth: [
          "interpolate",
          ["linear"],
          ["zoom"],
          12,
          2,
          16,
          9
        ],
        lineColor: "#ffffff",
        lineJoin: "round",
      );
      await mapController?.addLineLayer(
        AppVariable.ROUTING_NAVIGATION_SOURCE,
        AppVariable.ROUTING_NAVIGATION_ARROW_LAYER,
        bodyArrowProps,
        belowLayerId: AppVariable.ROUTING_NAVIGATION_HEAD_ARROW_LAYER
      );

      await mapController?.addSymbolLayer(
        AppVariable.ROUTING_NAVIGATION_SOURCE,
        AppVariable.ROUTING_NAVIGATION_HEAD_ARROW_LAYER,
        const SymbolLayerProperties(
          iconRotate: ["get", "bearing"],
          iconImage: AppVariable.HEAD_ARROW,
          iconSize: [
            "interpolate",
            ["linear"],
            ["zoom"],
            8,
            0.1,
            17,
            1
          ],
          iconAllowOverlap: true,
          symbolPlacement: true,
          iconIgnorePlacement: true,
          textAllowOverlap: true,
          iconRotationAlignment: "map",
        ),
        filter: ['==', 'id', 7],
      );
    }

    void _observerMapState(MapState state) async {
      if (state.directionInfo != null) {
        if (renderMode != MyLocationRenderMode.GPS) {
          setState(() {
            renderMode = MyLocationRenderMode.GPS;
          });
        }
        final geometry = state.directionInfo!.routes![0].geometry;
        final transformGeometry =
            ((geometry as Map<String, dynamic>)["coordinates"] as List<dynamic>)
                .map((e) => LatLng(e[1], e[0]))
                .toList();
        mapController?.setGeoJsonSource(AppVariable.ROUTING_SOURCE, {
          "type": "FeatureCollection",
          "features": [
            {
              "id": 1,
              "properties": {
                'id': 1,
              },
              "type": "Feature",
              "geometry": geometry
            },
            {
              "id": 2,
              "properties": {
                'id': 2,
              },
              "type": "Feature",
              "geometry": geometry
            },
            {
              "id": 3,
              "type": "Feature",
              "properties": {
                'id': 3,
              },
              "geometry": {
                "type": "Point",
                "coordinates": [
                  transformGeometry.first.longitude,
                  transformGeometry.first.latitude
                ]
              }
            },
            {
              "id": 4,
              "type": "Feature",
              "properties": {
                'id': 4,
              },
              "geometry": {
                "type": "Point",
                "coordinates": [
                  transformGeometry.last.longitude,
                  transformGeometry.last.latitude
                ]
              }
            },
            {
              "id": 5,
              "type": "Feature",
              "properties": {
                'id': 5,
              },
              "geometry": {
                "type": "Point",
                "coordinates": [
                  transformGeometry.last.longitude,
                  transformGeometry.last.latitude
                ]
              }
            },
          ]
        });
        await Future.delayed(const Duration(milliseconds: 300));

        await mapController?.animateCamera(CameraUpdate.newLatLngBounds(
          boundsFromLatLngList(transformGeometry),
          left: 15,
          right: 15,
          top: 70,
          bottom: 30,
        ));
        await Future.delayed(const Duration(milliseconds: 150));
        await mapController?.animateCamera(CameraUpdate.bearingTo(180 -
            state.directionInfo!.routes![0].legs![0].steps![0].maneuver!
                .bearingBefore!));
      } else {
        if (renderMode != MyLocationRenderMode.COMPASS) {
          setState(() {
            renderMode = MyLocationRenderMode.COMPASS;
          });
        }
      }
    }

    void _goToBound() async {
      final definedPowerPolesList = powerPolesBox.values
          .where((powerPoles) =>
              powerPoles.longitude != null && powerPoles.latitude != null)
          .map((e) => LatLng(e.latitude!, e.longitude!))
          .toList();
      mapController?.animateCamera(CameraUpdate.newLatLngBounds(
        boundsFromLatLngList(definedPowerPolesList),
        left: 50,
        right: 50,
        top: 50,
        bottom: 50,
      ));
    }

    void _changeLayer() {
      setState(() {
        styleString = styleString == AppUrl.vectorTileUrl
            ? MapboxStyles.SATELLITE_STREETS
            : AppUrl.vectorTileUrl;
      });
    }

    void _test() {
      final directionInfo =
          BlocProvider.of<MapBloc>(context).state.directionInfo!;
      final result = turnArrowFeatures(
          directionInfo.routes![0].legs![0].steps![0],
          directionInfo.routes![0].legs![0].steps![1]);
      debugPrint("1234: ${json.encode(result[1])}");
      mapController?.setGeoJsonSource(AppVariable.ROUTING_NAVIGATION_SOURCE,
          {"type": "FeatureCollection", "features": result});
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            BlocListener<MapBloc, MapState>(
              listenWhen: (previous, current) =>
                  previous.directionInfo != current.directionInfo,
              listener: (_, state) {
                _observerMapState(state);
              },
              child: const SizedBox(),
            ),
            MapboxMap(
              styleString: styleString,
              accessToken: AppUrl.MAP_ACCESS_TOKEN,
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                  target: LatLng(20.99759, 105.81299), zoom: 15),
              onStyleLoadedCallback: _injectMapResources,
              myLocationEnabled: true,
              myLocationRenderMode: renderMode,
              compassEnabled: true,
            ),
            BlocBuilder<MapBloc, MapState>(
              builder: (_, state) {
                if (state.loading) {
                  return const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
              buildWhen: (prev, current) => prev.loading != current.loading,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0, right: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      heroTag: "_test",
                      backgroundColor: Colors.white,
                      mini: true,
                      onPressed: _test,
                      child: const Icon(Icons.turn_left, color: Colors.black87,),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FloatingActionButton(
                      heroTag: "_changeLayer",
                      backgroundColor: Colors.white,
                      mini: true,
                      onPressed: _changeLayer,
                      child: const Icon(Icons.layers, color: Colors.black87,),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FloatingActionButton(
                      heroTag: "_goToBound",
                      onPressed: _goToBound,
                      child: const Icon(Icons.my_location),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    @override
    void dispose() {
      mapController?.onFeatureTapped.remove(onFeatureTap);
      super.dispose();
    }
  }
