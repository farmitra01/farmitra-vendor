import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class KycUploadDocumentControllerController extends GetxController {
  //TODO: Implement KycUploadDocumentControllerController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  final TextEditingController documentIdNo = TextEditingController();

  var selectedImage = Rx<File?>(
    null,
  ); // Reactive variable to track selected image

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path); // Update reactive variable
    }
  }

  var isChecked = false.obs;

  void toggleCheckBox(bool? value) {
    isChecked.value = value ?? false;
  }
}
