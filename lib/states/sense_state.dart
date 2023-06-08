import 'package:flutter/foundation.dart';
import 'package:simple_calendar/models/commonSense/common_sense.dart';

import '../models/commonSense/sense_type.dart';
import '../network/sense.dart';
import '../network/type.dart';

enum SensesType { all, liked }

class SenseState extends ChangeNotifier {
  List<SenseType> types = [SenseType(id: '0', title: '最新')];

  String selectedTypeId = '0';

  List<CommonSense> senses = [];
  bool loading = false;
  Object? error;

  setType(String typeId) {
    selectedTypeId = typeId;
    getSenses();

    notifyListeners();
  }

  Future<void> getAllTypes() async {
    final responses = await getSenseTypeByPage(pageSize: 1000);

    if (responses.isNotEmpty) {
      types = {...types, ...responses}.toList();
      notifyListeners();
    }
  }

  Future<void> getSenses() async {
    loading = true;
    try {
      senses = selectedTypeId == '0'
          ? await getCommonSenseByPage()
          : await getCommonSenseByTypeId(selectedTypeId);

      loading = false;
    } catch (exception) {
      error = exception;
      loading = false;
    }

    notifyListeners();
  }

  Future<void> getLikedSenses() async {
    loading = true;
    try {
      senses = await getLikedCommonSenses();

      loading = false;
    } catch (exception) {
      error = exception;
      loading = false;
    }

    notifyListeners();
  }

  updateRead(CommonSense updateSense) {
    senses = senses.map((sense) {
      if (sense.id == updateSense.id) {
        sense.read = 1;
      }

      return sense;
    }).toList();

    notifyListeners();
  }

  toggleLike(CommonSense updateSense) {
    senses = senses.map((sense) {
      if (sense.id == updateSense.id) {
        var updateLike = updateSense.liked == 0 ? 1 : 0;
        sense.liked = updateLike;
      }

      return sense;
    }).toList();

    notifyListeners();
  }
}
