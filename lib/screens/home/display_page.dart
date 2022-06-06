import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_data/configs/navigator/app_router.dart';
import 'package:collect_data/models/power_poles.dart';
import 'package:collect_data/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DisplayPage extends StatefulWidget {
  final int type;
  final List<PowerPoles> data;

  const DisplayPage({Key? key, required this.type, required this.data})
      : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  static DateFormat dateFormat = DateFormat("dd/MM/yyyy HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        final item = widget.data[index];
        final createdAt = dateFormat.format(item.createAt);
        return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 15,
            ),
            title: AutoSizeText(
              '#${item.uuid}',
              maxLines: 1,
            ),
            subtitle: Text(
              createdAt,
            ),
            onTap: () async {
              if (widget.type == 2) {
                final result = await context.router
                    .push(MapCollectPageRoute(powerPoles: item));
                if (result == true) {
                  Flushbar(
                    message: "Cập nhật vị trí cho #${item.uuid} thành công",
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
              } else {
                context.router.push(MapPageRoute(
                    screenHeight: context.screenHeight, active: item.uuid));
              }
            },
            trailing: widget.type == 2
                ? const Icon(
                    Icons.tips_and_updates,
                    color: Colors.blue,
                  )
                : item.elevation == null
                    ? const Icon(
                        Icons.warning_amber,
                        color: Colors.red,
                      )
                    : null);
      },
      separatorBuilder: (_, __) => const Divider(
        height: 1,
      ),
      itemCount: widget.data.length,
    );
  }
}
