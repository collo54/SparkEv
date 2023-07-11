import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/pages/onboarding_page.dart';

import '../services/auth_service.dart';

class UserProfileMobileLayout extends StatelessWidget {
  const UserProfileMobileLayout({super.key});
  //final date = DateFormat.yMEd().add_jms().format(DateTime.now());

  String? _profileLetters() {
    final authservice = AuthService();

    final user = authservice.currentUser();

    final name = user?.profile.name;
    if (name != null) {
      List<String>? firstLetters =
          name?.split(' ').map((word) => word[0]).toList();
      final first = firstLetters?.elementAt(0);
      final second = firstLetters?.elementAt(1);

      return '$first $second';
    } else {
      return '';
    }
  }

  String? _dataUser() {
    final authservice = AuthService();

    final user = authservice.currentUser();
    final name = user?.profile.name;

    return name;
  }

  Future<void> _logOut() async {
    final authservice = AuthService();
    final user = authservice.currentUser();
    await authservice.logOut(user!);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  shape: BoxShape.rectangle,
                  color: kwhite25525525510,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kblue12915824210,
                      size: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Stack(clipBehavior: Clip.none, children: [
                  GestureDetector(
                    onTap: () {},
                    child: Ink(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        shape: BoxShape.rectangle,
                        color: kteal16620520710,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 6,
                        ),
                        child: Center(
                          child: Text(
                            _profileLetters() != null
                                ? _profileLetters()!.toUpperCase()
                                : 'n/a',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                color: kwhite25525525510,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -1,
                    right: -3,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kblue9813424010,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: -1,
                    child: Container(
                      width: 19,
                      height: 19,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kgreen11719013010,
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                width: 70,
              ),
              InkWell(
                onTap: () async {
                  await _logOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingPage(),
                    ),
                  );
                },
                child: Ink(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(
                      width: 2,
                      color: kblue12915824210,
                    ),
                    shape: BoxShape.rectangle,
                    color: kblue9813424010,
                  ),
                  child: const Icon(
                    Icons.logout,
                    color: kwhite25525525510,
                    size: 17,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Text(
            _dataUser() ?? ' Anonymous ',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: kwhite25525525510,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            'user',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: kwhite25525525510,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          const SizedBox(
            width: 280,
            height: 2,
            child: Divider(
              height: 1,
              color: kblue12915824210,
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          SizedBox(
            width: 280,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      shape: BoxShape.rectangle,
                      color: kblue12915824210,
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: kwhite25525525510,
                      size: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'LOCATION',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: kwhite25525525510,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Nairobi, Kenya',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: kwhite25525525510,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            width: 280,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    shape: BoxShape.rectangle,
                    color: kblue12915824210,
                  ),
                  child: const Icon(
                    Icons.access_time,
                    color: kwhite25525525510,
                    size: 17,
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'LOCAL TIME',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: kwhite25525525510,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '04:05 PM',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: kwhite25525525510,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Expanded(
            child: Container(
              width: size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                shape: BoxShape.rectangle,
                color: kwhite25525525510,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 35,
                    height: 4,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      shape: BoxShape.rectangle,
                      color: kgrey15515515510,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Recent Activities',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: kblack15161810,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 63,
                  ),
                  Text(
                    'no activity',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: kblackgrey79797907,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
