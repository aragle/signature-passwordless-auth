import 'package:flutter/material.dart';

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
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.devices)),
                Tab(icon: Icon(Icons.history)),
                Tab(icon: Icon(Icons.qr_code)),
              ],
            ),
            title: Image.asset(
              'assets/images/signature.png',
              height: 25,
            ),
            centerTitle: true,
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.devices),
              Icon(Icons.history),
              Icon(Icons.qr_code),
            ],
          ),
        ),
      ),
    );
  }
}
