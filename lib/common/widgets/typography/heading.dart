import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String message;
  double size = 24;

  Heading(this.message, {this.size = 24, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: size),
    );
  }
}
