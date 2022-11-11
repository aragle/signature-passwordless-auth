import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:signature/features/browser.dart';
import 'package:signature/views/settings_about.dart';
import 'package:signature/views/settings_applock.dart';
import 'package:signature/views/settings_backup.dart';
import 'package:signature/views/settings_devicekey.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // ignore: non_constant_identifier_names
  SendFeedback() async {
    final mailtoLink = Mailto(
      to: ['signature.wecare@gmail.com'],
      // cc: ['cc1@example.com', 'cc2@example.com'],
      subject: 'Feedback for Signature App',
      body: '',
    );
    // ignore: deprecated_member_use
    await launch('$mailtoLink');
  }

  void handleClick(String value) {
    switch (value) {
      case 'Feedback':
        SendFeedback();
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
                  onPressed: (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DeviceKey(),
                      ),
                    );
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.backup_outlined),
                  title: const Text('Backup and Restore'),
                  value: const Text('Enabled (Google Drive: mail@google.com)'),
                  onPressed: (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Backup(),
                      ),
                    );
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.lock_outlined),
                  title: const Text('App Lock'),
                  value: const Text('Disabled'),
                  onPressed: (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppLockSetup(),
                      ),
                    );
                  },
                ),
                // SettingsTile.switchTile(
                //   onToggle: (value) {},
                //   initialValue: false,
                //   leading: const Icon(Icons.dark_mode_outlined),
                //   title: const Text('Dark Mode'),
                // ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.private_connectivity_outlined),
                  title: const Text('Privacy Policy'),
                  onPressed: ((context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Browser(
                            title: 'Privacy Policy',
                            url:
                                'https://signature-auth.web.app/policies/privacy.html'),
                      ),
                    );
                  }),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.toc_outlined),
                  title: const Text('Terms and Conditions'),
                  onPressed: ((context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Browser(
                            title: 'Terms and Conditions',
                            url:
                                'https://signature-auth.web.app/policies/terms-and-conditions.html'),
                      ),
                    );
                  }),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.support_outlined),
                  title: const Text('Support'),
                  onPressed: ((context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Browser(
                            title: 'Support',
                            url: 'https://signature-auth.web.app/support.html'),
                      ),
                    );
                  }),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.book_outlined),
                  title: const Text('User Manual'),
                  onPressed: ((context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Browser(
                            title: 'User Manual',
                            url:
                                'https://signature-auth.web.app/user-manual.html'),
                      ),
                    );
                  }),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('About'),
                  onPressed: ((context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const About(),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
