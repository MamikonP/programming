import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_test/controllers/translation_controller.dart';
import 'package:getx_test/views/next_page.dart';

import '../controllers/home_controller.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();
  final translationController = Get.find<TranslationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Reactive State Management
            // GetX<HomeController>(
            //   init: HomeController(),
            //   builder: (_) => Text("${controller.count.value}"),
            // ),
            Text('hello'.tr),
            Text('user'.trParams({'name': "Mamikon", 'surname': 'Papikyan'})),
            Obx(
              () => Text(
                "${controller.count.value}",
                style: const TextStyle(color: Colors.red),
              ),
            ),
            // Simple State Management
            GetBuilder<HomeController>(
              id: 'count1',
              builder: (_) => Text(
                "${controller.normalCount}",
                style: const TextStyle(color: Colors.green),
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => const NextPage()),
              child: const Text("Get.to(NextPage())"),
            ),
            ElevatedButton(
              onPressed: () => translationController.changeLanguage("hy", "AM"),
              child: const Text('հայերեն'),
            ),
            ElevatedButton(
              onPressed: () => translationController.changeLanguage("en", "US"),
              child: const Text('english'),
            ),
            ElevatedButton(
              onPressed: () => translationController.changeLanguage("ru", "RU"),
              child: const Text('русский'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            child: const Icon(
              Icons.plus_one,
              color: Colors.red,
            ),
            onPressed: () {
              controller.increment();
            },
          ),
          const SizedBox(
            width: 5.0,
          ),
          ElevatedButton(
            child: const Icon(
              Icons.plus_one,
              color: Colors.green,
            ),
            onPressed: () {
              controller.incrementNormal();
            },
          ),
        ],
      ),
    );
  }
}
