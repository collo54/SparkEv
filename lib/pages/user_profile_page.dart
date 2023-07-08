import 'package:flutter/material.dart';
import 'package:spark_ev/constants/colors.dart';

import '../screens/user_profile_screen.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kblue9813424010,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserProfileScreen(),
          ],
        ),
      ),
    );
  }
}
