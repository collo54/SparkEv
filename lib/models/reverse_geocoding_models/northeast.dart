class Northeast {
  double lat;
  double lng;

  Northeast({
    required this.lat,
    required this.lng,
  });

  factory Northeast.fromJson(Map<String, dynamic> json) {
    return Northeast(
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
