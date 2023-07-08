import 'package:realm/realm.dart';

part 'charger_type.g.dart';

@RealmModel()
class _ChargerTypeModel {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late int tesla;
  late int swap;
  late int j1772;
  late int ccsCombo1;
  late int type2;
  late int ccsCombo2;
  late int cHAdeMo;
  late int wallOutlet;
}
