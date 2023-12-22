import 'dart:convert';

import 'package:campus_car_joco/api/api-define.dart';
import 'package:campus_car_joco/api/server.dart';
import 'package:campus_car_joco/auth/models/AuthLogin.dart';
import 'package:campus_car_joco/auth/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/custom_snackbar.dart';

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

    //Map body = {'username': authLogin.userName, 'password': authLogin.userPass};

    // String jsonBody = json.encode(body);
    var response = await server.postRequest(
        // ignore: prefer_interpolation_to_compose_strings
        endPoint: Api.login +
            "username=${authLogin.userName}" +
            '&' +
            "password=${authLogin.userPass}",
        token: token);
    print(response.statusCode);

    if (response != null && response.statusCode == 200) {
      LoginModel? loginModel;

      loginModel = loginModelFromJson(response.body);
      print(loginModel.id);
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
