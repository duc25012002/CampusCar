// ignore_for_file: prefer_interpolation_to_compose_strings, file_names

import 'dart:io';

import 'package:campus_car_joco/api/ApiDefine.dart';
import 'package:campus_car_joco/api/server.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '../../../widgets/CustomSnackbar.dart';
import '../../../models/AccessLogModel.dart';

class SearchAccessLogController extends GetxController {
  TextEditingController keySearchController = TextEditingController();
  RxList<Records> recordsData = <Records>[].obs;

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

        recordsData.value = data.data!.records!.obs;

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

  Future<void> exportExcel() async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByIndex(1, 1).setText("ID");
    sheet.getRangeByIndex(1, 2).setText("Plate Number");
    sheet.getRangeByIndex(1, 3).setText("Status");
    sheet.getRangeByIndex(1, 4).setText("Create Date");

    for (var i = 0; i < recordsData.length; i++) {
      sheet.getRangeByIndex(i + 2, 1).setText("${recordsData[i].vehicleID}");
      sheet.getRangeByIndex(i + 2, 2).setText("${recordsData[i].platenumber}");
      sheet.getRangeByIndex(i + 2, 3).setText("${recordsData[i].status}");
      sheet.getRangeByIndex(i + 2, 4).setText("${recordsData[i].createDate}");
    }

    final List<int> bytes = workbook.saveAsStream();
    final Directory? downloadsDir = await getDownloadsDirectory();

    if (downloadsDir != null) {
      if (!await downloadsDir.exists()) {
        await downloadsDir.create(recursive: true);
      }

      final String filePath =
          '${downloadsDir.path}/record_${DateTime.now().millisecondsSinceEpoch}.xlsx';

      await File(filePath).writeAsBytes(bytes);
      OpenFile.open(filePath);
    }
    workbook.dispose();
  }

  @override
  void dispose() {
    keySearchController.dispose();
    super.dispose();
  }
}
