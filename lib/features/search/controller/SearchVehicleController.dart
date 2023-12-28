// ignore_for_file: prefer_interpolation_to_compose_strings, file_names

import 'dart:convert';

import 'package:campus_car_joco/api/ApiDefine.dart';
import 'package:campus_car_joco/api/server.dart';
import 'package:campus_car_joco/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/CustomSnackbar.dart';

class SearchVehicleController extends GetxController {
  TextEditingController keySearchController = TextEditingController();
  String? phone;
  UserModel? userModel;
  // hàm lấy thông tin user từ số điện thoại. Nếu có thì trả về data userModel phía trên
  Future<bool> getUserByPhone(String phoneNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');
    Server server = Server();
    var response = await server.getRequest(
      endPoint: Api.getUserByPhone + phoneNumber,
      token: token,
    );
    if (response.statusCode == 200) {
      userModel = userModelFromJson(response.body);
      if (userModel!.code == 1) {
        customSnackbar("Successful",
            "Welcome back! ${userModel!.data!.userName}", Colors.green);
        return true;
      } else {
        customSnackbar("Alert", "Not Found Your User Info", Colors.red);
        return false;
      }
    }
    customSnackbar("Alert", "Server errors", Colors.red);
    return false;
  }

  //Hàm kiểm tra xem số điện thoại này có trong thông tin user chưa
  Future<bool> checkPhone(String keySearch) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');
    Server server = Server();
    var response = await server.postRequest(
      endPoint: Api.searchPhone + keySearch,
      token: token,
    );
    if (response.statusCode == 400) {
      customSnackbar("Alert", "You need have at least 3 words", Colors.red);
    }
    if (response.statusCode == 200) {
      Map<dynamic, dynamic> data = jsonDecode(response.body);
      if (data['code'] == 1) {
        await getUserByPhone(keySearch);
        return true;
      } else {
        customSnackbar("Alert", "You need sign up to continue", Colors.red);
        return false;
      }
    }
    customSnackbar("Alert", "${response.statusCode}", Colors.red);
    return false;
  }

  //Hàm kiểm tra biển số xe xem đã có trong CSDL hay chưa
  Future<bool> checkVehicle(String keySearch) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');
    Server server = Server();
    var response = await server.getRequest(
      endPoint: Api.searchVehicle + keySearch + "&page=1&itemsPerPage=100",
      token: token,
    );
    if (response.statusCode == 400) {
      customSnackbar("Alert", "You need have at least 3 words", Colors.red);
    }
    if (response.statusCode == 200) {
      //    AccessLogModel data = accessLogModelFromJson(response.body);
      Map<dynamic, dynamic> data = jsonDecode(response.body);
      if (data['code'] == 1) {
        phone = data['data']['records'][0]['Phone'];

        debugPrint("Số điện thoại của biển số vừa quét: +$phone");
        return true;
      } else {
        customSnackbar("Alert", "Not found your history repair", Colors.red);
        return false;
      }
    }
    customSnackbar("Alert", "${response.statusCode}", Colors.red);
    return false;
  }

  @override
  void dispose() {
    keySearchController.dispose();
    super.dispose();
  }
}
