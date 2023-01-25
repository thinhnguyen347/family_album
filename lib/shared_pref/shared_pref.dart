import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static setValidPhoneNumber() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('isValidPhoneNumber', true);
  }

  static Future<bool> checkValidPhoneStatus() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool('isValidPhoneNumber') ?? false;
  }
}
