import 'package:flutter/material.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/screens/login_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kwhite25525525510,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LoginScreen(),
          ],
        ),
      ),
    );
  }
}
