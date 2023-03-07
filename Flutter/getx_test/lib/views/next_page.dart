import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controllers/home_controller.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

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
        child:
            Text("Value from home: ${Get.find<HomeController>().count.value}"),
      ),
    );
  }
}
