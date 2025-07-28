import 'dart:io';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class StoreDetailsFormController extends GetxController {
  final TextEditingController other = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController whatsAppNumber = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController about = TextEditingController();
  final box = GetStorage();
  var selectedItem = ''.obs;
  List<String> storeChannelList = ['Online', 'Physical', 'Both'];

  void updatedSelectedValue(String value) {
    selectedItem.value = value;
    // isDropdownValid.value = true;
  }

  // bool validateDropdown() {
  //   isDropdownValid.value = selectedItem.value.isNotEmpty;
  //   return isDropdownValid.value;
  // }

  var selectedLogoPath = ''.obs;
  var selectedBannerPath = ''.obs;

  final ImagePicker _picker = ImagePicker();

  var isBannerValid = true.obs;
  // var isDropdownValid = true.obs;

  Future<void> pickImage(String imageType) async {
    final ImageSource? source = await showDialog<ImageSource>(
      context: Get.context!,
      builder:
          (BuildContext context) => AlertDialog(
            title: Text(
              'Select Image',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryGradinatMixColor,
              ),
            ),
            content: const Text('Choose the source for the image.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, ImageSource.camera),
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
                onPressed: () => Navigator.pop(context, ImageSource.gallery),
                child: Text(
                  'Gallery',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGradinatMixColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.error,
                  ),
                ),
              ),
            ],
          ),
    );

    if (source == null) {
      print('pickImage: No source selected (dialog cancelled)');
      return;
    }

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );
      if (pickedFile == null) {
        print('pickImage: No image selected for $source');
        Get.snackbar(
          'No Image Selected',
          'No image was selected from ${source == ImageSource.camera ? 'camera' : 'gallery'}.',
          backgroundColor: AppColors.error,
          colorText: AppColors.white,
        );
        return;
      }

      final file = File(pickedFile.path);
      final fileSizeMB = await file.length() / (1024 * 1024);

      if (imageType == 'logo' && fileSizeMB > 3) {
        Get.snackbar(
          'Error',
          'Logo image must be less than 3MB',
          backgroundColor: AppColors.error,
          colorText: AppColors.white,
        );
        print('pickImage: Logo image size $fileSizeMB MB exceeds 3MB limit');
        return;
      } else if (imageType == 'banner' && fileSizeMB > 5) {
        Get.snackbar(
          'Error',
          'Banner image must be less than 5MB',
          backgroundColor: AppColors.error,
          colorText: AppColors.white,
        );
        isBannerValid.value = false;
        print('pickImage: Banner image size $fileSizeMB MB exceeds 5MB limit');
        return;
      }

      if (imageType == 'logo') {
        selectedLogoPath.value = pickedFile.path;
        print('pickImage: Logo selected: ${pickedFile.path}');
      } else if (imageType == 'banner') {
        selectedBannerPath.value = pickedFile.path;
        isBannerValid.value = true;
        print('pickImage: Banner selected: ${pickedFile.path}');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image from ${source == ImageSource.camera ? 'camera' : 'gallery'}: $e',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
        duration: const Duration(seconds: 5),
      );
      print('pickImage: Error picking image for $source: $e');
    }
  }

  // bool validateImages() {
  //   isLogoValid.value = selectedLogoPath.value.isNotEmpty;
  //   isBannerValid.value = selectedBannerPath.value.isNotEmpty;
  //   return isLogoValid.value && isBannerValid.value;
  // }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return 'Please enter email';
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      return 'Please enter a valid email';
    }
    if (email.length < 10) return 'Email must be at least 10 characters long';
    return null;
  }

  var selectedGender = 'Male'.obs;

  void changeGender(String value) => selectedGender.value = value;

  RxList<int> selectedIndexes = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    final storedNumber = box.read('login_mobileNumber');
    if (storedNumber != null && storedNumber is String) {
      whatsAppNumber.text = storedNumber;
    }
    selectedIndexes.clear();
    print('StoreDetailsFormController initialized, selectedIndexes cleared');
    final arguments = Get.arguments ?? {};
    initializeImages(
      arguments['logoImage'] as String?,
      arguments['bannerImage'] as String?,
    );
    initializeFromData(arguments['savedIndexes'] as List<dynamic>?);
  }

  void toggleSelection(int index) {
    if (index < 0 || index >= languages.length) {
      print('Invalid index in toggleSelection: $index');
      return;
    }
    print('toggleSelection called with index: $index');
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else {
      selectedIndexes.add(index);
    }
    selectedIndexes.refresh();
  }

  bool isSelected(int index) {
    if (index < 0 || index >= languages.length) {
      print('Invalid index in isSelected: $index');
      return false;
    }
    print('isSelected called with index: $index');
    return selectedIndexes.contains(index);
  }

  List<String> languages = [
    'Hindi',
    'English',
    'Gujrati',
    'Marathi',
    'Telagu',
    'Bengali',
    'Kannada',
    'Hariyanvi',
    'Panjabi',
    'Hydrabadi',
  ];

  var selectedRentalItem = ''.obs;
  var isRentalDropdownValid = true.obs;
  List<String> rentalItemList = [
    'Tractor',
    'Harvestor',
    'Pump / Machinary',
    'Others',
  ];

  void updateSelectedRentalItem(String value) {
    selectedRentalItem.value = value;
    isRentalDropdownValid.value = true;
  }

  bool validateRentalDropdown() {
    isRentalDropdownValid.value = selectedRentalItem.value.isNotEmpty;
    return isRentalDropdownValid.value;
  }

  void initializeFromData(List<dynamic>? savedIndexes) {
    print('initializeFromData called with savedIndexes: $savedIndexes');
    if (savedIndexes != null) {
      selectedIndexes.clear();
      for (var index in savedIndexes) {
        int? parsed;
        if (index is String) {
          parsed = int.tryParse(index);
          if (parsed == null) {
            print('Invalid index in savedIndexes: $index');
            Get.snackbar(
              'Warning',
              'Invalid language selection: $index ignored',
              backgroundColor: AppColors.error,
              colorText: AppColors.white,
            );
            continue;
          }
        } else if (index is int) {
          parsed = index;
        } else {
          print('Unexpected index type in savedIndexes: $index');
          continue;
        }
        if (parsed != null && parsed >= 0 && parsed < languages.length) {
          selectedIndexes.add(parsed);
        } else {
          print('Invalid or out-of-range index: $parsed');
          Get.snackbar(
            'Warning',
            'Out-of-range language index: $parsed ignored',
            backgroundColor: AppColors.error,
            colorText: AppColors.white,
          );
        }
      }
      selectedIndexes.refresh();
      print('selectedIndexes updated: $selectedIndexes');
    } else {
      print('savedIndexes is null, no changes made to selectedIndexes');
    }
  }

  void initializeImages(String? logoImagePath, String? bannerImagePath) {
    print(
      'initializeImages: logoImagePath=$logoImagePath, bannerImagePath=$bannerImagePath',
    );
    // Validate logo image path
    if (logoImagePath != null && logoImagePath.isNotEmpty) {
      final file = File(logoImagePath);
      if (file.existsSync()) {
        selectedLogoPath.value = logoImagePath;
        print('initializeImages: Logo path set to $logoImagePath');
      } else {
        selectedLogoPath.value = '';
        print('initializeImages: Invalid logo path: $logoImagePath');
        Get.snackbar(
          'Error',
          'Invalid logo image path',
          backgroundColor: AppColors.error,
          colorText: AppColors.white,
        );
      }
    } else {
      selectedLogoPath.value = '';
      print('initializeImages: No logo path provided');
    }

    // Validate banner image path
    if (bannerImagePath != null && bannerImagePath.isNotEmpty) {
      final file = File(bannerImagePath);
      if (file.existsSync()) {
        selectedBannerPath.value = bannerImagePath;
        isBannerValid.value = true;
        print('initializeImages: Banner path set to $bannerImagePath');
      } else {
        selectedBannerPath.value = '';
        isBannerValid.value = false;
        print('initializeImages: Invalid banner path: $bannerImagePath');
        Get.snackbar(
          'Error',
          'Invalid banner image path',
          backgroundColor: AppColors.error,
          colorText: AppColors.white,
        );
      }
    } else {
      selectedBannerPath.value = '';
      isBannerValid.value = false;
      print('initializeImages: No banner path provided');
    }

    // Force UI update
    selectedLogoPath.refresh();
    selectedBannerPath.refresh();
  }

  @override
  void onClose() {
    other.dispose();
    name.dispose();
    whatsAppNumber.dispose();
    location.dispose();
    email.dispose();
    about.dispose();
    super.onClose();
  }
}
