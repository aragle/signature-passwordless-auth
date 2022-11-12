import 'package:flutter/material.dart';

class Toast extends StatefulWidget {
  const Toast({super.key, required this.msg});

  final String msg;

  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showToast(context);
          },
          child: Text(widget.msg),
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(widget.msg, textAlign: TextAlign.center),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
