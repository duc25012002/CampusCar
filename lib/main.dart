import 'package:campus_car_joco/di/manager_binding.dart';
import 'package:campus_car_joco/routes/routes.dart';
import 'package:campus_car_joco/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  ManagerBindings().dependencies();
  runApp(GetMaterialApp(
    title: 'Campus Car',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light().copyWith(primaryColor: ColorConst.primaryColor),
    initialRoute: Routes.login,
    getPages: getPages,
  ));
}
