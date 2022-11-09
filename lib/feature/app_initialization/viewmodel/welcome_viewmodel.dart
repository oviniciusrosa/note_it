import 'package:shared_preferences/shared_preferences.dart';

class WelcomeViewModel {
  late SharedPreferences _prefs;

  Future<void> signIn() async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool('alreadySeeWelcomeScreen', true);
  }
}
