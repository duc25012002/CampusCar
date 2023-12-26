import 'package:campus_car_joco/components/VehicleInput.dart';
import 'package:campus_car_joco/utils/Reponsive.dart';
import 'package:campus_car_joco/utils/utils.dart';
import 'package:campus_car_joco/vehicle/controller/VehicleController.dart';
import 'package:campus_car_joco/vehicle/models/VehicleRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  final VehicleController _controller = Get.find<VehicleController>();
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
          onPressed: () {
            _controller.addNewVehicle(VehicleRequest(
              vehicleHoldName: _controller.nameController.text,
              categoryVehicleID: _controller.category.value == "Car" ? 0 : 1,
              platenumber: _controller.plateNumberController.text,
              model: _controller.modelController.text,
              phone: _controller.phoneController.text,
              color: _controller.colorCar.value,
            ));
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
                "Add New Vehicle",
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
                  Obx(
                    () => DropdownButton(
                      value: _controller.category.value,
                      items: _controller.listCategories
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: Reponsive.fontSize * 7,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        _controller.category.value = newValue!;
                      },
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
                  Obx(
                    () => CircleColor(
                      circleSize: 30.0,
                      color: HexColor(_controller.colorCar.value),
                      onColorChoose: (Color color) {
                        openDialog(
                          "Pick your car color",
                          MaterialColorPicker(
                            // allowShades: false,
                            selectedColor: HexColor(_controller.colorCar.value),
                            onColorChange: (color) {
                              print(color);
                              String hexColor =
                                  '#${color.value.toRadixString(16).substring(2)}';
                              _controller.colorCar.value = hexColor;
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
