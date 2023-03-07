import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs; // reactive state management value
  int normalCount = 0; // simple state management value

  void increment() {
    count.value++;
  }

  void incrementNormal() {
    // need to call update to change the normal value
    normalCount++;
    // update();
    // update with given unique id with simple state management
    update(['count1'], normalCount < 10);
  }

  // method is called immediately after widget is allocated memory
  @override
  void onInit() {
    super.onInit();
    debugPrint("onInit() is called");
    // called every time when the value is changed
    ever(count, (_) => debugPrint("$_ is changed"),
        condition: count.value < 10);

    // called every time when the list of values are changed
    everAll(
      [count],
      (_) => debugPrint("$_ are changed"),
    );

    // only called once when the value is changed
    once(
      count,
      (_) => debugPrint("$_ is changed once"),
    );

    // called when the user is stopped typing with the duration
    debounce(
      count,
      (_) => debugPrint("$_ is changed with debounce 1000"),
      time: const Duration(milliseconds: 1000),
    );

    // called with interval of the next value
    interval(
      count,
      (_) => debugPrint("$_ is changed with interval 1000"),
      time: const Duration(milliseconds: 1000),
    );
  }

  @override
  void onReady() {
    // called after widget is rendered on the screen
    super.onReady();
    debugPrint("onReady() is called");
  }

  @override
  void onClose() {
    super.onClose();
    // called just before the controller is deleted from memory
    debugPrint("onClose() is called");
  }
}
