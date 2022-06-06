import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collect_data/configs/constants/app_url.dart';
import 'package:collect_data/models/power_poles.dart';
import 'package:collect_data/screens/map/bloc/power_poles_detail_bloc.dart';
import 'package:collect_data/utils/collection_utils.dart';
import 'package:collect_data/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  MapboxMapController? mapController;
  String styleString = AppUrl.vectorTileUrl;
  Symbol? active;

  LatLng? activeLatLng;

  void _onMapCreated(MapboxMapController controller) async {
    mapController = controller;
  }

  void _onMapClick(Point<double> point, LatLng latLng) async {
    if (active != null) {
      mapController?.updateSymbol(
        active!,
        SymbolOptions(geometry: latLng),
      );
    } else {
      active = await mapController?.addSymbol(
        SymbolOptions(
            geometry: latLng,
            iconImage: AppVariable.PIN_ICON,
            iconSize: 1,
            iconAnchor: "bottom"),
      );
    }
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
  }

  void _onUpdate() {
    if(activeLatLng!=null) {
      widget.powerPoles.latitude = activeLatLng!.latitude;
      widget.powerPoles.longitude = activeLatLng!.longitude;
      widget.powerPoles.save();
      context.router.pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ),
          if (activeLatLng != null)
            Card(
              child: Container(
                width: context.screenWidth - 30,
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
                    const SizedBox(height: 20,),
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
            )
        ],
      ),
    );
  }
}
