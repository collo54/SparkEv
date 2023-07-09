import 'package:spark_ev/models/reverse_geocoding_models/plus_code.dart';
import 'package:spark_ev/models/reverse_geocoding_models/result.dart';

class ReverseGeocoding {
  PlusCode plusCode;
  List<Result> results;
  String status;

  ReverseGeocoding(
      {required this.plusCode, required this.results, required this.status});

  factory ReverseGeocoding.fromJson(Map<String, dynamic> json) {
    return ReverseGeocoding(
      plusCode: PlusCode.fromJson(json['plus_code']),
      results: List<Result>.from(
          json['results'].map((result) => Result.fromJson(result))),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plus_code': plusCode.toJson(),
      'results': results.map((result) => result.toJson()).toList(),
      'status': status,
    };
  }
}
