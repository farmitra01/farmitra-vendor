import 'package:farmitra/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class StoresTabProfileController extends GetxController {
  //TODO: Implement ProfileController

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
  final TextEditingController storeName = TextEditingController();
  final TextEditingController whatsAppNo = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController completeAddress = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController pinCode = TextEditingController();
  final TextEditingController webSiteLInk = TextEditingController();
  final TextEditingController redius = TextEditingController();
  final TextEditingController minOrderValue = TextEditingController();
  final TextEditingController giftWrapAmmount = TextEditingController();
  final TextEditingController startTime = TextEditingController();
  final TextEditingController endTime = TextEditingController();

  RxBool isAddtionalCharges = false.obs;

  final List<String> bannerImage = [
    'assets/svgs/storeProfile/storeBg1.svg',
    'assets/svgs/storeProfile/storeBg2.svg',
  ];

  final List<String> gridImage = [
    'assets/images/storeProfile/bannerImage-1.jpg',
    'assets/images/storeProfile/bannerImage-2.jpg',
    'assets/images/storeProfile/bannerImage-3.jpg',
    'assets/images/storeProfile/bannerImage-4.jpg',
    'assets/images/storeProfile/bannerImage-5.jpg'
  ];
  // Reactive variables for storing image paths
  var selectedLogoPath = RxString('');
  var selectedBannerPath = RxString('');
  var inside = RxString('');
  var outside = RxString('');
  // Initialize ImagePicker
  final ImagePicker _picker = ImagePicker();

  // Validation flags for logo and banner
  var isLogoValid = true.obs;
  var isBannerValid = true.obs;
  var isInsideValid = true.obs;
  var isOutsideValid = true.obs;

  // Function to pick an image
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

    if (imageType == 'logo') {
      if (pickedFile != null) {
        selectedLogoPath.value = pickedFile.path;
        isLogoValid.value = true;
      } else {
        isLogoValid.value = false;
      }
    } else if (imageType == 'banner') {
      if (pickedFile != null) {
        selectedBannerPath.value = pickedFile.path;
        isBannerValid.value = true;
      } else {
        isBannerValid.value = false;
      }
    } else if (imageType == 'inside') {
      if (pickedFile != null) {
        inside.value = pickedFile.path;
        isInsideValid.value = true;
      } else {
        isInsideValid.value = false;
      }
    } else if (imageType == 'outside') {
      if (pickedFile != null) {
        outside.value = pickedFile.path;
        isOutsideValid.value = true;
      } else {
        isOutsideValid.value = false;
      }
    }
  }
}
