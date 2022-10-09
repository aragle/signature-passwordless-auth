import 'dart:math';

import 'package:flutter/material.dart';
import '../sub_pages/token_page/add_code_manual_page.dart';
import 'package:otp/otp.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:clipboard/clipboard.dart';

class TokenPage extends StatefulWidget {
  const TokenPage({super.key});

  @override
  State<TokenPage> createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  final code = OTP.generateTOTPCodeString(
      'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch);

  final int remainingTime = OTP.remainingSeconds();

  @override
  Widget build(BuildContext context) {
    bool isFABVisible = true;
    return Scaffold(
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
            child: ListTile(
              contentPadding: const EdgeInsets.all(5),
              leading: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: CircularCountDownTimer(
                  duration: 30,
                  initialDuration: 30 - remainingTime,
                  width: 20,
                  height: 35,
                  ringColor: Colors.white,
                  fillColor: Colors.black45,
                  backgroundColor: Colors.white,
                  strokeWidth: 3.0,
                  strokeCap: StrokeCap.round,
                  textStyle: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                  textFormat: CountdownTextFormat.S,
                  isReverse: true,
                  isReverseAnimation: true,
                  isTimerTextShown: true,
                  autoStart: true,
                  onComplete: () {},
                  onChange: (String timeStamp) {},
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.only(top: 10.0, left: 12.0),
              //   child: Icon(
              //     Icons.timer_outlined,
              //     size: 25,
              //     color: Colors.black45,
              //   ),
              // ),
              title: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  code,
                  // "${Random().nextInt(1000000)}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    // color: Color.fromARGB(255, 172, 35, 103),
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                  ),
                ),
              ),
              subtitle: const Padding(
                padding: EdgeInsets.only(left: 4.0, bottom: 6.0),
                child: Text(
                  'Company (user_account)',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14,
                  ),
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.copy_outlined,
                    size: 20.0,
                    color: Colors.black45,
                  ),
                  onPressed: () {
                    FlutterClipboard.copy(code);
                    _showToast(context);
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
      const SnackBar(
        content: Text('Copied to clipboard', textAlign: TextAlign.center),
      ),
    );
  }
}
