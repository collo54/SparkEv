import 'package:spark_ev/models/destination.dart';
import 'package:spark_ev/models/origin.dart';
import 'routes_modifires.dart';

class RoutesRequestModel {
  RoutesRequestModel({
    required this.originModel,
    required this.destinationModel,
    required this.travelMode,
    required this.routingPreference,
    required this.departureTime,
    required this.computeAlternativeRoutes,
    required this.routesModifiersModel,
    required this.languageCode,
    required this.units,
  });

  final OriginModel originModel;
  final DestinationModel destinationModel;
  final String travelMode;
  final String routingPreference;
  final String departureTime;
  final bool computeAlternativeRoutes;
  final RoutesModifiersModel routesModifiersModel;
  final String languageCode;
  final String units;

  Map<String, dynamic> toMap() {
    return {
      'origin': originModel.toMap(),
      'destination': destinationModel.toMap(),
      'travelMode': travelMode,
      'routingPreference': routingPreference,
      'departureTime': departureTime,
      'computeAlternativeRoutes': computeAlternativeRoutes,
      'routeModifiers': routesModifiersModel.toMap(),
      'languageCode': languageCode,
      'units': units,
    };
  }

  /*
  factory RoutesRequestModel.fromMap(Map<String, dynamic> data) {
    final int id = data['Id'];
    final String name = data['Name'];
    final String tag = data['Tag'];
    final double netWeight = data['NetWeight'];
    final String measureUnit = data['MeasureUnit'];
    final int pieces = data['Pieces'];
    final int productTypeId = data['ProductType_Id'];
    final int labelId = data['Label_Id'];
    final String sku = data['SKU'];
    final String upc = data['UPC'];
    final double price = data['Price'];
    final String nutrientFact = data['NutrientFact'];
    final int expiredays = data['ExpireDays'];
    final bool active = data['Active'];
    final bool isInsert = data['IsInsert'];
    const bool favorite = false;
    const bool expand = false;

    return RoutesRequestModel(
      id: id,
      name: name,
      tag: tag,
      netWeight: netWeight,
      measureUnit: measureUnit,
      pieces: pieces,
      productTypeId: productTypeId,
      labelId: labelId,
      sku: sku,
      upc: upc,
      price: price,
      nutrientFact: nutrientFact,
      expiredays: expiredays,
      active: active,
      isInsert: isInsert,
      favourite: favorite,
      expanded: expand,
    );
  }
  */

  @override
  String toString() {
    return toMap().toString();
  }
}
