import 'package:flutter/material.dart';
import 'package:signature/views/homepage.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xF02b5876),
                Color(0xFF4e4376),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.5, 1.3),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 150),
                child: Image.asset(
                  'assets/images/signature.png',
                  height: 100,
                  width: 200,
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  'Touch finger to unlock',
                  style: TextStyle(
                    color: Colors.white24,
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 25),
                margin: const EdgeInsets.only(bottom: 100),
                child: IconButton(
                  // onPressed: () async {
                  //   isAuthenticated = await AppLockHelper().authenticate();
                  //   setState(() {});
                  // },

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                  },
                  icon: const Icon(
                    Icons.fingerprint,
                    color: Colors.white30,
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
