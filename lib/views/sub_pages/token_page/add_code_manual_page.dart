import 'package:flutter/material.dart';
import 'add_code_via_qr_page.dart';

class AddCodeManual extends StatefulWidget {
  const AddCodeManual({super.key});

  @override
  State<AddCodeManual> createState() => _AddCodeManualState();
}

class _AddCodeManualState extends State<AddCodeManual> {
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
        title: const Text('Enter Account Details'),
        // centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddViaQRCode(),
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
            Icon(Icons.construction_outlined, size: 100, color: Colors.black45),
      ),
    );
  }
}
