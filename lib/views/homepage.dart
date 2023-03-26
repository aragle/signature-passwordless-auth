import 'dart:math';

import 'package:flutter/material.dart';
import 'package:signature/views/activities.dart';
import 'package:signature/views/settings.dart';
import 'package:signature/models/qr.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

Future<bool> onBackPressed() {
  // return exit(1);
  return Future.value(true);
}

int x = Random().nextInt(10);

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
              backgroundColor: Colors.grey[900],
              // elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Image.asset(
                  'assets/images/signature.png',
                  height: 25,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QRScanner()),
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
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black12,
                        width: 1,
                      ),
                    ),
                  ),
                  child: const ListTile(
                    contentPadding: EdgeInsets.all(5),
                    leading: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 30,
                        child: Icon(
                          // Icons.info_outline_rounded, //info
                          Icons.error_outline_rounded, //error
                          // Icons.warning_amber_rounded, //warning
                          size: 20,
                          // color: Color.fromARGB(255, 0, 153, 38), //info
                          // color: Color.fromARGB(255, 177, 152, 10), //warning
                          color: Color.fromARGB(255, 172, 35, 103), //error
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Text(
                        'You are logged in to BrandShop from Windows 10 - Chrome 107.0.5304.87 (Dhaka, Bangladesh)',
                        // "${Random().nextInt(1000000)}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // color: Color.fromARGB(255, 172, 35, 103),
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding:
                          EdgeInsets.only(top: 5.0, left: 4.0, bottom: 5.0),
                      child: Text(
                        'on 2021-07-01 12:00:00',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                );
              },
            ),
            floatingActionButton: Visibility(
              child: SizedBox(
                width: 42,
                height: 42,
                child: FloatingActionButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QRScanner()),
                    );
                    setState(() {});
                  },
                  backgroundColor: Colors.grey[900],
                  child: const Icon(Icons.add_outlined),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
