import 'dart:convert';

import 'package:campus_car_joco/features/roleRepair/searchVehicle/controller/SearchVehicleRepairController.dart';
import 'package:campus_car_joco/models/InvoiceDetail.dart';
import 'package:campus_car_joco/models/InvoiceModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../api/ApiDefine.dart';
import '../../../../api/server.dart';
import '../../../../models/AccessaryModel.dart';
import '../../../../widgets/CustomSnackbar.dart';

class InvoiceController extends GetxController {
  RxList<Records> listAccessary = <Records>[].obs;
  RxList<Invoice> listInvoice = <Invoice>[].obs;
  final SearchVehicleRepairController _controller =
      Get.find<SearchVehicleRepairController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController plateNumberController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  RxString category = "Car".obs;
  List<String> listCategories = ["Car", "Motobike"];
  RxString colorCar = "#0082c8".obs;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    plateNumberController.dispose();
    modelController.dispose();
    category.value = "Car";
    colorCar.value = "#0082c8";
  }

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

  Future<void> postInvoice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phone = prefs.getString("phone");
    bool status = await _controller.getUserByPhone(phone!);
    String? token = prefs.getString('tokenApi');
    Server server = Server();

    Invoice invoice = Invoice(
        userId: _controller.userModel!.data!.userId,
        categoryVehicleID: 2,
        kilometer: nameController.text,
        createDate: DateTime.now().toString(),
        typeRepaidId: 1,
        descriptions: phoneController.text,
        accessoriesCost: 138000,
        repairCost: 50000,
        totalAmount: double.parse(modelController.text),
        employeeId: 2,
        billStatus: 1,
        notes: plateNumberController.text);
    String body = invoiceToJson(invoice);

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

  Future<void> postInvoiceDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenApi');
    Server server = Server();
    // InvoiceDetail invoiceDetail
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
        customSnackbar("Successful", "Create invoice successful", Colors.green);
      } else {
        customSnackbar("Fail", "Cannot Create", Colors.red);
      }
    } else {
      debugPrint("ERRORS: ${response.statusCode}");
    }
  }
}
