import 'package:flutter/material.dart';

class TokenCard extends StatefulWidget {
  const TokenCard({super.key});

  @override
  State<TokenCard> createState() => _TokenCardState();
}

class _TokenCardState extends State<TokenCard> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        title: Text(
          "Token Name",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
