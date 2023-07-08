import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/pages/login_page.dart';
import 'package:spark_ev/screens/onboarding_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwhite25525525510,
        surfaceTintColor: kwhite25525525510,
        toolbarHeight: 63,
        leadingWidth: 80,
        leading: Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(
              'assets/images/launchicon.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            elevation: 0,
            color: kgrey23723723710,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            height: 30,
            minWidth: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
              child: Text(
                'Sign in',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: kblackgrey48484810,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          SizedBox(
            width: 50,
            height: 30,
            child: MaterialButton(
              onPressed: () {},
              elevation: 0,
              color: kwhite25525525510,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              height: 20,
              minWidth: 60,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuLine(),
                  SizedBox(height: 6),
                  MenuLine(),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        /*
        flexibleSpace: const Padding(
          padding: EdgeInsets.only(top: 62),
          child: Divider(
            height: 1,
            color: kgrey21721721710,
          ),
        ),
        */
      ),
      backgroundColor: kwhite25525525510,
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            OnboardingScreen(),
          ],
        ),
      ),
    );
  }
}

class MenuLine extends StatelessWidget {
  const MenuLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 2,
      color: kgrey12212312510,
    );
  }
}
