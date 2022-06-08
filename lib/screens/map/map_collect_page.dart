import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:collect_data/configs/constants/app_colors.dart';
import 'package:collect_data/configs/constants/app_url.dart';
import 'package:collect_data/configs/navigator/app_router.dart';
import 'package:collect_data/models/power_poles.dart';
import 'package:collect_data/models/reverse_geocoding.dart';
import 'package:collect_data/screens/map/bloc/power_poles_detail_bloc.dart';
import 'package:collect_data/utils/collection_utils.dart';
import 'package:collect_data/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../configs/constants/app_variables.dart';

class MapCollectPage extends StatefulWidget implements AutoRouteWrapper {
  final PowerPoles powerPoles;

  const MapCollectPage({Key? key, required this.powerPoles}) : super(key: key);

  @override
  State<MapCollectPage> createState() => _MapCollectPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => PowerPolesDetailBloc(),
      child: this,
    );
  }
}

class _MapCollectPageState extends State<MapCollectPage> {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  MapboxMapController? mapController;
  String styleString = AppUrl.vectorTileUrl;
  Symbol? active;

  LatLng? activeLatLng;

  void _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
  }

  void _onMapClick(Point<double> point, LatLng latLng) async {
    final featureCollection = {
      "type": "FeatureCollection",
      "features": [
        {
          "id": AppVariable.GEOCODING_SYMBOL_LAYER,
          "type": "Feature",
          "properties": {
            "id": AppVariable.GEOCODING_SYMBOL_LAYER,
          },
          "geometry": {
            "type": "Point",
            "coordinates": [latLng.longitude, latLng.latitude]
          }
        },
      ]
    };
    mapController?.setGeoJsonSource(
        AppVariable.GEOCODING_SOURCE, featureCollection);
    setState(() {
      activeLatLng = latLng;
    });

    BlocProvider.of<PowerPolesDetailBloc>(context).add(
        PowerPolesDetailReverseGeocodingEvent(
            latitude: latLng.latitude, longitude: latLng.longitude));
  }

  void _onStyleLoaded() async {
    final ByteData pinBytes = await rootBundle.load('assets/icons/pin.png');
    await mapController?.addImage(
        AppVariable.PIN_ICON, pinBytes.buffer.asUint8List());

    await mapController?.addSource(
        AppVariable.GEOCODING_SOURCE,
        const GeojsonSourceProperties(
            data: AppVariable.emptyFeatureCollection));
    const symbolProps = SymbolLayerProperties(
      iconImage: AppVariable.PIN_ICON,
      iconSize: 1.0,
      iconAnchor: "bottom",
    );
    await mapController?.addSymbolLayer(
      AppVariable.GEOCODING_SOURCE,
      AppVariable.GEOCODING_SYMBOL_LAYER,
      symbolProps,
      filter: ['==', 'id', AppVariable.GEOCODING_SYMBOL_LAYER],
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
      lineColor: AppColors.innerLineColor,
      lineOpacity: 0.7,
    );
    const outerProps = LineLayerProperties(
      lineWidth: 2.0,
      lineJoin: "round",
      lineColor: "#00725b",
      lineOpacity: 0.5,
    );
    await mapController?.addLineLayer(
      AppVariable.GEOCODING_SOURCE,
      AppVariable.GEOCODING_LINE_LAYER,
      innerProps,
      filter: ['==', 'id', AppVariable.GEOCODING_LINE_LAYER],
    );
    await mapController?.addLineLayer(
      AppVariable.GEOCODING_SOURCE,
      AppVariable.GEOCODING_OUTER_LINE_LAYER,
      outerProps,
      filter: ['==', 'id', AppVariable.GEOCODING_OUTER_LINE_LAYER],
    );
    const fillProps = FillLayerProperties(
      fillColor: AppColors.innerLineColor,
      fillOpacity: 0.3,
      fillOutlineColor: AppColors.outerLineColor,
    );
    await mapController?.addFillLayer(
      AppVariable.GEOCODING_SOURCE,
      AppVariable.GEOCODING_FILL_LAYER,
      fillProps,
      filter: ['==', 'id', AppVariable.GEOCODING_FILL_LAYER],
    );
  }

  void _onUpdate() {
    if (activeLatLng != null) {
      widget.powerPoles.latitude = activeLatLng!.latitude;
      widget.powerPoles.longitude = activeLatLng!.longitude;
      widget.powerPoles.save();
      context.router.pop(true);
    }
  }

  void _changeLayer() {
    setState(() {
      styleString = styleString == AppUrl.vectorTileUrl
          ? MapboxStyles.SATELLITE_STREETS
          : AppUrl.vectorTileUrl;
    });
  }

  void _pickLocationAs() async {
    final position = await _geolocatorPlatform.getCurrentPosition();
    final latLng = LatLng(position.latitude, position.longitude);
    _onMapClick(const Point(0, 0), latLng);
    mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  void _goToSearch() async {
    final bloc = BlocProvider.of<PowerPolesDetailBloc>(context);
    final result = await context.router.push(
        GeocodingPageRoute(search: bloc.state.reverseGeocoding?.name ?? ""));
    if (result is ReverseGeocoding) {
      final coordinates = result.center["coordinates"] as List<dynamic>;
      final center = LatLng(coordinates[1], coordinates[0]);

      final f = result.featureCollection();

      await mapController?.setGeoJsonSource(
          AppVariable.GEOCODING_SOURCE, f.second);
      bloc.add(PowerPolesUpdateFromGeocodingEvent(result));
      setState(() {
        activeLatLng = center;
      });
      await mapController?.animateCamera(CameraUpdate.newLatLngBounds(
        f.first,
        top: 20,
        bottom: 60,
        left: 20,
        right: 20,
      ));
    }
  }

  void _onClear() async {
    if (active != null) {
      await mapController?.removeSymbol(active!);
      active = null;
    }
    activeLatLng = null;

    BlocProvider.of<PowerPolesDetailBloc>(context)
        .add(const PowerPolesClearEvent());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Cập nhật vị trí"),
      // ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MapboxMap(
            styleString: styleString,
            accessToken: AppUrl.MAP_ACCESS_TOKEN,
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
                target: LatLng(20.99759, 105.81299), zoom: 15),
            myLocationEnabled: true,
            compassEnabled: true,
            onMapClick: _onMapClick,
            onStyleLoadedCallback: _onStyleLoaded,
            logoViewMargins: const Point(0, -150),
            attributionButtonMargins: const Point(0, -150),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: context.viewPadding.top + 15,
              ),
              child: GestureDetector(
                onTap: _goToSearch,
                child: Card(
                  elevation: 7,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Container(
                    height: 50,
                    width: context.screenWidth - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.search),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: BlocBuilder<PowerPolesDetailBloc,
                              PowerPolesDetailState>(
                            builder: (_, state) {
                              return Text(
                                state.reverseGeocoding?.name ?? "Tìm kiếm...",
                                style: context.textTheme.titleMedium,
                              );
                            },
                            bloc:
                                BlocProvider.of<PowerPolesDetailBloc>(context),
                            buildWhen: (prev, current) =>
                                prev.reverseGeocoding !=
                                current.reverseGeocoding,
                          ),
                        ),
                        IconButton(
                            onPressed: _onClear, icon: const Icon(Icons.close))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: activeLatLng != null ? 240 : 15.0, right: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    heroTag: "_changeLayer",
                    backgroundColor: Colors.white,
                    mini: true,
                    onPressed: _changeLayer,
                    child: const Icon(
                      Icons.layers,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton(
                    heroTag: "_goToBound",
                    onPressed: _pickLocationAs,
                    child: const Icon(Icons.my_location),
                  ),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: activeLatLng != null ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child: Card(
              elevation: 7,
              child: Container(
                width: context.screenWidth - 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.powerPoles.uuid),
                    const Divider(),
                    Text("Vĩ độ: ${activeLatLng?.latitude.toStringAsFixed(6)}"),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                        "Kinh độ: ${activeLatLng?.longitude.toStringAsFixed(6)}"),
                    const Divider(),
                    BlocBuilder<PowerPolesDetailBloc, PowerPolesDetailState>(
                      builder: (_, state) {
                        if (state.loading) {
                          return const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        }
                        if (state.error.isNotEmpty) {
                          return Text(
                            state.error,
                            style: context.textTheme.caption
                                ?.copyWith(color: Colors.red[600]),
                          );
                        }
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.reverseGeocoding?.name ?? ""),
                            Text(
                              [
                                state.reverseGeocoding?.communeName,
                                state.reverseGeocoding?.districtName,
                                state.reverseGeocoding?.provinceName,
                              ].joinString(),
                              style: context.textTheme.caption,
                            )
                          ],
                        );
                      },
                      bloc: BlocProvider.of<PowerPolesDetailBloc>(context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: _onUpdate,
                        child: Text(
                          "Cập nhật vị trí",
                          style: context.textTheme.button!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
