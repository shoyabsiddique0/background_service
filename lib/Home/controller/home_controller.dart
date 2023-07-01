import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';

class HomeController extends GetxController {
  var toggle = true.obs;
  var themeMode = ThemeMode.dark.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    var uniqueId = DateTime.now().toString();
    Workmanager().registerPeriodicTask(uniqueId, "task2",
        frequency: Duration(minutes: 15),
        existingWorkPolicy: ExistingWorkPolicy.append);
    super.onInit();
  }
}
