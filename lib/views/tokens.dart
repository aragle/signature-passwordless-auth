import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    var items = List<String>.generate(50, (i) => "Token Name ${i + 1}");
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            setState(() => isFABVisible = true);
          } else if (notification.direction == ScrollDirection.reverse) {
            setState(() => isFABVisible = true);
          }
          return true;
        },
        child: ListView.builder(
          itemCount: items.length,
          prototypeItem: ListTile(
            title: Text(items.first),
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: SizedBox(
                height: 500,
                child: Card(
                  child: Text(
                    "${items[index]}\nToken: ${Random().nextInt(1000000)}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFABVisible,
        child: SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            backgroundColor: Colors.black87,
            child: const Icon(Icons.qr_code_scanner_outlined),
          ),
        ),
      ),
    );
  }
}
