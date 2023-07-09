import 'northeast.dart';
import 'southwest.dart';

class Bounds {
  Northeast northeast;
  Southwest southwest;

  Bounds({
    required this.northeast,
    required this.southwest,
  });

  factory Bounds.fromJson(Map<String, dynamic> json) {
    return Bounds(
      northeast: Northeast.fromJson(json['northeast']),
      southwest: Southwest.fromJson(json['southwest']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'northeast': northeast.toJson(),
      'southwest': southwest.toJson(),
    };
  }
}
