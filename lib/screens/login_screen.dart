import 'package:flutter/material.dart';

import '../layouts/login_mobile_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: UniqueKey(),
      builder: (context, constraints) {
        if (constraints.maxWidth > 1020) {
          return const DesktopLoginScreen();
        } else {
          return const MobileLoginScreen();
        }
      },
    );
  }
}

//Builds the tablet log in layout according to its constraints
class DesktopLoginScreen extends StatelessWidget {
  const DesktopLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginMobileLayout(); // LoginDesktotLayout(); TODO
  }
}

//Builds the mobile log in layout according to its constraints
class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginMobileLayout();
  }
}
