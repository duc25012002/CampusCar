import 'package:campus_car_joco/auth/views/login_screen.dart';
import 'package:campus_car_joco/di/manager_binding.dart';
import 'package:campus_car_joco/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Campus Car',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
