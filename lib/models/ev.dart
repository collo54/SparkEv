import 'package:realm/realm.dart';

part 'ev.g.dart';

@RealmModel()
class _EvTripModel {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String owner_id;
  late String countryChargingStation;
  late double latOrigin;
  late double langOrigin;
  late double latChargingStattion;
  late double langChargingStation;
  late double latDestination;
  late double langDestination;
  late double totalCost;
  late double oneKWhPrice;
  late double distanceMiles;
}
