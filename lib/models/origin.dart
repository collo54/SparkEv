import 'location.dart';

class OriginModel {
  OriginModel({
    required this.locationModel,
  });

  final LocationModel locationModel;

  Map<String, dynamic> toMap() {
    return {
      'location': locationModel.toMap(),
    };
  }
}
