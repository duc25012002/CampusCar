import 'package:campus_car_joco/auth/views/login_screen.dart';
import 'package:campus_car_joco/auth/views/sign_up_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static String login = '/login';
  static String signUp = '/signUp';
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
];
