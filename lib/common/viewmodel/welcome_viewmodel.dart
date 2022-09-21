import 'package:flutter/cupertino.dart';
import 'package:note_it/common/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeViewModel {
  BuildContext context;
  final repository = AuthRepository();
  late SharedPreferences _prefs;

  WelcomeViewModel(this.context);

  void signIn() async {
    _prefs = await SharedPreferences.getInstance();

    await _prefs.setBool('alreadySeeWelcomeScreen', true);

    Navigator.pushReplacementNamed(context, '/home');
  }
}
