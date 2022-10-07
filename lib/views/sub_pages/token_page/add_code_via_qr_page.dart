import 'package:flutter/material.dart';
import 'add_code_manual_page.dart';

class AddViaQRCode extends StatefulWidget {
  const AddViaQRCode({super.key});

  @override
  State<AddViaQRCode> createState() => _AddViaQRCodeState();
}

class _AddViaQRCodeState extends State<AddViaQRCode> {
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
        title: const Text('Scan QR Code'),
        // centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddCodeManual(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.black87,
        elevation: 0,
      ),
      body: const Center(
        child:
            Icon(Icons.crop_square_rounded, size: 300, color: Colors.white24),
      ),
      backgroundColor: Colors.black,
    );
  }
}
