import 'dart:io';

import 'package:farmitra/app/data/models/store_category_model/store_template_model.dart';
import 'package:farmitra/app/modules/registration/controllers/store_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StoreTemplateController extends GetxController {
  //TODO: Implement StoreTemplateController
  final StoreCategoryController storeCategoryController = Get.put(
    StoreCategoryController(),
  );
  var selectedIndex = 0.obs;
  final count = 0.obs;
  @override
  void onInit() {
    updateName.text =
        storeCategoryController.previousPageGridTitle == 'Expert'
            ? 'Farmitra Expert'
            : storeCategoryController.previousPageGridTitle == 'Rental'
            ? 'Farmitra Rental'
            : storeCategoryController.previousPageGridTitle == 'Drone'
            ? 'Farmitra Drone'
            : 'Farmitra Mart';
    extractName(updateName.text);
    print(updateName.text);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    updateName.dispose();
    super.onClose();
  }

  void increment() => count.value++;
  var selectedLogoIndex = (0).obs;
  var selectedBannerIndex = (0).obs;

  // List<Color> backgroundColorList = [
  //   Colors.black,
  //   Colors.white,
  //   Colors.grey,
  //   Color(0xff373A60),
  // ];
  // List<Color> spanTextColor = [
  //   Colors.white,
  //   Colors.black,
  //   Color(0xff373A60),
  //   Colors.white,
  // ];
  // List<String> bannerBackgroundImage = [
  //   'assets/images/store_logo_&_cover/shopBanner.jpg',
  //   'assets/images/store_logo_&_cover/bannerImage2.jpg',
  //   'assets/images/store_logo_&_cover/bann erImage3.jpg',
  //   'assets/images/store_logo_&_cover/bannerImage1.jpg',
  // ];

  List<StoreTemplateModel> storeTemplate = [
    StoreTemplateModel(
      backgroundColor: Colors.black,
      spanTextColor: Colors.white,
      bannerImage: 'assets/images/store_logo_&_cover/shopBanner.jpg',
    ),
    StoreTemplateModel(
      backgroundColor: Colors.white,
      spanTextColor: Colors.black,
      bannerImage: 'assets/images/store_logo_&_cover/bannerImage2.jpg',
    ),
    StoreTemplateModel(
      backgroundColor: Colors.grey,
      spanTextColor: Color(0xff373A60),
      bannerImage: 'assets/images/store_logo_&_cover/bannerImage3.jpg',
    ),
    StoreTemplateModel(
      backgroundColor: Color(0xff373A60),
      spanTextColor: Colors.white,
      bannerImage: 'assets/images/store_logo_&_cover/bannerImage1.jpg',
    ),
  ];

  // var logoImage = Rx<File?>(null); // Observable for logo image
  // var bannerImage = Rx<File?>(null); // Observable for banner image

  // final ImagePicker _picker = ImagePicker();

  // // Method to pick image from gallery
  // Future<void> pickImage(ImageSource source, bool isLogo) async {
  //   final pickedFile = await _picker.pickImage(source: source);
  //   if (pickedFile != null) {
  //     if (isLogo) {
  //       logoImage.value = File(pickedFile.path); // Set the logo image
  //     } else {
  //       bannerImage.value = File(pickedFile.path); // Set the banner image
  //     }
  //   }
  // }

  // // Method to clear the selected image
  // void clearImage(bool isLogo) {
  //   if (isLogo) {
  //     logoImage.value = null;
  //   } else {
  //     bannerImage.value = null;
  //   }
  // }

  TextEditingController updateName = TextEditingController();
  var initials = ''.obs; // For storing initials
  var firstName = ''.obs; // For storing first name
  var lastName = ''.obs; // For storing last name

  // Method to extract first name, last name, and initials
  void extractName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    if (nameParts.isNotEmpty) {
      firstName.value = nameParts[0];
      lastName.value = nameParts.length > 1 ? nameParts[1] : '';
      initials.value =
          nameParts
              .map((part) => part.isNotEmpty ? part[0].toUpperCase() : '')
              .join();
    }
  }
}
