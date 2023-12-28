import 'package:campus_car_joco/features/auth/controller/LoginController.dart';
import 'package:campus_car_joco/features/auth/controller/SignUpController.dart';
import 'package:campus_car_joco/features/roleParking/addNewVehicle/controller/VehicleController.dart';
import 'package:campus_car_joco/features/roleRepair/repairVehicle/controller/RepairVehicleController.dart';
import 'package:campus_car_joco/features/roleParking/searchInOut/controller/SearchAccessLogController.dart';
import 'package:campus_car_joco/features/roleRepair/searchVehicle/controller/SearchVehicleRepairController.dart';
import 'package:get/get.dart';
import '../features/checkVehicle/controller/UploadDataController.dart';
import '../features/roleRepair/invoice/controller/InvoiceController.dart';

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
    Get.lazyPut(() => RepairVehicleController(), fenix: true);
    Get.lazyPut(() => SearchVehicleController(), fenix: true);
    Get.lazyPut(() => InvoiceController(), fenix: true);
  }
}
