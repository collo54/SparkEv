class PolylineModel {
  PolylineModel({
    required this.encodedPolyline,
  });

  final String encodedPolyline;

  Map<String, dynamic> toMap() {
    return {
      'encodedPolyline': encodedPolyline,
    };
  }

  factory PolylineModel.fromJson(Map<String, dynamic> data) {
    final encodedPolyline = data['encodedPolyline'] as String?;
    final polylineData = encodedPolyline ?? '';

    return PolylineModel(
      encodedPolyline: polylineData,
    );
  }
}
