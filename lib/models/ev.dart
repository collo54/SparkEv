import 'package:realm/realm.dart';

part 'ev.g.dart';

@RealmModel()
class _EvModel {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late int count;
  late String continent;
}
