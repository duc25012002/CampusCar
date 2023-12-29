import 'package:campus_car_joco/components/VehicleInput.dart';
import 'package:campus_car_joco/features/roleRepair/invoice/controller/InvoiceController.dart';
import 'package:campus_car_joco/utils/Colors.dart';
import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final InvoiceController _controller = Get.find<InvoiceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: Reponsive.width / 2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConst.primaryColor,
          ),
          onPressed: () {
            _controller.postInvoice();
          },
          child: Text("Add",
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: Reponsive.fontSize * 7,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Add New Invoice",
                style: GoogleFonts.inter(
                  fontSize: Reponsive.fontSize * 10,
                  fontWeight: FontWeight.w700,
                  color: ColorConst.primaryColor,
                ),
              ),
            ),
            SizedBox(height: Reponsive.height * 0.03),
            VehicleInput(
              controller: _controller.nameController,
              label: "Km",
            ),
            SizedBox(height: Reponsive.height * 0.02),
            VehicleInput(
              controller: _controller.phoneController,
              label: "Description",
            ),
            SizedBox(height: Reponsive.height * 0.02),
            VehicleInput(
              controller: _controller.plateNumberController,
              label: "Notes",
            ),
            SizedBox(height: Reponsive.height * 0.02),
            VehicleInput(
              controller: _controller.modelController,
              label: "Amount",
            ),
          ],
        ),
      ),
    );
  }
}
