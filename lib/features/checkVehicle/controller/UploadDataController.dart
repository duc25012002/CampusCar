// ignore_for_file: file_names

import 'dart:io';
import 'package:campus_car_joco/features/roleRepair/searchVehicle/controller/SearchVehicleRepairController.dart';
import 'package:campus_car_joco/routes/routes.dart';

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
        // Xử lý role chỗ này
        // Sau khi quét biển chuyển data về màn tìm kiếm biển số xe. ( Màn search biển số xe )
        //. Nếu có tồn tại biển số xe thì sẽ có thông tin SĐT
        // Từ số điện thoại sẽ kiểm tra xem user tồn tại hay không (API getUserByPhone)
        // nếu tồn tại thì chuyển sang màn xem lịch sử hoá đơn (Màn xem lịch sử hoá đơn)
        // nếu không tồn tại thì chuyển sang màn thêm thông tin user (Màn thêm thông tin user)
        // sau đó sang màn tạo hoá đơn. (Màn tạo hoá đơn. Trong đó có màn thêm các chi tiết phụ tùng)
        //. Nếu không tồn tại biển số xe thì chuyển sang màn thêm biển số xe
        // Sau đó kiểm tra xem số điện thoại vừa nhập có trong trường user không
        // Nếu có thì chuyển sang màn tạo hoá đơn
        // Nếu không có thì chuyển sang màn thêm thông tin user
        bool checkVehicle = await _controller.checkVehicle(plateNumber);

        if (checkVehicle) {
          if (await _controller.getUserByPhone(_controller.phone ?? "")) {}
        }
      } else {
        Get.toNamed(Routes.parking, arguments: plateNumber);
      }
    } else {
      Fluttertoast.showToast(msg: "Please select");
    }
  }
}
