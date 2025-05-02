import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
  // Login
  final mobileNumber = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? validateMobileNumber(String? value) {
    // Check if the input is empty
    if (value == null || value.isEmpty) {
      return 'Enter 10 digit mobile number';
    }

    // Check if the input length is exactly 10 digits
    if (value.length != 10) {
      return 'Enter valid 10 digit mobile number';
    }

    // Check if the input contains only digits
    final numericRegex = RegExp(r'^[0-9]+$');
    if (!numericRegex.hasMatch(value)) {
      return 'Enter a valid mobile number with digits only';
    }

    // If all checks pass, return null (indicating the input is valid)
    return null;
  }
}
