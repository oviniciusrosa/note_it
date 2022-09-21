import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel {
  late BuildContext context;
  late SharedPreferences _prefs;

  SplashViewModel(this.context);

  void goAhead() async {
    _prefs = await SharedPreferences.getInstance();

    var alreadySeeWelcomeScreen = _prefs.getBool('alreadySeeWelcomeScreen');
    var route = alreadySeeWelcomeScreen == true ? "/home" : "/welcome";

    await Future.delayed(const Duration(milliseconds: 400));

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed(route);
  }
}
