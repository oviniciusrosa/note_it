import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel {
  late SharedPreferences _prefs;

  void goAhead({
    required Function(String route) onFinish,
  }) async {
    _prefs = await SharedPreferences.getInstance();

    var alreadySeeWelcomeScreen = _prefs.getBool('alreadySeeWelcomeScreen');
    var route = alreadySeeWelcomeScreen == true ? "/home" : "/welcome";

    await Future.delayed(const Duration(milliseconds: 400));
    onFinish(route);
  }
}
