import 'package:flutter/material.dart';
import 'package:note_it/common/constants/theme_constants.dart';

class Message {
  Message(this.context);

  BuildContext context;

  void success(message) {
    _messageSkeleton(Text(message, style: const TextStyle(color: Colors.green)));
  }

  void error(message) {
    _messageSkeleton(Text(message, style: const TextStyle(color: Colors.red)));
  }

  void _messageSkeleton(Widget content) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 600),
        backgroundColor: cSecondaryColor,
        content: content,
      ),
    );
  }
}
