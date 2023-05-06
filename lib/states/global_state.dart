import 'package:flutter/foundation.dart';

import '../core/calendar.dart';
import '../models/calendar_date.dart';

class GlobalState extends ChangeNotifier {
  bool isDarkMode = true;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
