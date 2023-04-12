import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveService {
  openBox<T>({required String boxName}) async {
    Box box = await Hive.openBox(boxName);
    return box;
  }

  isExists<T>({String? boxName}) async {
    final openBox = await Hive.openBox<T>(boxName!);
    int length = openBox.length;
    openBox.close();
    return length != 0;
  }

  addBoxes<T>(items, String boxName) async {
    final openBox = await Hive.openBox<T>(boxName);
    openBox.deleteAll(openBox.keys);
    openBox.add(items);
    debugPrint("adding boxes $boxName");
    debugPrint("${openBox.values}");
    //openBox.close();
  }

  removeDataFromBox<T>(items, String boxName) async {
    debugPrint("remove $boxName boxes");
    final openBox = await Hive.openBox<T>(boxName);
    //await box.delete(damagePostDataModel.surveyId);
    openBox.delete(items);
    debugPrint("remove boxes done");
    openBox.close();
  }

  getBoxes<T>(String boxName) async {
    final openBox = await Hive.openBox<T>(boxName);
    // debugPrint("box data ${openBox.values}");
    return openBox.values.cast<T>;
  }
}
