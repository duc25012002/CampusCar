import 'package:campus_car_joco/auth/controller/SignUpController.dart';
import 'package:get/get.dart';

import '../auth/controller/LoginController.dart';

class ManagerBindings implements Bindings {
  @override
  void dependencies() async {
    _initController();
  }

  void _initController() async {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
  }
}
