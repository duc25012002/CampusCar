import 'dart:convert';

import 'package:campus_car_joco/features/invoice/models/InvoiceDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/ApiDefine.dart';
import '../../../api/server.dart';
import '../../../widgets/CustomSnackbar.dart';
import '../models/AccessaryModel.dart';
import '../models/InvoiceModel.dart';

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

// Tạo hoá đơn. truyền vào 1 thằng kiểu Invoice. không cần truyền billID
  Future<void> postInvoice(Invoice invoice) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');
    Server server = Server();
    Invoice invoice2 = Invoice(
        userId: 2003,
        categoryVehicleID: 2,
        kilometer: "1000km",
        createDate: DateTime.now().toString(),
        typeRepaidId: 1,
        descriptions: "Sua xe",
        accessoriesCost: 138000,
        repairCost: 50000,
        totalAmount: 188000,
        employeeId: 2,
        billStatus: 1,
        notes: "Thay guong");
    String body = invoiceToJson(invoice2);

    var response = await server.postRequest(
      endPoint: Api.postInvoice,
      body: body,
      token: token,
    );
    if (response.statusCode == 200) {
      Map<dynamic, dynamic> data = jsonDecode(response.body);
      if (data['code'] == 1) {
        customSnackbar("Successful", "Create invoice successful", Colors.green);
      } else {
        customSnackbar("Fail", "Cannot Create", Colors.red);
      }
    } else {
      debugPrint("ERRORS: ${response.statusCode}");
    }
  }

  Future<void> postInvoiceDetail(InvoiceDetail invoiceDetail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');
    Server server = Server();
    InvoiceDetail invoiceDetail2 = InvoiceDetail(
        maHoaDon: 17,
        maSoHoaDon: "17",
        sTT: 2,
        maPhuTung: 145,
        maSoPhuTung: "1135A-H3F-0001",
        chiTietSua: "Bộ vỏ nắp máy trái",
        soLuong: 1,
        donGia: 20000,
        phanTramGiam: 0,
        thanhTien: 20000,
        ghiChu: "");
    String body = invoiceDetailToJson(invoiceDetail2);

    var response = await server.postRequest(
      endPoint: Api.postInvoiceDetail,
      body: body,
      token: token,
    );
    if (response.statusCode == 200) {
      Map<dynamic, dynamic> data = jsonDecode(response.body);
      if (data['code'] == 1) {
        debugPrint("Create invoice detail successful");
        // customSnackbar(
        //     "Successful", "Create invoice detail successful", Colors.green);
      } else {
        // customSnackbar("Fail", "Cannot Create", Colors.red);
        debugPrint("Cannot create");
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
