import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/pages/other_user_profile_page.dart';

class UserProfileMobileLayout extends StatelessWidget {
  const UserProfileMobileLayout({super.key});

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
              SizedBox(
                width: 40,
                height: 40,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtherUserProfilePage(),
                      ),
                    );
                  },
                  elevation: 0,
                  color: kwhite25525525510,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  height: 40,
                  minWidth: 40,
                  child: Image.asset(
                    'assets/images/left2.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Stack(children: [
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
                          top: 26,
                          bottom: 20,
                          left: 14,
                          right: 14,
                        ),
                        child: Text(
                          'C M',
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
                ]),
              ),
              const SizedBox(
                width: 70,
              ),
              InkWell(
                onTap: () {},
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
                  child: Center(
                    child: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset(
                        'assets/images/pencil.png',
                        width: 15,
                        height: 15,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Text(
            'Collins Mutugi',
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
            'Software Developer',
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
                  child: MaterialButton(
                    onPressed: () {},
                    elevation: 0,
                    color: kblue12915824210,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    height: 40,
                    minWidth: 40,
                    child: Image.asset(
                      'assets/images/pin.png',
                      width: 15,
                      height: 15,
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
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: MaterialButton(
                    onPressed: () {},
                    elevation: 0,
                    color: kblue12915824210,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    height: 40,
                    minWidth: 40,
                    child: Image.asset(
                      'assets/images/clock.png',
                      width: 15,
                      height: 15,
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
