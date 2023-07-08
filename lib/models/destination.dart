import 'location.dart';

class DestinationModel {
  DestinationModel({
    required this.locationModel,
  });

  final LocationModel locationModel;

  Map<String, dynamic> toMap() {
    return {
      'location': locationModel.toMap(),
    };
  }
}
