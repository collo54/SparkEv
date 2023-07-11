import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:spark_ev/pages/home_page.dart';
import 'package:spark_ev/pages/onboarding_page.dart';
import 'package:spark_ev/services/auth_service.dart';

import '../models/charger_type.dart';
import '../models/charging_station.dart';
import '../models/ev.dart';
import '../models/user_model.dart';

class AuthHelper extends StatelessWidget {
  AuthHelper({super.key});
  final auth = AuthService();

  List<RealmResults> _resultsRealm() {
    final user = auth.currentUser();

    List<RealmResults> results = <RealmResults>[];

    _realm(user!, results);

    return results;
  }

  void _realm(User user, List<RealmResults<Object?>> results) {
    final realmdb = Realm(
      Configuration.flexibleSync(
        user,
        [
          UserModel.schema,
          ChargingStationModel.schema,
          EvTripModel.schema,
          ChargerTypeModel.schema,
        ],
      ),
    );

    realmdb.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realmdb.all<UserModel>());
      mutableSubscriptions.add(realmdb.all<EvTripModel>());
      mutableSubscriptions.add(realmdb.all<ChargerTypeModel>());
      mutableSubscriptions.add(realmdb.all<ChargingStationModel>());
    });

    final userModelData = realmdb.all<UserModel>();
    final evTripModelData = realmdb.all<EvTripModel>();
    final chargerTypeModelData = realmdb.all<ChargerTypeModel>();
    final chargingStationModelData = realmdb.all<ChargingStationModel>();

    results.addAll([
      userModelData,
      evTripModelData,
      chargerTypeModelData,
      chargingStationModelData
    ]);
  }

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser() != null) {
      return HomePage(
        item: _resultsRealm(),
      );
    } else {
      return const OnboardingPage();
    }
  }
}
