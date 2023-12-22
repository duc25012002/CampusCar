import 'dart:convert';

import 'package:campus_car_joco/api/api-define.dart';
import 'package:campus_car_joco/api/server.dart';
import 'package:campus_car_joco/auth/models/Auth_Login.dart';
import 'package:campus_car_joco/auth/models/login_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_snackbar.dart';

class LoginController extends GetxController {
  final controllerUserName = TextEditingController();
  final controllerUserPass = TextEditingController();
  AuthLogin? authLogin;
  Server server = Server();

  Future<void> login(AuthLogin authLogin) async {
    Map body = {'username': authLogin.userName, 'password': authLogin.userPass};

    String jsonBody = json.encode(body);
    var response =
        await server.postRequest(endPoint: Api.login, body: jsonBody);

    if (response != null && response.statusCode == 200) {
      LoginModel? loginModel;

      loginModel = loginModelFromJson(response.body);
      if (loginModel.code == -1) {
        customSnackbar("Fail", "Login unsuccessful", Colors.red);
      } else {
        controllerUserName.clear();
        controllerUserPass.clear();
        customSnackbar("Successful", "Welcome Back!", Colors.green);
      }
    }
  }
}
