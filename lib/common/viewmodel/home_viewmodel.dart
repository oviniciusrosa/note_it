import 'package:flutter/material.dart';

class HomeViewModel {
  HomeViewModel(this.context);

  BuildContext context;

  void navigateToNotesCriation() {
    Navigator.pushNamed(context, "/create-note");
  }
}
