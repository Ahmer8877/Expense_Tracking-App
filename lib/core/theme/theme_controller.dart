import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeController extends GetxController {

  RxBool isDark = false.obs;

  late Box settingsBox;

  @override
  void onInit() {
    super.onInit();

    settingsBox =
        Hive.box('settings');

    isDark.value =
        settingsBox.get(
          'isDark',
          defaultValue: false,
        );

    Get.changeTheme(
      isDark.value
          ? ThemeData.dark()
          : ThemeData.light(),
    );
  }

  void toggleTheme() {

    isDark.value =
    !isDark.value;

    settingsBox.put(
      'isDark',
      isDark.value,
    );

    Get.changeTheme(
      isDark.value
          ? ThemeData.dark()
          : ThemeData.light(),
    );
  }
}