// ignore_for_file: prefer_interpolation_to_compose_strings, file_names

import 'dart:convert';

import 'package:campus_car_joco/api/ApiDefine.dart';
import 'package:campus_car_joco/api/server.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/CustomSnackbar.dart';

class SearchVehicleController extends GetxController {
  TextEditingController keySearchController = TextEditingController();
  String? phone;
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
        customSnackbar("Successful", "Record Found", Colors.green);
        debugPrint(data.toString());
        return true;
      } else {
        customSnackbar("Alert", "No Record Found", Colors.red);
        return false;
      }
    }
    customSnackbar("Alert", "${response.statusCode}", Colors.red);
    return false;
  }

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
        customSnackbar("Successful", "Record Found", Colors.green);
        debugPrint(phone);
        return true;
      } else {
        customSnackbar("Alert", "No Record Found", Colors.red);
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
