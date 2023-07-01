import 'package:workmanager/workmanager.dart';

class Service {
  static void callbackDispatcher() {
    Workmanager().executeTask((taskName, inputData) {
      switch (taskName) {
        case "task1":
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
}
