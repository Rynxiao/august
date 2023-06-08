import 'package:flutter/foundation.dart';
import 'package:simple_calendar/db/user_preference.dart';

class GlobalState extends ChangeNotifier {
  bool isDarkMode = true;

  GlobalState(this.isDarkMode);

  void toggleTheme() async {
    isDarkMode = !isDarkMode;
    UserPreference.updateThemeMode(isDarkMode);
    notifyListeners();
  }
}
