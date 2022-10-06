import 'package:flutter/material.dart';
import '../models/cards/token_card.dart';
import 'settings.dart';

class TokenPage extends StatefulWidget {
  const TokenPage({super.key});

  @override
  State<TokenPage> createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  @override
  Widget build(BuildContext context) {
    bool isFABVisible = true;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (context, index) {
                return const TokenCard();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFABVisible,
        child: SizedBox(
          width: 35,
          height: 35,
          child: FloatingActionButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0))),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            backgroundColor: Colors.black87,
            child: const Icon(Icons.add_outlined),
          ),
        ),
      ),
    );
  }
}
