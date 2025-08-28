import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static Future<void> setValidPhoneNumber() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('isValidPhoneNumber', true);
  }

  static Future<void> setInvalidPhoneNumber() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('isValidPhoneNumber', false);
  }

  static Future<bool> checkValidPhoneNumberStatus() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool('isValidPhoneNumber') ?? false;
  }
}
