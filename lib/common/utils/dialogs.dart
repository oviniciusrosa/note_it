import 'package:flutter/material.dart';

class LoadingDialog {
  LoadingDialog(this.context);

  BuildContext context;

  void close() => Navigator.pop(context);

  void show() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: const AlertDialog(
          content: Text("Carregando..."),
        ),
      ),
    );
  }
}
