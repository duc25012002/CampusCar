import 'package:campus_car_joco/auth/controller/SignUpController.dart';
import 'package:campus_car_joco/search/controller/SearchAccessLogController.dart';
import 'package:campus_car_joco/vehicle/controller/VehicleController.dart';
import 'package:get/get.dart';

import '../auth/controller/LoginController.dart';
import '../home/controllers/UploadDataController.dart';

class ManagerBindings implements Bindings {
  @override
  void dependencies() async {
    _initController();
  }

  void _initController() async {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => VehicleController(), fenix: true);
    Get.lazyPut(() => UploadDataController(), fenix: true);
    Get.lazyPut(() => SearchAccessLogController(), fenix: true);
  }
}
