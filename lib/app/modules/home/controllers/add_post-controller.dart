import 'dart:io';
import 'package:farmitra/app/ApiModels/addPostRequest.dart';
import 'package:farmitra/app/services/network_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:farmitra/app/constants/api_endpoints.dart';
import 'package:farmitra/app/constants/app_colors.dart';

class AddPostcontroller extends GetxController {
  final comment = TextEditingController();
  RxList<String> tags =
      ['Rain', 'Weather', 'Problem', 'Cron', 'Market', 'Sell', 'Paddy'].obs;
  RxSet<int> selectedTags = <int>{}.obs;
  RxList<File> selectedImages = <File>[].obs;
  RxInt commentLength = 0.obs;

  final ImagePicker _picker = ImagePicker();
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    comment.addListener(() {
      commentLength.value = comment.text.length;
    });
  }

  @override
  void onClose() {
    comment.dispose();
    super.onClose();
  }

  String? validateComment(String? value) {
    if (value == null || value.isEmpty) {
      return 'Comment is required';
    }
    if (value.length > 100) {
      return 'Comment must be 100 characters or less';
    }
    return null;
  }

  Future<void> pickImages() async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles.isNotEmpty) {
        selectedImages.value =
            pickedFiles.map((file) => File(file.path)).toList();
      } else {
        Get.snackbar('Info', 'No images selected');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick images: $e');
    }
  }

  Future<void> addPost() async {
    if (validateComment(comment.text) != null) {
      Get.snackbar(
        'Error',
        'Please enter a valid comment (1-100 characters)',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
      return;
    }

    if (selectedImages.isEmpty) {
      Get.snackbar(
        'Error',
        'Please select at least one image',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
      return;
    }

    final selectedTagList = selectedTags.map((index) => tags[index]).toList();
    final tagsString = selectedTagList.join(',');

    try {
      final request = AddPostRequest(
        location: 'Gurugram sec 28',
        tags: tagsString.isEmpty ? 'General' : tagsString,
        content: comment.text,
        images: selectedImages,
      );

      final response = await _apiService.callApi(
        endpoint: ApiEndpoints.addPostByExpert,
        method: 'POST',
        formData: request.toFormData(),
        // files: request.images,
        fileFieldName: 'image[]',
      );

      if (response['success']) {
        Get.snackbar(
          'Success',
          response['data']['message'] ?? 'Post created successfully',
          backgroundColor: AppColors.primaryGradinatMixColor,
          colorText: AppColors.white,
        );
        print('Post ID: ${response['data']['post_id']}');
        comment.clear();
        selectedImages.clear();
        selectedTags.clear();
      } else {
        Get.snackbar(
          'Error',
          response['data']['message'] ?? 'Failed to create post',
          backgroundColor: AppColors.error,
          colorText: AppColors.white,
        );
        print('Error Response: ${response['data']}');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
    }
  }
}
