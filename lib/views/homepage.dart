import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:signature/views/devices_main.dart';
import 'package:signature/views/histories_main.dart';
// import 'package:signature/views/tokens_main.dart';
import 'package:signature/views/settings_main.dart';

import 'accounts_main.dart';

Future<bool> onBackPressed() {
  // return exit(1);
  return Future.value(true);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _updateTokenList();
  }

  _updateTokenList() {
    setState(() {
      //_tokenList = LocalDB.instance.getTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
              elevation: 0,
              // bottom: const TabBar(
              //   tabs: [
              //     // Tab(icon: Icon(Icons.local_activity_outlined)),
              //     // Tab(icon: Icon(Icons.devices_outlined)),
              //     Tab(icon: Icon(Icons.manage_accounts_outlined)),
              //     // Tab(icon: Icon(Icons.history_outlined)),
              //   ],
              // ),
              title: Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Image.asset(
                  'assets/images/signature.png',
                  height: 25,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.safety_check_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const History()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.adjust_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.only(right: 10)),
              ],
            ),
            body: const TabBarView(
              children: [
                // TokenPage(),
                // Icon(Icons.local_activity_outlined, size: 100),
                // Device(),
                // Icon(Icons.devices_outlined, size: 100),
                SaveSavedAccounts(),
                // Icon(Icons.manage_accounts_outlined, size: 100),
                // History(),
                // Icon(Icons.history_outlined, size: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
