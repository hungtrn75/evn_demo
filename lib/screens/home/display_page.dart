import 'package:collect_data/models/power_poles.dart';
import 'package:flutter/material.dart';

class DisplayPage extends StatefulWidget {
  final int type;
  final List<PowerPoles> data;

  const DisplayPage({Key? key, required this.type, required this.data})
      : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      itemBuilder: (_, index) {
        final item = widget.data[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Côt điện #${item.uuid}"),
                if (widget.type == 2)
                  IconButton(
                    icon: const Icon(Icons.tips_and_updates, color: Colors.blue,),
                    onPressed: () {},
                  )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
      separatorBuilder: (_, __) => const Divider(),
      itemCount: widget.data.length,
    );
  }
}
