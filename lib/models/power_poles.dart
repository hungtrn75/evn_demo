import 'package:collect_data/configs/constants/app_variables.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'power_poles.g.dart';

@HiveType(typeId: 1)
class PowerPoles extends HiveObject {
  @HiveField(0)
  String? elevation;
  @HiveField(1)
  String? property;
  @HiveField(2)
  double? latitude;
  @HiveField(3)
  double? longitude;
  @HiveField(4)
  String uuid = const Uuid().v4();
  @HiveField(5)
  DateTime createAt = DateTime.now();

  PowerPoles({
    this.elevation,
    this.property,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toJson() {
    final result = {
      "id": uuid,
      "type": "Feature",
      "properties": {
        "uuid": uuid,
        "elevation": elevation,
        "property": property,
        "defined": elevation != null
            ? AppVariable.DEFINED_ICON
            : AppVariable.NON_DEFINED_ICON,
      },
      "geometry": {
        "type": "Point",
        "coordinates": [longitude, latitude]
      }
    };

    return result;
  }
}
