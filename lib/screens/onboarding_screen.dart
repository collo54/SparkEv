import 'package:flutter/material.dart';

import '../layouts/onboarding_mobile_layout.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: UniqueKey(),
      builder: (context, constraints) {
        if (constraints.maxWidth > 1020) {
          return const DesktopOnboardingScreen();
        } else {
          return const MobileOnboardingScreen();
        }
      },
    );
  }
}

//Builds the tablet log in layout according to its constraints
class DesktopOnboardingScreen extends StatelessWidget {
  const DesktopOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnboardingMobileLayout(); // OnboardingDesktotLayout(); TODO
  }
}

//Builds the mobile log in layout according to its constraints
class MobileOnboardingScreen extends StatelessWidget {
  const MobileOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnboardingMobileLayout();
  }
}
