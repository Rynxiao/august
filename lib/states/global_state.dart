import 'package:flutter/foundation.dart';

import '../core/calendar.dart';
import '../models/calendar/calendar_date.dart';

class GlobalState extends ChangeNotifier {
  bool isDarkMode = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
