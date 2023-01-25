import 'package:flutter/material.dart';
import 'package:otp/otp.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final code = OTP.generateTOTPCodeString(
      'JBSWY3DPEHPK3PXP', DateTime.now().millisecondsSinceEpoch);

  int remainingTime = OTP.remainingSeconds();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('History'),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return {'Feedback'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text('5'),
                );
              }).toList();
            },
          ),
        ],
        backgroundColor: Colors.redAccent,
        elevation: 0,
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
                    Icons.info_outline,
                    size: 20,
                    color: Color.fromARGB(255, 120, 122, 124), //warning
                    // color: Color.fromARGB(255, 177, 152, 10), //warning
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              //   child: CircularCountDownTimer(
              //     duration: 30,
              //     initialDuration: 30 - remainingTime,
              //     width: 20,
              //     height: 35,
              //     ringColor: Colors.white,
              //     fillColor: Colors.black45,
              //     backgroundColor: Colors.white,
              //     strokeWidth: 3.0,
              //     strokeCap: StrokeCap.round,
              //     textStyle: const TextStyle(
              //       fontSize: 10.0,
              //       color: Colors.black45,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     textFormat: CountdownTextFormat.S,
              //     isReverse: true,
              //     isReverseAnimation: true,
              //     isTimerTextShown: true,
              //     autoStart: true,
              //     onComplete: () {
              //       // Navigator.push(
              //       //   context,
              //       //   MaterialPageRoute(builder: (context) => const HomePage()),
              //       // );
              //     },
              //     onChange: (String remainingTime) {},
              //   ),
              // ),

              // Padding(
              //   padding: EdgeInsets.only(top: 10.0, left: 12.0),
              //   child: Icon(
              //     Icons.timer_outlined,
              //     size: 25,
              //     color: Colors.black45,
              //   ),
              // ),
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
                padding: EdgeInsets.only(top: 5.0, left: 4.0, bottom: 5.0),
                child: Text(
                  'on 2021-07-01 12:00:00',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14,
                  ),
                ),
              ),
              // trailing: Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: IconButton(
              //     icon: const Icon(
              //       Icons.copy_outlined,
              //       size: 20.0,
              //       color: Colors.black45,
              //     ),
              //     onPressed: () {
              //       FlutterClipboard.copy(code);
              //       _showToast(context);
              //     },
              //   ),
              // ),
            ),
          );
        },
      ),
    );
  }

  // void _showToast(BuildContext context) {
  //   final scaffold = ScaffoldMessenger.of(context);
  //   scaffold.showSnackBar(
  //     const SnackBar(
  //       content: Text('Copied to clipboard', textAlign: TextAlign.center),
  //     ),
  //   );
  // }
}
