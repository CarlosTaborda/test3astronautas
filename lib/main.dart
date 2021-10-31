import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test3astronautas/src/views/home_view.dart';
import 'package:test3astronautas/src/views/theme.dart';
import 'package:test3astronautas/src/controllers/home_controller.dart';

void main() {
  Get.lazyPut(()=>HomeController());
  runApp(GetMaterialApp(
    theme: appTheme,
    home: const HomeView(),
  ));
}
