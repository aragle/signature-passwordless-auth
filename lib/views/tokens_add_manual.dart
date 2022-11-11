import 'package:flutter/material.dart';
import 'tokens_add_via_qr.dart';

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
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                // const Text(
                //   'Enter the details of the account you want to add.',
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Account Name',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Issuer Name',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Secret Code',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField(
                  isDense: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 22,
                  iconEnabledColor: Colors.black,
                  // ignore: prefer_const_literals_to_create_immutables
                  items: [
                    const DropdownMenuItem(
                      child: Text('TOTP'),
                      value: 'TOTP',
                    ),
                    const DropdownMenuItem(
                      child: Text('HOTP'),
                      value: 'HOTP',
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Type of Key',
                    labelStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String? value) {},
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 20,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddViaQRCode(),
                      ),
                    );
                  },
                  child: const Text(
                    'Add account via QR Scanner',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
