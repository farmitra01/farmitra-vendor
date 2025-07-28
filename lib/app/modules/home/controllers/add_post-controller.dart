import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/constants/api_endpoints.dart';
import 'package:farmitra/app/services/network_services.dart';

class AddPostController extends GetxController {
  final ApiService _apiService = ApiService();

  final TextEditingController comment = TextEditingController();
  final RxList<int> selectedTags = <int>[].obs;
  final RxList<File> selectedImages = <File>[].obs;

  final RxInt commentLength = 0.obs;

  final List<String> tags = [
    'General',
    'Farming',
    'Irrigation',
    'Fertilizers',
    'Pesticides',
    'Equipment'
  ];

  @override
  void onInit() {
    super.onInit();
    comment.addListener(() {
      commentLength.value = comment.text.trim().length;
    });
  }

  String? Function(String?) validateComment() {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return 'Comment cannot be empty';
      } else if (value.trim().length > 100) {
        return 'Comment must be under 100 characters';
      }
      return null;
    };
  }

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      selectedImages.addAll(pickedFiles.map((xfile) => File(xfile.path)));
    }
  }

  Future<void> addPost() async {
    final validationMessage = validateComment()(comment.text);
    if (validationMessage != null) {
      Get.snackbar('Error', validationMessage, backgroundColor: AppColors.error, colorText: AppColors.white);
      return;
    }

    if (selectedImages.isEmpty) {
      Get.snackbar('Error', 'Please select at least one image', backgroundColor: AppColors.error, colorText: AppColors.white);
      return;
    }

    final selectedTagList = selectedTags.map((index) => tags[index]).toList();
    final tagsString = selectedTagList.isEmpty ? 'General' : selectedTagList.join(',');

    try {
      final formData = {
        'location': 'Gurugram sec 28',
        'tags': tagsString,
        'content': comment.text.trim(),
      };

      final Map<String, File> imageMap = {
        for (int i = 0; i < selectedImages.length; i++) 'image[$i]': selectedImages[i]
      };

      final response = await _apiService.callApi(
        endpoint: ApiEndpoints.addPostByExpert,
        method: 'POST',
        formData: formData,
        fileMap: imageMap,
        fileFieldName: 'image[]',
        isMultipart: true,
        requireAuth: true,
      );

      if (response['success'] == true) {
        Get.snackbar('Success', response['data']?['message'] ?? 'Post created successfully',
            backgroundColor: AppColors.primaryGradinatMixColor, colorText: AppColors.white);
        comment.clear();
        selectedImages.clear();
        selectedTags.clear();
      } else {
        final message = response['data']?['message'] ?? response['message'] ?? 'Failed to create post';
        Get.snackbar('Error', message, backgroundColor: AppColors.error, colorText: AppColors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e', backgroundColor: AppColors.error, colorText: AppColors.white);
    }
  }
}
