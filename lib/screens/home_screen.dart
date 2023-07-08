import 'package:flutter/material.dart';

import '../layouts/home_page_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: UniqueKey(),
      builder: (context, constraints) {
        if (constraints.maxWidth > 1020) {
          return const DesktopHomeScreen();
        } else {
          return const MobileHomeScreen();
        }
      },
    );
  }
}

//Builds the tablet log in layout according to its constraints
class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePageMobileLayout(); // HomeDesktopLayout(); TODO
  }
}

//Builds the mobile log in layout according to its constraints
class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePageMobileLayout();
  }
}
