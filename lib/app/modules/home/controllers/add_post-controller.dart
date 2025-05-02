import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostcontroller extends GetxController {
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

  var comment = TextEditingController();
  RxList<String> tags =
      ['Rain', 'Weather', 'Problem', 'Cron', 'Market', 'Sell', 'Paddy'].obs;
  RxSet<int> selectedTags = <int>{}.obs;
   var selectedImage = Rx<File?>(
    null,
  ); // Reactive variable to track selected image

  final ImagePicker _picker = ImagePicker();

  // Function to pick image from camera or gallery
  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path); // Update reactive variable
    }
  }

  // Capture image from camera
  Future<void> captureImage() async {
    await pickImage(ImageSource.camera);
  }

  // Select image from gallery
  Future<void> uploadFromGallery() async {
    await pickImage(ImageSource.gallery);
  }
}
