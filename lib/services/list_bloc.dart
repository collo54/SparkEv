import 'package:realm/realm.dart';
import 'package:spark_ev/models/ev.dart';
import 'realm_db_service.dart';

class ListBloc {
  final RealmResults<EvTripModel?>? items;
  final Realm _realm;
  ListBloc(this.items) : _realm = items!.realm;

  /*
  void addNewItem() {
    _realm.write(() => _realm.add(EvTripModel(
          ObjectId(),
        )));
  }
  */

  void addNewItem2(EvTripModel evTripModel) {
    final service = RealmDbService(realmdb: _realm);
    service.createEvTripModel(evTripModel);
  }
}
