import 'package:spark_ev/models/reverse_geocoding_models/location_geocoding.dart';

import 'bounds.dart';
import 'viewport.dart';

class Geometry {
  Bounds bounds;
  LocationGeocodeModel location;
  String locationType;
  Viewport viewport;

  Geometry({
    required this.bounds,
    required this.location,
    required this.locationType,
    required this.viewport,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      bounds: Bounds.fromJson(json['bounds']),
      location: LocationGeocodeModel.fromJson(json['location']),
      locationType: json['location_type'],
      viewport: Viewport.fromJson(json['viewport']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bounds': bounds.toJson(),
      'location': location.toJson(),
      'location_type': locationType,
      'viewport': viewport.toJson(),
    };
  }
}
