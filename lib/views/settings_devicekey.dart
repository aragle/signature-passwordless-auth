import 'package:flutter/material.dart';

class DeviceKey extends StatefulWidget {
  const DeviceKey({super.key});

  @override
  State<DeviceKey> createState() => _DeviceKeyState();
}

class _DeviceKeyState extends State<DeviceKey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Public Key'),
        backgroundColor: Colors.black87,
      ),
      body: const Center(
        child: Text(
          'Device Public Key Previewing Page\n\n\t\t\t\t\t\t\t\tis Under Construction',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
