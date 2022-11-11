import 'package:flutter/material.dart';

class Backup extends StatefulWidget {
  const Backup({super.key});

  @override
  State<Backup> createState() => _BackupState();
}

class _BackupState extends State<Backup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backup and Restore'),
        backgroundColor: Colors.black87,
      ),
      body: const Center(
        child: Text(
          'Backup and Restore Page\n\n\t\t\t\t\t\t\t\tis Under Construction',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
