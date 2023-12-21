import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final controllerUserName = TextEditingController();
  final controllerUserPass = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controllerUserName.dispose();
    controllerUserPass.dispose();
  }
}
