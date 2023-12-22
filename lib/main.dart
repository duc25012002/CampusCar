import 'package:campus_car_joco/di/ManagerBindings.dart';
import 'package:campus_car_joco/routes/Routes.dart';
import 'package:campus_car_joco/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  ManagerBindings().dependencies();
  runApp(
    GetMaterialApp(
      title: 'Campus Car',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(primaryColor: ColorConst.primaryColor),
      initialRoute: Routes.home,
      getPages: getPages,
    ),
  );
}
