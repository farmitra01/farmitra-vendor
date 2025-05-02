import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BankDetailsFormController extends GetxController {
  //TODO: Implement BankDetailsFormController

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

  var accoutNo = TextEditingController();
  var confirmNo = TextEditingController();
  var holderName = TextEditingController();
  var bankName = TextEditingController();
  var ifsc = TextEditingController();
  var pan = TextEditingController();

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

  // checkbox
  var isChecked = false.obs;

  void toggleCheckBox(bool? value) {
    isChecked.value = value ?? false;
  }

  var selectedItem = ''.obs;
  var isDropdownValid = true.obs;
  List<String> bankDetails = [
    'Cancel Cheque',
    'Bank PassBook',
    'bank Statement',

    'Others',
  ];
  void updatedSelectedValue(String value) {
    selectedItem.value = value;
    isDropdownValid.value = true; // Reset validation when an item is selected
  }

  bool validateDropdown() {
    if (selectedItem.value.isEmpty) {
      isDropdownValid.value = false;
      return false;
    }
    return true;
  }
}
