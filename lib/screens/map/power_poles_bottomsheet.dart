import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_data/configs/injector/di.dart';
import 'package:collect_data/configs/navigator/app_router.dart';
import 'package:collect_data/models/power_poles.dart';
import 'package:collect_data/screens/map/bloc/power_poles_detail_bloc.dart';
import 'package:collect_data/utils/collection_utils.dart';
import 'package:collect_data/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class PowerPolesBottomSheet extends StatefulWidget {
  final dynamic featureId;
  final LatLng latLng;
  final void Function(LatLng) onRouting;

  const PowerPolesBottomSheet({
    Key? key,
    required this.featureId,
    required this.latLng,
    required this.onRouting,
  }) : super(key: key);

  @override
  State<PowerPolesBottomSheet> createState() => _PowerPolesBottomSheetState();
}

class _PowerPolesBottomSheetState extends State<PowerPolesBottomSheet> {
  final Box<PowerPoles> powerPolesBox = DI.resolve();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PowerPolesDetailBloc>(context).add(
        PowerPolesDetailReverseGeocodingEvent(
            latitude: widget.latLng.latitude,
            longitude: widget.latLng.longitude));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ValueListenableBuilder<Box<PowerPoles>>(
        valueListenable: powerPolesBox.listenable(),
        builder: (_, box, __) {
          final selected = powerPolesBox.values
              .firstWhere((element) => element.uuid == widget.featureId);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AutoSizeText(
                'Cột #${widget.featureId}',
                maxLines: 1,
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
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
              const Divider(),
              Text("Vĩ độ: ${selected.latitude?.toStringAsFixed(6)}"),
              const SizedBox(
                height: 3,
              ),
              Text("Kinh độ: ${selected.longitude?.toStringAsFixed(6)}"),
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
                    onPressed: () async {
                      final result = await context.router
                          .push(FormPageRoute(powerPoles: selected));
                      if (result == true) {
                        Flushbar(
                          message:
                              "Chỉnh sửa thông tin cho #${selected.uuid} thành công",
                          icon: const Icon(
                            Icons.info_outline,
                            size: 28.0,
                            color: Colors.white,
                          ),
                          duration: const Duration(seconds: 3),
                          flushbarPosition: FlushbarPosition.TOP,
                          flushbarStyle: FlushbarStyle.GROUNDED,
                          backgroundColor: Colors.green[800]!,
                        ).show(context);
                      }
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Chỉ đường'),
                    onPressed: () {
                      Navigator.pop(context);
                      widget.onRouting(widget.latLng);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
