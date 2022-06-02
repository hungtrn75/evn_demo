import 'package:collect_data/models/power_poles.dart';
import 'package:uuid/uuid.dart';

class AppVariable {
  AppVariable._();

  static const featureCollection = {
    "type": "FeatureCollection",
    "features": [
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81155240535736, 20.99824922303295]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81154435873032, 20.997788470275847]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81154435873032, 20.99725760120553]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81213444471359, 20.998284280249727]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81213444471359, 20.997813511223107]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81211298704147, 20.997292658655187]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81184476613998, 20.99780349484471]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81154435873032, 20.998026359105193]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81186085939406, 20.998274263902925]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81153362989426, 20.997520531877257]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81183403730392, 20.997300170964753]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81260114908218, 20.998296800682297]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81304103136063, 20.997305179170922]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81351041793822, 20.998344378316478]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81272184848785, 20.99797377318608]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81289619207382, 20.997623199918607]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.8134138584137, 20.99801383864994]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81330388784409, 20.997635720406606]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81397712230682, 20.99840447635903]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81398516893387, 20.997988797736294]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.8139905333519, 20.997317699685613]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81398516893387, 20.9976332163091]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81486761569977, 20.997310187376925]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81484884023666, 20.998439533539347]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81482738256454, 20.998026359105193]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.8148542046547, 20.997628208113923]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.8144223690033, 20.99788362585308]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81461548805237, 20.997615687625288]
        }
      },
      {
        "type": "Feature",
        "properties": {},
        "geometry": {
          "type": "Point",
          "coordinates": [105.81422924995422, 20.998189124927894]
        }
      }
    ]
  };

  static List<PowerPoles> mockPowerPolesList() {
    final features =
        (featureCollection["features"]) as List<Map<String, dynamic>>;
    final List<PowerPoles> result = [];
    for (var feature in features) {
      final coordinate = (feature["geometry"]
          as Map<String, dynamic>)["coordinates"] as List<double>;
      final powerPoles = PowerPoles(
          uuid: const Uuid().v4(),
          latitude: coordinate[1],
          longitude: coordinate[0]);
      result.add(powerPoles);
    }

    for (var i = 0; i <= 7; i++) {
      final powerPoles = PowerPoles(uuid: const Uuid().v4());
      result.add(powerPoles);
    }
    return result;
  }

  static Map<String, dynamic> listToGeoJson(List<PowerPoles> data) {
    final result = {
      "type": "FeatureCollection",
      "features": data.map((element) => element.toJson()).toList(),
    };

    return result;
  }
}