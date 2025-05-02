import 'package:farmitra/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
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

  final List<TextEditingController> OTPcontrollers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  void onOTPChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      // Move to next field
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      // Move to previous field on backspace
      focusNodes[index - 1].requestFocus();
    }
  }

  OTPValidation() {
    Get.snackbar('Notice', 'Please enter 4 digit valid OTP',
  backgroundColor: AppColors.primaryGradinatMixColor,
  colorText: AppColors.white
    );
  }
}
