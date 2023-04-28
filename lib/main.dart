import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signature/models/onboarding.dart';
import 'package:signature/views/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Signature',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder(
          future: checkIfOnboardingCompleted(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!) {
                return const Login();
              } else {
                return const OnBoarding();
              }
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ));
  }
}

Future<bool> checkIfOnboardingCompleted() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('onboarding_completed') ?? false;
}

Future<void> setOnboardingCompleted() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboarding_completed', true);
}