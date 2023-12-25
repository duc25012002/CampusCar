import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:campus_car_joco/auth/views/LoginScreen.dart';
import 'package:campus_car_joco/auth/views/SignUpScreen.dart';
import 'package:campus_car_joco/home/screens/HomeScreen.dart';

import '../vehicle/views/addVehicleScreens.dart';

class Routes {
  static String login = '/login';
  static String signUp = '/signUp';
  static String home = "/home";
  static String addVehicle = "/addVehicle";
}

final getPages = [
  GetPage(
    name: Routes.signUp,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: Routes.home,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: Routes.addVehicle,
    page: () => const AddVehicle(),
  ),
];
