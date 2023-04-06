import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

final _auth = FirebaseAuth.instance;

class _SettingsState extends State<Settings> {
  String phoneNumber = _auth.currentUser?.phoneNumber ?? '';
  String uniqueID = _auth.currentUser?.uid ?? '';

  Function hidePhoneNumber = (String phoneNumber) {
    String countryCode = phoneNumber.substring(0, 3);
    String operatorCode = phoneNumber.substring(4, 6);
    String endDigits = phoneNumber.substring(11, 14);
    String hiddenPhoneNumber =
        '$countryCode $operatorCode * * * * * $endDigits';
    return hiddenPhoneNumber;
  };

  Function communicationKey = (String uniqueID, String phoneNumber) {
    String lastDigit = phoneNumber.substring(12, 13);
    int numberKey = int.parse(lastDigit);
    String deviceID = uniqueID.substring(numberKey, numberKey + 16);

    deviceID =
        deviceID.replaceAllMapped(RegExp(r'.{1,2}'), (Match m) => '${m[0]} ');

    return deviceID;
  };

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
                  title: Text(hidePhoneNumber(phoneNumber).toUpperCase()),
                  value: const Text('Phone number'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.private_connectivity_rounded),
                  title: Text(
                      communicationKey(uniqueID, phoneNumber).toUpperCase()),
                  value: const Text('Communication key'),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('System'),
              tiles: <SettingsTile>[
                SettingsTile.switchTile(
                  leading: const Icon(Icons.lock_outline_rounded),
                  title: const Text('App Lock'),
                  initialValue: false,
                  onToggle: (bool value) {},
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
