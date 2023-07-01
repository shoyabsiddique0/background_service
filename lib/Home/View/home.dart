import 'package:background_services_demo/Home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Background Task Demo"),
        centerTitle: true,
        actions: [
          Obx(
            () => Switch(
                value: controller.toggle.value,
                onChanged: (val) {
                  if (val) {
                    controller.themeMode.value = ThemeMode.dark;
                  } else {
                    controller.themeMode.value = ThemeMode.light;
                  }
                  Get.changeThemeMode(controller.themeMode.value);
                  controller.toggle.value = !controller.toggle.value;
                }),
          )
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    var uniqueId = DateTime.now.toString();
                    Workmanager().registerOneOffTask(uniqueId, "task1",
                        constraints:
                            Constraints(networkType: NetworkType.connected),
                        initialDelay: const Duration(seconds: 5),
                        tag: "task1",
                        backoffPolicy: BackoffPolicy.linear,
                        inputData: {"data": "data"},
                        existingWorkPolicy: ExistingWorkPolicy.append);
                  },
                  child: const Text("One Time Task")),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text("Periodic Task Time Task")),
              ElevatedButton(
                  onPressed: () {
                    Workmanager().cancelAll();
                  },
                  child: const Text("Cancel Task")),
            ]),
      ),
    );
  }
}
