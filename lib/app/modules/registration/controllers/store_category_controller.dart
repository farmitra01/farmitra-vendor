import 'package:farmitra/app/ApiModels/getModuleSubCategory.dart';
import 'package:farmitra/app/services/network_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreCategoryController extends GetxController {
  // Reactive variables
  final RxSet<int> selectedItems = <int>{}.obs;
  final RxList<ModuleSubCategory> gridContent = <ModuleSubCategory>[].obs;
  final RxList<ModuleSubCategory> subCategories = <ModuleSubCategory>[].obs;
  final RxBool isLoading = false.obs;
  final RxInt selectedIndex = 0.obs;
  final TextEditingController customeCategory = TextEditingController();

  // API service
  final ApiService _apiService = ApiService();

  // Get arguments from previous screen
  final dynamic previousPageGridTitle = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    debugPrint(
      'StoreCategoryController: onInit called, instance=$hashCode, previousSelectedValue=$previousPageGridTitle',
    );
    _parseAndFetch();
  }

  // Toggle selection status of an item
  void toggleSelection(int index) {
    if (selectedItems.contains(index)) {
      selectedItems.remove(index);
    } else {
      selectedItems.add(index);
    }
    debugPrint('Selected items: ${selectedItems.toList()}');
  }

  // Add new item to the grid
  void addGridItem(ModuleSubCategory newItem) {
    gridContent.add(newItem);
    debugPrint('Added new item: ${newItem.name}');
  }

  // Parse arguments and fetch data
  void _parseAndFetch() {
    int? categoryId;
    String? categoryName;

    if (previousPageGridTitle is String) {
      final parts = previousPageGridTitle.split(',');
      for (var part in parts) {
        if (part.startsWith('id:')) {
          categoryId = int.tryParse(part.split(':')[1]);
        } else if (part.startsWith('name:')) {
          categoryName = part.split(':')[1];
        }
      }
    }

    if (categoryId != null) {
      fetchModuleSubCategory(categoryId, name: categoryName);
    } else {
      debugPrint('❌ Missing ID: fallback triggered, instance=$hashCode');
      Get.snackbar(
        'Error',
        'Invalid category selection.',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  // Fetch subcategories from API
  Future<void> fetchModuleSubCategory(int id, {String? name}) async {
    try {
      isLoading.value = true;

      final endpointUrl = '/module-subcategory/$id';
      debugPrint('Requesting API: $endpointUrl');

      final response = await _apiService.callApi(
        endpoint: endpointUrl,
        method: 'GET',
      );

      debugPrint('Raw API Response: ${response.toString()}');

      final List<dynamic>? dataList =
          response['data']?['data'] ?? response['data'];
      if (dataList != null && dataList.isNotEmpty) {
        final parsedList =
            dataList.map((item) => ModuleSubCategory.fromJson(item)).toList();

        subCategories.value = parsedList;
        gridContent.value = parsedList; // Populate gridContent with API data

        // Automatically select index 0 if data exists
        if (subCategories.isNotEmpty) {
          selectItem(0); // Select the first item by default
          _sendDefaultArgument();
        }

        debugPrint('Parsed ${subCategories.length} module subcategories');
      } else {
        subCategories.clear();
        gridContent.clear();
        debugPrint('No subcategories found.');
      }
    } catch (e) {
      debugPrint('Exception during fetchModuleSubCategory: $e');
      Get.snackbar(
        'Error',
        'Failed to fetch subcategories.',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
      debugPrint(
        'Fetch completed: ${subCategories.length} items, instance=$hashCode',
      );
    }
  }

  // Select an item and update selectedIndex
  void selectItem(int index) {
    if (index >= 0 && index < subCategories.length) {
      selectedIndex.value = index;
      debugPrint(
        '✅ Selected Item: Index=$index, ID=${subCategories[index].id}, Name=${subCategories[index].name}, instance=$hashCode',
      );
    }
  }

  // Send the default argument (index 0 data)
  void _sendDefaultArgument() {
    if (subCategories.isNotEmpty) {
      final defaultData =
          'id:${subCategories[0].id},name:${subCategories[0].name ?? 'Unknown'}';
      debugPrint('Sending default argument: $defaultData');
      // Example: Navigate to another screen with the default argument
      // Get.to(() => NextScreen(), arguments: defaultData);
    }
  }

  @override
  void onClose() {
    customeCategory.dispose();
    super.onClose();
  }
}
