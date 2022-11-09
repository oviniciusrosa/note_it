import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String message;
  double size = 16;
  TextAlign align = TextAlign.start;

  Subtitle(
    this.message, {
    this.size = 16,
    this.align = TextAlign.start,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      textAlign: align,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: size,
      ),
    );
  }
}
