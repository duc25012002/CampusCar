// ignore_for_file: file_names

import 'dart:io';
import 'package:campus_car_joco/features/search/controller/SearchVehicleController.dart';
import 'package:campus_car_joco/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class UploadDataController extends GetxController {
  File? image;
  ImagePicker picker = ImagePicker();
  final SearchVehicleController _controller =
      Get.find<SearchVehicleController>();
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    return image;
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }

  Future<void> textRecognition(String choose, String args) async {
    if (choose == "camera") {
      await getImageFromCamera();
    } else {
      await getImageFromGallery();
    }
    if (image != null) {
      final textRecognizer = TextRecognizer();

      final RecognizedText recognizedText =
          await textRecognizer.processImage(InputImage.fromFile(image!));
      String text = recognizedText.text;
      String plateNumber = text.replaceAll(RegExp(r'\s+'), '');
      if (args == "repair") {
        //bool checkVehicle = await _controller.checkVehicle(plateNumber);
        bool checkPhone = await _controller.checkPhone("0898283961");
        if (checkPhone) debugPrint("OKE");
        // if (checkVehicle)
        //   Get.toNamed(Routes.repairVehicle, arguments: plateNumber);
      } else {
        Get.toNamed(Routes.addVehicle, arguments: plateNumber);
      }
    } else {
      Fluttertoast.showToast(msg: "Please select");
    }
  }
}
