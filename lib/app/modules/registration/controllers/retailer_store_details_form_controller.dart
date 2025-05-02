import 'package:farmitra/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class RetailerStoreDetailsFormController {
  final TextEditingController storeName = TextEditingController();
  final TextEditingController whatsAppNumber = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController email = TextEditingController();
  var selectedItem = ''.obs;
  List<String> storeChannelList = ['Online', 'Physical', 'Both'];

  // Updated dropdown selected value
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

  var selectedLogoPath = RxString('');
  var selectedBannerPath = RxString('');

  final ImagePicker _picker = ImagePicker();

  // Validation flags for logo and banner
  var isLogoValid = true.obs;
  var isBannerValid = true.obs;
  var isDropdownValid = true.obs;

  // Method to pick an image from either gallery or camera
  Future<void> pickImage(String imageType) async {
    final ImageSource? source = await Get.dialog<ImageSource>(
      AlertDialog(
        title: Text(
          'Select Image ',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryGradinatMixColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: ImageSource.camera),
            child: Text(
              'Camera',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryGradinatMixColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Get.back(result: ImageSource.gallery),
            child: Text(
              'Gallery',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryGradinatMixColor,
              ),
            ),
          ),
        ],
      ),
    );

    if (source != null) {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        if (imageType == 'logo') {
          selectedLogoPath.value = pickedFile.path;
          isLogoValid.value = true; // Reset validation on image pick
        } else if (imageType == 'banner') {
          selectedBannerPath.value = pickedFile.path;
          isBannerValid.value = true; // Reset validation on image pick
        }
      }
    }
  }

  // Image validation method
  bool validateImages() {
    // Check if the images are selected and update validation flags
    if (selectedLogoPath.value.isEmpty) {
      isLogoValid.value = false;
    }
    if (selectedBannerPath.value.isEmpty) {
      isBannerValid.value = false;
    }
    // Return whether both images are valid
    return isLogoValid.value && isBannerValid.value;
  }

  // Method to validate the entire form
  bool validateForm() {
    // bool areImagesValid = validateImages();
    bool isDropdownValid = validateDropdown();
    return
    // areImagesValid &&
    isDropdownValid;
  }

  String? validateEmail(String? email) {
    print(email);
    if (email == null || email.isEmpty) {
      return 'Please enter email';
    }
    if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email)) {
      return 'Please enter a valid email';
    }
    if (email.length < 10) {
      return 'Email must be at least 5 characters long';
    }
    return null;
  }
}
