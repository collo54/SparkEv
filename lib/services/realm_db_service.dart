import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:spark_ev/models/ev.dart';

class RealmDbService {
  RealmDbService({
    required this.realmdb,
  });
  final Realm realmdb;

  void createEvModel(EvModel evModel) {
    realmdb.write(() {
      realmdb.add(evModel);
    });
    debugPrint('inserted evmodel');
  }

  RealmResults<EvModel> readEvModels() {
    final evmodels = realmdb.all<EvModel>();

    for (final model in evmodels) {
      debugPrint('${model.id} ${model.continent} ${model.id}');
    }
    return evmodels;
  }

  void updateEvModel(EvModel evModel) {
    realmdb.write(() {
      realmdb.add(evModel, update: true);
    });
    debugPrint('updated ev model');
  }

  void deleteEvModel(EvModel evModel) {
    realmdb.write(() {
      realmdb.delete(evModel);
    });
    debugPrint('deleted ev moel');
  }
}
