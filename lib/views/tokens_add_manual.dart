import 'package:flutter/material.dart';
import 'package:signature/database/local_tokens.dart';
import 'package:signature/models/token.dart';
import 'package:signature/views/homepage.dart';
import 'tokens_add_via_qr.dart';

class AddCodeManual extends StatefulWidget {
  final Token? token;
  const AddCodeManual({super.key, this.token});

  @override
  State<AddCodeManual> createState() => _AddCodeManualState();
}

class _AddCodeManualState extends State<AddCodeManual> {
  final _formKey = GlobalKey<FormState>();
  String issuerName = '';
  String accountName = '';
  String secretCode = '';
  late String type = 'TOTP';
  late int otpLength = 6;

  final List<String> typeList = ['TOTP', 'HOTP'];
  final List<int> otpLengthList = [6, 8];

  @override
  void initState() {
    super.initState();

    if (widget.token != null) {
      issuerName = widget.token!.issuerName;
      accountName = widget.token!.accountName;
      secretCode = widget.token!.secretCode;
      type = widget.token!.type;
      otpLength = widget.token!.otpLength;
    }
  }

  _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      Token token = Token(
        issuerName: issuerName,
        accountName: accountName,
        secretCode: secretCode,
        type: type,
        otpLength: otpLength,
        status: 1,
      );
      if (widget.token == null) {
        // Insert the task to our user's database
        token.status = 1;
        TokenDatabase.instance.insertToken(token);
        // Toast.show("New Task Added", context,
        //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      } else {
        // Update the task
        // task.id = widget.task.id;
        // task.status = widget.task.status;
        // DatabaseHelper.instance.updateTask(task);
        // Toast.show("Task Updated", context,
        //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
      // widget.updateTokenList();
    }
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Account Name',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (input) => input!.trim().isEmpty
                        ? 'Please enter account name'
                        : null,
                    onSaved: (input) => accountName = input!,
                    initialValue: accountName,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Issuer Name',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (input) => input!.trim().isEmpty
                        ? 'Please enter issuer name'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Secret Code',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (input) => input!.trim().isEmpty
                        ? 'Please enter secret code'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    isDense: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 22,
                    iconEnabledColor: Colors.black,
                    // ignore: prefer_const_literals_to_create_immutables
                    items: typeList.map((String type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Type of Key',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (input) => typeList.contains(input)
                        ? null
                        : 'Please select a valid type',
                    onChanged: (String? value) {
                      setState(() {
                        type = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    isDense: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 22,
                    iconEnabledColor: Colors.black,
                    // ignore: prefer_const_literals_to_create_immutables
                    items: otpLengthList.map((int otpLength) {
                      return DropdownMenuItem(
                        value: otpLength,
                        child: Text(otpLength.toString()),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'OTP Length',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (input) => otpLengthList.contains(input)
                        ? null
                        : 'Please select a valid OTP length',
                    onChanged: (int? value) {
                      setState(() {
                        otpLength = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _submit();
                    },
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
            ),
          )),
        ));
  }
}
