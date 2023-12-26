// ignore_for_file: prefer_interpolation_to_compose_strings, file_names

import 'package:campus_car_joco/api/ApiDefine.dart';
import 'package:campus_car_joco/api/server.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/CustomSnackbar.dart';
import '../../../models/AccessLogModel.dart';

class SearchAccessLogController extends GetxController {
  TextEditingController keySearchController = TextEditingController();

  Future<AccessLogModel?> getAccessLog(String keySearch) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');
    Server server = Server(); 
    var response = await server.getRequest(
      endPoint: Api.getAccessLog + keySearch + "&page=1&itemsPerPage=100",
      token: token,
    );
    if (response.statusCode == 400) {
      customSnackbar("Alert", "You need have at least 3 words", Colors.red);
    }
    if (response.statusCode == 200) {
      AccessLogModel data = accessLogModelFromJson(response.body);
      if (data.code == 1) {
        customSnackbar("Successful",
            "Record Found ${data.data!.totalRecords} records", Colors.green);
        debugPrint(data.toString());
        return data;
      } else {
        customSnackbar("Alert", "No Record Found", Colors.red);
        return null;
      }
    }

    customSnackbar("Alert", "${response.statusCode}", Colors.red);
    return null;
  }

  @override
  void dispose() {
    keySearchController.dispose();
    super.dispose();
  }
}
