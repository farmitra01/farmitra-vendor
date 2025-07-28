import 'dart:io';

import 'package:farmitra/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class EditProductController extends GetxController {
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

  RxBool showGrid = false.obs;
  var purchasePriceTax = ''.obs;
  var product_priceTax = ''.obs; // Use RxString for reactivity
  var producName = TextEditingController();
  var productDiscription = TextEditingController();
  var storeChannel = Rx<String?>(null);
  var brand = Rx<String?>(null);
  var category = Rx<String?>(null);
  var sub_category = Rx<String?>(null);
  var product_price = TextEditingController();
  var tax_amount = TextEditingController();
  var product_unit = Rx<String?>(null);
  var discount = TextEditingController();
  var max_limit = TextEditingController();
  var SKUs = TextEditingController();
  var availbility = Rx<String?>(null);
  var purchase_price_tax = TextEditingController();
  var hsn_Code = TextEditingController();
  var assign_barcode = TextEditingController();

  RxList<String> availableItems =
      [
        "Vegitables & Fruits",
        "Vegitables",
        "Green veggie",
        "Organic",
        "Healthy",
        "Fruits",
      ].obs;
  RxList selectedItems = [].obs;

  void selectItem(String item) {
    if (availableItems.contains(item)) {
      availableItems.remove(item);
      selectedItems.add(item);
    }
  }

  void removeItem(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
      availableItems.add(item);
    }
  }

  var selectedImages = <File>[].obs; // Observable list of images

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImages(ImageSource source) async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      selectedImages.addAll(
        pickedFiles.map((file) => File(file.path)),
      ); // Add images to the list
      Get.closeAllSnackbars();
      Get.back(closeOverlays: true);
      (); // Close the dialog after selecting images
    }
  }

  RxBool isAvailable = false.obs;

  var selectedImageIndex = 0.obs;

  // List of images for the grid (you can replace it with your actual image data)
  var imagePaths =
      [
        'assets/images/Null_image.png',
        'assets/images/Null_image.png',
        'assets/images/Null_image.png',
        'assets/images/Null_image.png',
      ].obs;

  // Nested grid image paths (can be dynamic based on your data)
  var nestedImagePaths =
      [
        'assets/images/Null_image.png',
        'assets/images/Null_image.png',
        'assets/images/Null_image.png',
        'assets/images/Null_image.png',
      ].obs;
}
