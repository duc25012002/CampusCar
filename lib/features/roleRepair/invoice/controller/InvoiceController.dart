import 'package:campus_car_joco/models/InvoiceModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../api/ApiDefine.dart';
import '../../../../api/server.dart';
import '../../../../models/AccessaryModel.dart';

class InvoiceController extends GetxController {
  RxList<Records> listAccessary = <Records>[].obs;
  RxList<Invoice> listInvoice = <Invoice>[].obs;

  Future<void> getListInvoice(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');
    Server server = Server();
    var response = await server.getRequest(
      endPoint: "${Api.getInvoiceByUserID}$userId&page=1&itemsPerPage=100",
      token: token,
    );
    if (response.statusCode == 200) {
      InvoiceModel data = invoiceModelFromJson(response.body);
      if (data.code == 1) {
        listInvoice.value = data.data!.records!;
        debugPrint(listInvoice.toString());
      } else {
        debugPrint("ERRORS: ${response.statusCode}");
      }
    } else {
      debugPrint("ERRORS: ${response.statusCode}");
    }
  }

  Future<void> getListAccessary() async {
    Server server = Server();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');
    var response = await server.getRequest(
      endPoint: Api.getListAccessary,
      token: token,
    );
    if (response.statusCode == 200) {
      Accessary data = accessaryFromJson(response.body);
      if (data.code == 1) {
        listAccessary.value = data.data!.records!;
        debugPrint(listAccessary.toString());
      } else {
        debugPrint("ERRORS: ${response.statusCode}");
      }
    } else {
      debugPrint("ERRORS: ${response.statusCode}");
    }
  }
}
