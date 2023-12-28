// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
