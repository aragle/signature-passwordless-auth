import 'package:flutter/material.dart';

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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('About (v1.0.0)'),
                      content: const Text(
                          'Signature is a biometric based web auth app developed by\n\n    Ashiqur Rahman Alif\n    @aratheunseen\n\nThis is an open source application and available on GitHub.'),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const Padding(padding: EdgeInsets.only(right: 10)),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
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
