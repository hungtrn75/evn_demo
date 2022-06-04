import 'package:collect_data/models/routing.dart';
import 'package:collect_data/utils/extensions.dart';
import 'package:flutter/material.dart';

class DirectionStepItem extends StatelessWidget {
  final StepInfo step;

  final void Function() onTap;

  const DirectionStepItem({Key? key, required this.step, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            const Icon(Icons.turn_sharp_left_outlined),
            const SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.maneuver?.instruction ?? "",
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      if(step.distance != 0)
                        Text(
                          "${step.distance!.round()} mét",
                          style: context.textTheme.caption,
                        ),
                      const Expanded(
                        child: Divider(
                          height: 1,
                        ),
                      )
                    ],
                  )
                ],
              ),)
          ],
        ),
      ),
    );
  }
}
