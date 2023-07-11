import 'package:flutter/material.dart';
import 'package:spark_ev/constants/colors.dart';
import 'package:spark_ev/custom/auth_helper.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SparkEv',
      theme: ThemeData(
        primaryColor: kwhite25525525510,
        useMaterial3: true,
      ),
      home: AuthHelper(),
    );
  }
}
