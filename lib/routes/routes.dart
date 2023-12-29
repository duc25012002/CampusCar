import 'package:campus_car_joco/features/auth/views/LoginScreen.dart';
import 'package:campus_car_joco/features/auth/views/SignUpScreen.dart';
import 'package:campus_car_joco/features/checkVehicle/views/ScanVehicle.dart';
import 'package:campus_car_joco/features/roleParking/addNewVehicle/views/ParkingScreen.dart';
import 'package:campus_car_joco/features/roleParking/searchInOut/views/SearchAccessLog.dart';
import 'package:campus_car_joco/features/roleRepair/history/views/HistoryRepairScreen.dart';
import 'package:campus_car_joco/features/roleRepair/invoice/views/InvoiceScreen.dart';
import 'package:campus_car_joco/features/roleRepair/searchVehicle/views/SearchVehicleRepairScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static String login = '/login';
  static String signUp = '/signUp';
  static String home = "/home";
  static String parking = "/parking";
  static String searchAccessLog = "/searchAccessLog";
  static String repairVehicle = "/repairVehicle";
  static String invoice = "/invoice";
  static String searchVehicleRepair = "/searchVehicleRepair";
  static String repairHistory = "/repairHistory";
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
    name: Routes.parking,
    page: () => const ParkingScreen(),
  ),
  GetPage(
    name: Routes.searchAccessLog,
    page: () => const SearchAccessLog(),
  ),
  GetPage(
    name: Routes.repairVehicle,
    page: () => const ParkingScreen(),
  ),
  GetPage(
    name: Routes.invoice,
    page: () => const InvoiceScreen(),
  ),
  GetPage(
    name: Routes.searchVehicleRepair,
    page: () => const SearchVehicleRepairScreen(),
  ),
  GetPage(
    name: Routes.repairHistory,
    page: () => const HistoryRepairScreen(),
  )
];
