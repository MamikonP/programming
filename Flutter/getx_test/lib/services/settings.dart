import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends GetxService {
  late SharedPreferences _preferences;
  final counter = 0.obs;

  Future<SettingsService> init() async {
    debugPrint("$runtimeType initialize shared preference");
    _preferences = await SharedPreferences.getInstance();
    debugPrint("$runtimeType shared preference ready");
    counter.value = _preferences.getInt('counter') ?? 0;
    return this;
  }

  Future<void> incrementCounter() async {
    _preferences.setInt('counter', counter.value + 1);
    counter.value = _preferences.getInt('counter')!;
  }
}
