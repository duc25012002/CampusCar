import 'dart:convert';

import 'package:campus_car_joco/api/ApiDefine.dart';
import 'package:campus_car_joco/api/Server.dart';
import 'package:campus_car_joco/models/UserModel.dart';
import 'package:campus_car_joco/routes/routes.dart';
import 'package:campus_car_joco/widgets/CustomSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddUserRepairController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController userName = TextEditingController();
  int? userIdCreated;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    phoneController.dispose();
    address.dispose();
    userName.dispose();
  }

  Future<void> postUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');
    prefs.setString("phone", phoneController.text);
    Server server = Server();
    UserInfo userInfo = UserInfo(
        userId: 0,
        userEmail: emailController.text,
        userPhone: phoneController.text,
        workingLocation: address.text,
        roleID: 3,
        merchantId: 17,
        userName: userName.text,
        gender: 0,
        status: 1,
        birthDate: "2023-12-28T17:28:06.695Z",
        serviceType: 2,
        password: "12345");

    String body = userInfoToJson(userInfo);
    var response = await server.postRequest(
      endPoint: Api.postUser,
      body: body,
      token: token,
    );
    Map<dynamic, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());
    if (response.statusCode == 200) {
      if (data['code'] == 1) {
        customSnackbar(
            "Successful", "Create User Info Successful", Colors.green);
        userIdCreated = data['data'];
        Get.toNamed(Routes.invoice);
      } else {
        customSnackbar("Fail", "Cannot Create", Colors.red);
      }
    } else {
      debugPrint("ERRORS: ${response.statusCode}");
    }
  }
}
