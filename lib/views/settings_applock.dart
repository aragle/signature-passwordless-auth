import 'package:flutter/material.dart';

class AppLockSetup extends StatefulWidget {
  const AppLockSetup({super.key});

  @override
  State<AppLockSetup> createState() => _AppLockSetupState();
}

class _AppLockSetupState extends State<AppLockSetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Lock Settings'),
        backgroundColor: Colors.black87,
      ),
      body: const Center(
        child: Text(
          'App Lock Settings Page\n\n\t\t\t\t\t\t\t\tis Under Construction',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
