import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_data/models/power_poles.dart';
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
            contentPadding: const EdgeInsets.only(
              left: 15,
              top: 5,
              bottom: 5,
            ),
            title: AutoSizeText(
              '#${item.uuid}',
              maxLines: 1,
            ),
            subtitle: Text(
              createdAt,
            ),
            onTap: () {},
            trailing: widget.type == 2
                ? IconButton(
                    icon: const Icon(
                      Icons.tips_and_updates,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
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
