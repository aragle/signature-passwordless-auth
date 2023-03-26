import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signature/views/applock.dart';
import 'package:signature/views/homepage.dart';
import 'package:signature/views/login.dart';
import 'package:signature/controllers/variables.dart' as globals;
import 'package:signature/models/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Signature',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: globals.isFirstTime
          ? const OnBoarding()
          : (globals.isAuthenticated
              ? (globals.isLocked ? const LockScreen() : const Homepage())
              : const Login()),
    );
  }
}
