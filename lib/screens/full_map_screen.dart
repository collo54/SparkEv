import 'package:flutter/material.dart';

import '../layouts/full_map_mobile_layout.dart';

class FullMapScreen extends StatelessWidget {
  const FullMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: UniqueKey(),
      builder: (context, constraints) {
        if (constraints.maxWidth > 1020) {
          return const DesktopFullMapScreen();
        } else {
          return const MobileFullMapScreen();
        }
      },
    );
  }
}

//Builds the tablet log in layout according to its constraints
class DesktopFullMapScreen extends StatelessWidget {
  const DesktopFullMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FullMapMobileLayout(); // FullMapDesktopLayout(); TODO
  }
}

//Builds the mobile log in layout according to its constraints
class MobileFullMapScreen extends StatelessWidget {
  const MobileFullMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FullMapMobileLayout();
  }
}
