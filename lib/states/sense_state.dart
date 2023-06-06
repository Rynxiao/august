import 'package:flutter/foundation.dart';

import '../models/commonSense/sense_type.dart';
import '../network/type.dart';

class SenseState extends ChangeNotifier {
  List<SenseType> types = [SenseType(id: '0', title: '最新')];

  Future<void> getAllTypes() async {
    final responses = await getSenseTypeByPage(pageSize: 1000);

    if (responses.isNotEmpty) {
      types = { ...types, ...responses }.toList();
      notifyListeners();
    }
  }
}
