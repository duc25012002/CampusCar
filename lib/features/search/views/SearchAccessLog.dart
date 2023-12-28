// ignore: file_names
import 'package:campus_car_joco/components/NavDrawer.dart';
import 'package:campus_car_joco/features/search/controller/SearchAccessLogController.dart';
import 'package:campus_car_joco/utils/Colors.dart';
import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAccessLog extends StatefulWidget {
  const SearchAccessLog({super.key});

  @override
  State<SearchAccessLog> createState() => _SearchAccessLogState();
}

class _SearchAccessLogState extends State<SearchAccessLog> {
  final SearchAccessLogController _controller =
      Get.find<SearchAccessLogController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: Reponsive.width * 0.9,
                  child: TextFormField(
                    controller: _controller.keySearchController,
                    onFieldSubmitted: (value) {
                      _controller
                          .getAccessLog(_controller.keySearchController.text);
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color(0xffc0c0c0),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                    ),
                  ),
                ),
                SizedBox(height: Reponsive.height * 0.05),
                SizedBox(
                  width: Reponsive.width * 0.9,
                  height: Reponsive.height * 0.6,
                  child: Obx(
                    () => DataTable2(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: 600,
                      columns: const [
                        DataColumn2(
                          label: Text('ID'),
                          size: ColumnSize.S,
                        ),
                        DataColumn2(
                          label: Text('Plate Number'),
                          size: ColumnSize.S,
                        ),
                        DataColumn2(
                          label: Text('Status'),
                          size: ColumnSize.S,
                        ),
                        DataColumn2(
                          label: Text('Create Date'),
                          size: ColumnSize.S,
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        _controller.recordsData.length,
                        (index) => DataRow(cells: [
                          DataCell(Text(
                              "${_controller.recordsData[index].vehicleID}")),
                          DataCell(Text(
                              "${_controller.recordsData[index].platenumber}")),
                          DataCell(
                              Text("${_controller.recordsData[index].status}")),
                          DataCell(Text(
                            _controller.recordsData[index].createDate!
                                .substring(0, 10),
                          )),
                        ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Reponsive.height * 0.01),
                ElevatedButton(
                  onPressed: () {
                    _controller.exportExcel();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConst.primaryColor,
                  ),
                  child: const Text(
                    "Export Excel",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
