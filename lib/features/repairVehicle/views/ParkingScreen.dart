import 'package:campus_car_joco/components/VehicleInput.dart';
import 'package:campus_car_joco/features/repairVehicle/controller/RepairVehicleController.dart';
import 'package:campus_car_joco/utils/Colors.dart';
import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ParkingScreen extends StatefulWidget {
  const ParkingScreen({super.key});

  @override
  State<ParkingScreen> createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  final RepairVehicleController _controller =
      Get.find<RepairVehicleController>();
  @override
  void initState() {
    String plateNumber = Get.arguments ?? '';
    _controller.plateNumberController.text = plateNumber;
    super.initState();
  }

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
          onPressed: () {},
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
                "Invoice Details",
                style: GoogleFonts.inter(
                  fontSize: Reponsive.fontSize * 10,
                  fontWeight: FontWeight.w700,
                  color: ColorConst.primaryColor,
                ),
              ),
            ),
            SizedBox(height: Reponsive.height * 0.03),
            VehicleInput(
              isReadOnly: true,
              text: "Your Name",
              controller: _controller.nameController,
              label: "Name",
            ),
            SizedBox(height: Reponsive.height * 0.02),
            VehicleInput(
              controller: _controller.phoneController,
              label: "Mobile no.",
            ),
            SizedBox(height: Reponsive.height * 0.02),
            VehicleInput(
              controller: _controller.plateNumberController,
              label: "License plate no.",
            ),
            SizedBox(height: Reponsive.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: Reponsive.fontSize * 7,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Reponsive.height * 0.02),
            VehicleInput(
              controller: _controller.modelController,
              label: "Model",
            ),
            SizedBox(height: Reponsive.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Color",
                    style: TextStyle(
                      fontSize: Reponsive.fontSize * 7,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
