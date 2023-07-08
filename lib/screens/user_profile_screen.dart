import 'package:flutter/material.dart';

import '../layouts/user_profile_layout.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: UniqueKey(),
      builder: (context, constraints) {
        if (constraints.maxWidth > 1020) {
          return const DesktopUserProfileScreen();
        } else {
          return const MobileUserProfileScreen();
        }
      },
    );
  }
}

//Builds the tablet log in layout according to its constraints
class DesktopUserProfileScreen extends StatelessWidget {
  const DesktopUserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserProfileMobileLayout(); // OnboardingDesktotLayout(); TODO
  }
}

//Builds the mobile log in layout according to its constraints
class MobileUserProfileScreen extends StatelessWidget {
  const MobileUserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserProfileMobileLayout();
  }
}
