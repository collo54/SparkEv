class Southwest {
  double lat;
  double lng;

  Southwest({
    required this.lat,
    required this.lng,
  });

  factory Southwest.fromJson(Map<String, dynamic> json) {
    return Southwest(
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
