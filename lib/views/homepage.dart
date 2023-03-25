import 'package:flutter/material.dart';
import 'package:signature/views/activities.dart';
import 'package:signature/views/settings.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

Future<bool> onBackPressed() {
  // return exit(1);
  return Future.value(true);
}

class _HomepageState extends State<Homepage> {
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
                      MaterialPageRoute(
                          builder: (context) => const Activities()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.adjust_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Settings()),
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
                //SaveSavedAccounts(),
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
