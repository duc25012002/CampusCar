// ignore_for_file: file_names, non_constant_identifier_names

import 'package:campus_car_joco/models/InvoiceModel.dart';
import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:campus_car_joco/features/roleRepair/invoice/controller/InvoiceController.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryRepairScreen extends StatefulWidget {
  const HistoryRepairScreen({super.key});

  @override
  State<HistoryRepairScreen> createState() => _HistoryRepairScreenState();
}

class _HistoryRepairScreenState extends State<HistoryRepairScreen> {
  final InvoiceController controller = Get.find<InvoiceController>();
  Invoice? invoice;

  @override
  void initState() {
    callApi();
    super.initState();
  }

  void callApi() async {
    String args = Get.arguments.toString();
    await controller.getListInvoice(args);
    print(args);
  }

  // 20F1-15932
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.listInvoice.length,
            itemBuilder: (context, index) {
              if (controller.listInvoice.isNotEmpty) {
                invoice = controller.listInvoice[index];
                print(invoice);
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Container(
                  width: Reponsive.width - 30,
                  height: Reponsive.height * 0.2,
                  decoration: const BoxDecoration(),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Tag("Bill id: ", "${invoice!.billId}", 6),
                              Tag("Create date: ",
                                  invoice!.createDate!.substring(0, 10), 5),
                            ],
                          ),
                          const Divider(),
                          Tag("User id: ", "${invoice!.userId}", 6),
                          Tag("User id: ", "${invoice!.descriptions}", 6),
                          Tag("Employee: ", "${invoice!.employeeId}", 6),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Tag("", "", 6),
                              Tag("Total amount: ",
                                  invoice!.totalAmount.toString(), 5),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  RichText Tag(String label, String data, int size) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: label,
          style: GoogleFonts.inter(
              fontSize: Reponsive.fontSize * size, color: Colors.black),
        ),
        TextSpan(
          text: data,
          style: GoogleFonts.inter(
              fontSize: Reponsive.fontSize * size, color: Colors.black),
        ),
      ]),
    );
  }
}
