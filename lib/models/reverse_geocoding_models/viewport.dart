import 'northeast.dart';
import 'southwest.dart';

class Viewport {
  Northeast northeast;
  Southwest southwest;

  Viewport({
    required this.northeast,
    required this.southwest,
  });

  factory Viewport.fromJson(Map<String, dynamic> json) {
    return Viewport(
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
