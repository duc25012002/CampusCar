// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final controllerUserName = TextEditingController();
  final controllerUserPass = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controllerUserName.dispose();
    controllerUserPass.dispose();
  }
}
