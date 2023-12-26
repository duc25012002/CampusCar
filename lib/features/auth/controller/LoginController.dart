// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:campus_car_joco/api/ApiDefine.dart';
import 'package:campus_car_joco/api/Server.dart';
import 'package:campus_car_joco/models/AuthLogin.dart';
import 'package:campus_car_joco/models/LoginModel.dart';
import 'package:campus_car_joco/routes/routes.dart';
import 'package:campus_car_joco/widgets/CustomSnackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final controllerUserName = TextEditingController();
  final controllerUserPass = TextEditingController();
  AuthLogin? authLogin;
  Server server = Server();

  @override
  void dispose() {
    super.dispose();
    controllerUserName.dispose();
    controllerUserPass.dispose();
  }

  Future<void> login(AuthLogin authLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');

    // String jsonBody = json.encode(body);
    var response = await server.postRequest(
        endPoint: Api.login +
            "username=${authLogin.userName}" +
            '&' +
            "password=${authLogin.userPass}",
        token: token);
    // print(response.statusCode);

    if (response != null && response.statusCode == 200) {
      LoginModel? loginModel;
      loginModel = loginModelFromJson(response.body);

      print(loginModel.code);
      if (loginModel.code == 0 ||
          authLogin.userName == "" ||
          authLogin.userPass == "") {
        customSnackbar("Fail", "Login Failed", Colors.red);
      } else {
        controllerUserName.clear();
        controllerUserPass.clear();
        Map body = {
          'username': authLogin.userName,
          'password': authLogin.userPass,
          'isLogined': '1',
        };
        prefs.setString("AccountInstant", jsonEncode(body));
        customSnackbar("Successful", "Welcome Back!", Colors.green);
        Get.toNamed(Routes.home);
      }
    }
  }
}
