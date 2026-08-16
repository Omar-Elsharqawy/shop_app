import 'package:flutter/material.dart';
class MyTextTitle extends StatelessWidget {
  final String text;
  const MyTextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(
      color: Colors.grey.shade700,
      fontWeight: FontWeight.bold,
      fontSize: 20
    ),);
  }
}
