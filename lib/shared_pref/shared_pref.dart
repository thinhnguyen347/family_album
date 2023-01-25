import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static setValidPhoneNumber() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('isValidPhoneNumber', true);
  }

  static setInvalidPhoneNumber() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('isValidPhoneNumber', false);
  }

  static Future<bool> checkValidPhoneNumberStatus() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool('isValidPhoneNumber') ?? false;
  }
}
