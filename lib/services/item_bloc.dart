import 'package:realm/realm.dart';

import '../models/ev.dart';
import 'realm_db_service.dart';

class ItemBloc {
  final EvTripModel item;
  final Realm _realm;
  ItemBloc(this.item) : _realm = item.realm;
  void delete() {
    _realm.write(() => _realm.delete(item));
  }

  void deleteEvTrip(EvTripModel evTripModel) {
    final service = RealmDbService(realmdb: _realm);
    service.createEvTripModel(evTripModel);
  }
}
