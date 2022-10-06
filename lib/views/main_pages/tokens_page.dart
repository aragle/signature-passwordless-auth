import 'dart:math';

import 'package:flutter/material.dart';
import '../sub_pages/add_code_manual_page.dart';

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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12,
                  width: 1,
                ),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(5),
              leading: Padding(
                padding: EdgeInsets.only(top: 10.0, left: 12.0),
                child: Icon(
                  Icons.timer_outlined,
                  size: 25,
                  color: Colors.black45,
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  "${Random().nextInt(1000000)}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 172, 35, 103),
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 4.0, bottom: 6.0),
                child: Text(
                  "Facebook (account${Random().nextInt(100)})",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14,
                  ),
                ),
              ),
              trailing: Padding(
                padding: EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(
                    Icons.copy_outlined,
                    size: 20.0,
                    color: Colors.black45,
                  ),
                  onPressed: () {
                    _showToast(context);
                    const Text('Show toast');
                    //   _onDeleteItemPressed(index);
                  },
                ),
              ),
            ),
          );
        },
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
                MaterialPageRoute(builder: (context) => const AddCodeManual()),
              );
            },
            backgroundColor: Colors.black87,
            child: const Icon(Icons.add_outlined),
          ),
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Copied to clipboard', textAlign: TextAlign.center),
      ),
    );
  }
}
