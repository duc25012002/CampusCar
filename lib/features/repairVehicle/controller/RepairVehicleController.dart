import 'dart:convert';

import 'package:campus_car_joco/api/ApiDefine.dart';
import 'package:campus_car_joco/api/Server.dart';
import 'package:campus_car_joco/features/checkVehicle/models/VehicleRequest.dart';
import 'package:campus_car_joco/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/CustomSnackbar.dart';

class RepairVehicleController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController plateNumberController = TextEditingController();
  TextEditingController modelController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    plateNumberController.dispose();
    modelController.dispose();
  }
}
