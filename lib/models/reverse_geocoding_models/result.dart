import 'address_component.dart';
import 'geometry.dart';

class Result {
  List<AddressComponent> addressComponents;
  String formattedAddress;
  Geometry geometry;
  String placeId;
  List<String> types;

  Result({
    required this.addressComponents,
    required this.formattedAddress,
    required this.geometry,
    required this.placeId,
    required this.types,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      addressComponents: List<AddressComponent>.from(json['address_components']
          .map((addressComponent) =>
              AddressComponent.fromJson(addressComponent))),
      formattedAddress: json['formatted_address'],
      geometry: Geometry.fromJson(json['geometry']),
      placeId: json['place_id'],
      types: List<String>.from(json['types']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address_components': addressComponents
          .map((addressComponent) => addressComponent.toJson())
          .toList(),
      'formatted_address': formattedAddress,
      'geometry': geometry.toJson(),
      'place_id': placeId,
      'types': types,
    };
  }
}
