import 'package:shared_preferences/shared_preferences.dart';

const isDarkModeText = 'isDarkMode';

class UserPreference {

  static Future<bool> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isDarkMode = prefs.getBool(isDarkModeText);
    return isDarkMode ?? false;
  }

  static Future<void> updateThemeMode(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDarkModeText, isDarkMode);
  }
}
