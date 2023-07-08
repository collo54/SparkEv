import 'package:spark_ev/models/latlang.dart';

class LocationModel {
  LocationModel({
    required this.latLangModel,
  });

  final LatLangModel latLangModel;

  Map<String, dynamic> toMap() {
    return {
      'latLng': latLangModel.toMap(),
    };
  }
}
