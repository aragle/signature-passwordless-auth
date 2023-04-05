import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int groupValue = 1;
  List<String> subTitle = ["French", "English", "Spanish"];
  String name = "John";
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
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.feedback_outlined, color: Colors.white),
          //     onPressed: () {
          //       showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             title: const Text('About (v1.0.0)'),
          //             content: const Text(
          //                 'Signature is a biometric based web auth app developed by\n\n    Ashiqur Rahman Alif\n    @aratheunseen\n\nThis is an open source application and available on GitHub.'),
          //             actions: [
          //               TextButton(
          //                 child: const Text('OK'),
          //                 onPressed: () {
          //                   Navigator.of(context).pop();
          //                 },
          //               ),
          //             ],
          //           );
          //         },
          //       );
          //     },
          //   ),
          //   const Padding(padding: EdgeInsets.only(right: 10)),
          // ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('Account'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.account_tree_outlined),
                  title: Text('+880 17 * * * * * 222'.toString()),
                  value: const Text('Phone number'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.private_connectivity_rounded),
                  title: Text('6b 86 b2 73 ff 34 fc e1'.toUpperCase()),
                  value: const Text('Device ID'),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('System'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.fingerprint_outlined),
                  title: const Text('App Lock'),
                  value: const Text('Disable'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.backup_outlined),
                  title: const Text('Backup and Restore'),
                  value: const Text('Google Drive (Encrypted)'),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('Advanced'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.policy_outlined),
                  title: const Text('Terms of Service'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text('Privacy Policy'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.feedback_outlined),
                  title: const Text('Feedback'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('About'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
