import 'package:campus_car_joco/api/Server.dart';
import 'package:campus_car_joco/di/ManagerBindings.dart';
import 'package:campus_car_joco/routes/routes.dart';
import 'package:campus_car_joco/services/awesome_notification.dart';
import 'package:campus_car_joco/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Server.getTokenApi();
  ManagerBindings().dependencies();
  AwesomeNotificationsService.init();

  runApp(
    GetMaterialApp(
      title: 'Campus Car',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(primaryColor: ColorConst.primaryColor),
      initialRoute: Routes.searchAccessLog,
      getPages: getPages,
    ),
  );
}
