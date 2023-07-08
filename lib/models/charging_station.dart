import 'package:realm/realm.dart';

part 'charging_station.g.dart';

@RealmModel()
class _ChargingStationModel {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late int lat;
  late int lang;
  late int type;
}
