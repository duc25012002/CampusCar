import 'package:campus_car_joco/auth/views/login_screen.dart';
import 'package:campus_car_joco/di/manager_binding.dart';
import 'package:campus_car_joco/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // WidgetsFlutterBinding.ensureInitialized();
  ManagerBindings().dependencies();
  runApp(GetMaterialApp(
    title: 'Campus Car',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light().copyWith(primaryColor: ColorConst.primaryColor),
    home: const LoginScreen(),
  ));
}
