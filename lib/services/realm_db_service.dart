import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:spark_ev/models/ev.dart';

class RealmDbService {
  RealmDbService({
    required this.realmdb,
  });
  final Realm realmdb;

  void createEvTripModel(EvTripModel evTripModel) {
    realmdb.write(() {
      realmdb.add(evTripModel);
    });
    debugPrint('inserted evTripmodel');
  }

  RealmResults<EvTripModel> readEvTripModels() {
    final evTripmodels = realmdb.all<EvTripModel>();

    for (final model in evTripmodels) {
      debugPrint(
          '${model.id} ${model.countryChargingStation} ${model.totalCost}');
    }
    return evTripmodels;
  }

  void updateEvTripModel(EvTripModel evTripModel) {
    realmdb.write(() {
      realmdb.add(evTripModel, update: true);
    });
    debugPrint('updated ev model');
  }

  void deleteEvTripModel(EvTripModel evTripModel) {
    realmdb.write(() {
      realmdb.delete(evTripModel);
    });
    debugPrint('deleted ev moel');
  }
}
