import 'package:background_services_demo/Home/View/home.dart';
import 'package:background_services_demo/Home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  runApp(GetMaterialApp(
    home: Home(),
    theme: ThemeData.light(useMaterial3: true),
    darkTheme: ThemeData.dark(useMaterial3: true),
  ));
}

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    switch (taskName) {
      case "task1":
        print("input data is ${inputData?["data"]}");
        print("$taskName completed");
        return Future.value(true);
      case "task2":
        print("$taskName completed");
        return Future.value(true);
      default:
    }
    return Future.value(false);
  });
}
