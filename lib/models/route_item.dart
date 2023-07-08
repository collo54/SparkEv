import 'package:spark_ev/models/polyline_model.dart';

class RouteItemsModel {
  RouteItemsModel({
    required this.distanceMeters,
    required this.duration,
    required this.polylineModel,
  });

  final int distanceMeters;
  final String duration;
  final PolylineModel polylineModel;

  Map<String, dynamic> toMap() {
    return {
      'distanceMeters': distanceMeters,
      'duration': duration,
      'polyline': polylineModel.toMap(),
    };
  }

  factory RouteItemsModel.fromJson(Map<String, dynamic> data) {
    final distancemeters = data['distanceMeters'];
    final duration = data['duration'];
    final polylinedata = data['polyline'];
    final datapolynine = polylinedata != null
        ? PolylineModel.fromJson(polylinedata)
        : PolylineModel(encodedPolyline: '');

    return RouteItemsModel(
      distanceMeters: distancemeters,
      duration: duration,
      polylineModel: datapolynine,
    );
  }
}
