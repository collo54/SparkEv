import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realm/realm.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/pages/home_page.dart';
import 'package:spark_ev/services/auth_service.dart';

import '../models/charger_type.dart';
import '../models/charging_station.dart';
import '../models/ev.dart';
import '../models/user_model.dart';

enum EmailSignInFormType { signIn, register }

class LoginMobileLayout extends StatefulWidget {
  const LoginMobileLayout({super.key});

  @override
  State<LoginMobileLayout> createState() => _LoginMobileLayoutState();
}

class _LoginMobileLayoutState extends State<LoginMobileLayout> {
  EmailSignInFormType _formType = EmailSignInFormType.register;
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void _toogleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    final form = _formKey.currentState!;
    form.reset();
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      form.reset();
      return true;
    }
    return false;
  }

  Future<List<RealmResults>?> _logInEmail() async {
    try {
      if ((_formType == EmailSignInFormType.signIn) &&
          (_validateAndSaveForm())) {
        final list = await _logIn();
        debugPrint('log in');
        return list;
      } else if (_validateAndSaveForm()) {
        final list1 = await _register();
        debugPrint('register');
        return list1;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<RealmResults>> _register() async {
    final authservice = AuthService();
    await authservice.createUserWithEmailAndPassword(_email!, _password!);
    final user = await authservice.logwithEmailAndPassword(_email!, _password!);

    List<RealmResults> results = <RealmResults>[];

    _realm(user, results);

    return results;
  }

  Future<List<RealmResults>> _logIn() async {
    final authservice = AuthService();

    final user = await authservice.logwithEmailAndPassword(_email!, _password!);

    List<RealmResults> results = <RealmResults>[];

    _realm(user, results);

    return results;
  }

  Future<List<RealmResults>> _loginGoogle() async {
    final authservice = AuthService();

    final user = await authservice.logwithGoogleIdToken();

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
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Log in'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Log in';
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(
                  'assets/images/launchicon.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'SparkEv',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: kblack15161810,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Plan your Ev trips worldwide',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                height: 1.56,
                color: kblackgrey79797907,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
            onPressed: () async {
              List<RealmResults> result = await _loginGoogle();

              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    item: result,
                  ),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              fixedSize: const Size(248, 45),
              side: const BorderSide(
                width: 2,
                color: kblackgrey79797910,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/new.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Sign in with Google",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      height: 1.56,
                      color: kblackgrey79797910,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 99,
                height: 2,
                child: Divider(
                  height: 1,
                  color: kblackgrey79797903,
                ),
              ),
              const SizedBox(
                width: 17,
              ),
              Text(
                'or',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: kblackgrey79797910,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                width: 17,
              ),
              const SizedBox(
                width: 99,
                height: 2,
                child: Divider(
                  height: 1,
                  color: kblackgrey79797903,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 248,
            child: _buildForm(),
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: () async {
              final list = await _logInEmail();

              if (list != null) {
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      item: list,
                    ),
                  ),
                );
              }
            },
            color: kblue9813424010,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            height: 55,
            minWidth: 248,
            child: Text(
              primaryText,
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
          TextButton(
            onPressed: () async {
              _toogleFormType();
            },
            child: Text(
              secondaryText,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: kblue9813424010,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      Text(
        'Email',
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: kblackgrey48484810,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email';
          }
          return null;
        },
        initialValue: '',
        onSaved: (value) => _email = value!.trim(),
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: kblackgrey62606310,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Image.asset(
            'assets/images/user1.png',
          ),
          fillColor: kwhite25525525510,
          label: Text(
            ' Email ',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: kblackgrey62606310,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          filled: true,
          hintText: '',
          labelStyle: const TextStyle(
            color: kblackgrey62606310,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kblackgrey79797910, width: 0.5),
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: kblackgrey79797910, width: 0.5),
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kblackgrey79797910, width: 0.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: GoogleFonts.dmSans(
            textStyle: const TextStyle(
              color: kblackgrey62606310,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        maxLines: 1,
        textAlign: TextAlign.start,
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        'Password',
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            color: kblackgrey48484810,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password';
          }
          return null;
        },
        initialValue: '',
        onSaved: (value) => _password = value!.trim(),
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: kblackgrey62606310,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        decoration: InputDecoration(
          prefixIcon: Image.asset(
            'assets/images/padlock.png',
          ),
          fillColor: kwhite25525525510,
          filled: true,
          label: Text(
            ' Password ',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: kblackgrey62606310,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          hintText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kblackgrey79797910, width: 0.5),
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: kblackgrey79797910, width: 0.5),
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusColor: const Color.fromRGBO(243, 242, 242, 1),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kblackgrey79797910, width: 0.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: GoogleFonts.dmSans(
            textStyle: const TextStyle(
              color: kblackgrey62606310,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        maxLines: 1,
        textAlign: TextAlign.start,
      ),
    ];
  }
}
