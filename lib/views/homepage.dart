import 'package:flutter/material.dart';
import 'package:signature/views/tokens.dart';
import 'settings.dart';
import '../models/token_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.local_activity_outlined)),
                Tab(icon: Icon(Icons.devices_outlined)),
                Tab(icon: Icon(Icons.manage_accounts_outlined)),
                Tab(icon: Icon(Icons.history_outlined)),
              ],
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Image.asset(
                'assets/images/signature.png',
                height: 25,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
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
              TokenPage(),
              TokenCard(),
              // Icon(Icons.local_activity_outlined, size: 100),
              Icon(Icons.devices_outlined, size: 100),
              // Icon(Icons.manage_accounts_outlined, size: 100),
              Icon(Icons.history_outlined, size: 100),
            ],
          ),
        ),
      ),
    );
  }
}
