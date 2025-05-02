import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpiDetailsController extends GetxController {
  //TODO: Implement UpiDetailsController

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

  var selectedItem = ''.obs;
  var isDropdownValid = true.obs;
  List<String> storeChannelList = [
    'Cancel Cheque',
    'Bank PassBook',
    'Bank Details',
    'Others',
  ];
  void updatedSelectedValue(String value) {
    selectedItem.value = value;
    isDropdownValid.value = true; // Reset validation when an item is selected
  }

  // TextFormField
  var customerName = TextEditingController();
  var upiId = TextEditingController();

  // checkbox
  var isChecked = false.obs;

  void toggleCheckBox(bool? value) {
    isChecked.value = value ?? false;
  }
}
