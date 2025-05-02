import 'package:farmitra/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class OwnerUploadDocController extends GetxController {
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
  final TextEditingController name = TextEditingController();

  var isChecked = false.obs;

  void toggleCheckBox(bool? value) {
    isChecked.value = value ?? false;
  }

  var inside = RxString('');
  var outside = RxString('');
  // Initialize ImagePicker
  final ImagePicker _picker = ImagePicker();
  var isInsideValid = true.obs;
  var isOutsideValid = true.obs;

  Future<void> pickImage(String imageType) async {
    final ImageSource? source = await Get.dialog<ImageSource>(
      AlertDialog(
        title: Text(
          'Select Image',
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

    if (source == null) return; // User dismissed the dialog

    final XFile? pickedFile = await _picker.pickImage(source: source);

    // if (imageType == 'logo') {
    //   if (pickedFile != null) {
    //     selectedLogoPath.value = pickedFile.path;
    //     isLogoValid.value = true;
    //   } else {
    //     isLogoValid.value = false;
    //   }
    // } else if (imageType == 'banner') {
    //   if (pickedFile != null) {
    //     selectedBannerPath.value = pickedFile.path;
    //     isBannerValid.value = true;
    //   } else {
    //     isBannerValid.value = false;
    //   }
    // } else
    if (imageType == 'Front Side') {
      if (pickedFile != null) {
        inside.value = pickedFile.path;
        isInsideValid.value = true;
      } else {
        isInsideValid.value = false;
      }
    } else if (imageType == 'Back Side') {
      if (pickedFile != null) {
        outside.value = pickedFile.path;
        isOutsideValid.value = true;
      } else {
        isOutsideValid.value = false;
      }
    }
  }
}
