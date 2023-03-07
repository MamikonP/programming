import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/themes/theme_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Getx Theme",
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                child: const Text("Change Theme"),
                onPressed: () {
                  if (Get.isDarkMode) {
                    controller.changeThemeMode(ThemeMode.light);
                  } else {
                    controller.changeThemeMode(ThemeMode.dark);
                  }
                  controller.saveTheme(!Get.isDarkMode);
                },
              ),
              ElevatedButton(
                child: const Text("Get.toNamed('/first')"),
                onPressed: () {
                  Get.toNamed('/first');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
