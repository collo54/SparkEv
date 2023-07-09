class LocationGeocodeModel {
  double lat;
  double lng;

  LocationGeocodeModel({
    required this.lat,
    required this.lng,
  });

  factory LocationGeocodeModel.fromJson(Map<String, dynamic> json) {
    return LocationGeocodeModel(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}
