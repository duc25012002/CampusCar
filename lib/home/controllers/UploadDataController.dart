// ignore_for_file: file_names

import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class UploadDataController extends GetxController {
  File? image;
  ImagePicker picker = ImagePicker();

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

  Future<void> textRecognition(String choose) async {
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
      print(text);
    } else {
      Fluttertoast.showToast(msg: "Please select");
    }
  }
}
