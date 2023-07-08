import 'package:flutter/material.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/screens/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kblue9813424010,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
