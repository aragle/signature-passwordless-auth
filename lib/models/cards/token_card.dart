import 'dart:math';

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
        contentPadding: EdgeInsets.all(5),
        title: Padding(
          padding: EdgeInsets.only(top: 2.0),
          child: Text(
            "12345678",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromARGB(255, 172, 35, 103),
              fontWeight: FontWeight.w500,
              fontSize: 28,
            ),
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Text(
            "Facebook (aratheunseen)",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 14,
            ),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 8.0, left: 12.0),
          child: Icon(
            Icons.timer_outlined,
            size: 25,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
