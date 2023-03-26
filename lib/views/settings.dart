import 'package:flutter/material.dart';
import 'package:signature/views/homepage.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          elevation: 0,
          title: const Text('Settings',
              style: TextStyle(
                color: Colors.white,
              )),
          actions: [
            IconButton(
              icon: const Icon(Icons.feedback_outlined, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              },
            ),
            const Padding(padding: EdgeInsets.only(right: 10)),
          ],
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Homepage()),
              );
            },
          ),
        ),
        body: const Center(
          child: Text('Settings'),
        ),
      ),
    );
  }
}
