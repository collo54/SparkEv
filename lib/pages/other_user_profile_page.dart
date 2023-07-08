import 'package:flutter/material.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/screens/other_user_profile_screen.dart';

class OtherUserProfilePage extends StatelessWidget {
  const OtherUserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kblue9813424010,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            OtherUserProfileScreen(),
          ],
        ),
      ),
    );
  }
}
