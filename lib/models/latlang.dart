class LatLangModel {
  LatLangModel({
    required this.lat,
    required this.lang,
  });

  final double lat;
  final double lang;

  Map<String, dynamic> toMap() {
    return {
      'latitude': lat,
      'longitude': lang,
    };
  }
}
