import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/screens/home_screen.dart';

import 'user_profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwhite25525525510,
        surfaceTintColor: kwhite25525525510,
        leading: const SizedBox(),
        leadingWidth: 5,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(
                  'assets/images/launchicon.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Text(
                  'Spark Ev',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: kblackgrey48484810,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 17,
            backgroundColor: kgrey21721721705,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfilePage(),
                  ),
                );
              },
              child: const SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: Icon(
                    Icons.person,
                    color: kblackgrey79797910,
                    size: 15,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 21,
          ),
        ],
      ),
      backgroundColor: kblue9813424010,
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
