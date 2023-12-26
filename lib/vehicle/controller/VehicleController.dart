import 'dart:convert';

import 'package:campus_car_joco/api/ApiDefine.dart';
import 'package:campus_car_joco/api/server.dart';
import 'package:campus_car_joco/routes/routes.dart';
import 'package:campus_car_joco/vehicle/models/VehicleRequest.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/CustomSnackbar.dart';

class VehicleController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController plateNumberController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  RxString category = "Car".obs;
  List<String> listCategories = ["Car", "Motobike"];
  RxString colorCar = "#0082c8".obs;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    plateNumberController.dispose();
    modelController.dispose();
    category.value = "Car";
    colorCar.value = "#0082c8";
  }

  Future<void> addNewVehicle(VehicleRequest vehicleRequest) async {
    Server server = Server();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');
    var response = await server.postRequest(
      endPoint: Api.addNewVehicle,
      body: vehicleRequestToJson(vehicleRequest),
      token: token,
    );
    if (response.statusCode == 200) {
      Map<dynamic, dynamic> body = jsonDecode(response.body);
      if (body["code"] == 1) {
        // dispose();
        customSnackbar("Successful", "New Vehicle is added", Colors.green);
        Get.toNamed(Routes.home);
      } else {
        customSnackbar("Fail", "New Vehicle was not added", Colors.red);
      }
    } else {
      customSnackbar("Fail", "New Vehicle was not added", Colors.red);
    }
  }
}

void openDialog(String title, Widget content) {
  Get.defaultDialog(
    contentPadding: const EdgeInsets.all(6.0),
    title: (title),
    onConfirm: () {
      Get.back();
    },
    onCancel: () {},
    content: content,
  );
}
