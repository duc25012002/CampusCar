import 'package:campus_car_joco/features/auth/views/LoginScreen.dart';
import 'package:campus_car_joco/features/auth/views/SignUpScreen.dart';
import 'package:campus_car_joco/features/checkVehicle/views/NewVehicleScreen.dart';
import 'package:campus_car_joco/features/checkVehicle/views/ScanVehicle.dart';
import 'package:campus_car_joco/features/repairVehicle/views/ParkingScreen.dart';
import 'package:campus_car_joco/features/search/views/SearchAccessLog.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static String login = '/login';
  static String signUp = '/signUp';
  static String home = "/home";
  static String addVehicle = "/addVehicle";
  static String searchAccessLog = "/searchAccessLog";
  static String repairVehicle = "/repairVehicle";
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
  GetPage(
    name: Routes.searchAccessLog,
    page: () => const SearchAccessLog(),
  ),
  GetPage(
    name: Routes.repairVehicle,
    page: () => const ParkingScreen(),
  ),
];
