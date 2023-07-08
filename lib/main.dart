import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/models/charger_type.dart';
import 'package:spark_ev/models/charging_station.dart';
import 'package:spark_ev/models/ev.dart';
import 'package:spark_ev/models/user_model.dart';
import 'package:spark_ev/pages/full_map_page.dart';
import 'package:spark_ev/pages/home_page.dart';
import 'package:spark_ev/pages/login_page.dart';
import 'package:spark_ev/pages/onboarding_page.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  /*
  final app = App(AppConfiguration('spark-ev-app-fltii'));
  final user = app.currentUser ?? await app.logIn(Credentials.anonymous());

  final realmdb = Realm(
    Configuration.flexibleSync(
      user,
      [
        UserModel.schema,
        ChargingStationModel.schema,
        EvModel.schema,
        ChargerTypeModel.schema,
      ],
    ),
  );

  realmdb.subscriptions.update((mutableSubscriptions) {
    mutableSubscriptions.add(realmdb.all<UserModel>());
    mutableSubscriptions.add(realmdb.all<EvModel>());
    mutableSubscriptions.add(realmdb.all<ChargerTypeModel>());
    mutableSubscriptions.add(realmdb.all<ChargingStationModel>());
  });

  
  final userModelData = realmdb.all<UserModel>();
  final evModelData = realmdb.all<EvModel>();
  final chargerTypeModelData = realmdb.all<ChargerTypeModel>();
  final chargingStationModelData = realmdb.all<ChargingStationModel>();
  */

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SparkEv',
      theme: ThemeData(
        primaryColor: kwhite25525525510,
        useMaterial3: true,
      ),
      home: const FullMapPage(),
    );
  }
}
