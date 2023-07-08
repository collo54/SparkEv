import 'package:flutter/material.dart';

import '../layouts/other_user_profile_layout.dart';

class OtherUserProfileScreen extends StatelessWidget {
  const OtherUserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: UniqueKey(),
      builder: (context, constraints) {
        if (constraints.maxWidth > 1020) {
          return const DesktopOtherUserProfileScreen();
        } else {
          return const MobileOtherUserProfileScreen();
        }
      },
    );
  }
}

//Builds the tablet log in layout according to its constraints
class DesktopOtherUserProfileScreen extends StatelessWidget {
  const DesktopOtherUserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OtherUserProfileMobileLayout(); // OnboardingDesktotLayout(); TODO
  }
}

//Builds the mobile log in layout according to its constraints
class MobileOtherUserProfileScreen extends StatelessWidget {
  const MobileOtherUserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OtherUserProfileMobileLayout();
  }
}
