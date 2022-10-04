import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Settings'),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Feedback'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          backgroundColor: Colors.black87,
          elevation: 0,
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.key_outlined),
                  title: const Text('Device Public Key'),
                  value: const Text('E9C0K-285KJ-LY7E9-0XM35'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.language_outlined),
                  title: const Text('Language'),
                  value: const Text('English'),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {},
                  initialValue: false,
                  leading: const Icon(Icons.dark_mode_outlined),
                  title: const Text('Dark Mode'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.private_connectivity_outlined),
                  title: const Text('Privacy Policy'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.toc_outlined),
                  title: const Text('Terms and Conditions'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.support_outlined),
                  title: const Text('Support'),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('About Us'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
