import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realm/realm.dart';
import 'package:rive/rive.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/pages/home_page.dart';

import '../models/charger_type.dart';
import '../models/charging_station.dart';
import '../models/ev.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class OnboardingMobileLayout extends StatelessWidget {
  const OnboardingMobileLayout({super.key});

  Future<List<RealmResults>> _loginAnonymous() async {
    final authservice = AuthService();

    final user = await authservice.logInAnonymouly();

    List<RealmResults> results = <RealmResults>[];

    _realm(user, results);

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
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 55,
          ),
          Text(
            'SparkEv',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: kblack15161810,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            'Using data to boost adoption of\n             electric mobility',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                height: 1.56,
                color: kgrey13313413610,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MaterialButton(
            onPressed: () async {
              final list = await _loginAnonymous();
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    item: list,
                  ),
                ),
              );
            },
            color: kblue9813424010,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            height: 55,
            minWidth: 150,
            child: Text(
              'Launch app',
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: kwhite25525525510,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            width: 250,
            height: 300,
            child: RiveAnimation.asset('assets/animations/vehicle_loader3.riv'),
          ),
        ],
      ),
    );
  }
}
