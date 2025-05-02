import 'dart:math';
import 'package:farmitra/app/data/models/store_select_model/store_select_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreSelectedModuleController extends GetxController {
  var PreviousSelectedValue = Get.arguments;
  RxInt selectedIndex = 0.obs; // Default selected index is 0
  var gridTitle = ''.obs;

  var items = <StoreSelectModel>[].obs;
  List<Color> colors = [];

  List<String> gridText = [
    'Expert',
    'Rental',
    'Drone',
    'Worker',
    'Land Lease',
    'Loan',
    'Soil Testing',
    'Ware Housing',
    'Transport',
    'FPO',
    'Miller\nProcessor',
  ];

  List<String> retailerList = [
    'Input Supplies',
    'Farm Equipment & Machinery',
    'Farm Tools',
    'Agri-Services & Infrastructure',
    'Animal Husbandry',
    'Organic & Natural Farming',
    'Value Addition / Food Processing',
  ];

  @override
  void onInit() {
    super.onInit();
    colors = getRandomGradientColors();
    // Set default selection to index 0
    selectItem(0);
  }

  void selectItem(int index) {
    selectedIndex.value = index;
    gridTitle.value = selectedGridTitle;
  }

  String get selectedGridTitle => PreviousSelectedValue == 'As a Retailer'
      ? retailerList[selectedIndex.value]
      : gridText[selectedIndex.value];

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // Red value
      random.nextInt(256), // Green value
      random.nextInt(256), // Blue value
    );
  }

  List<Color> getRandomGradientColors() {
    return [
      getRandomColor(),
      getRandomColor(),
      getRandomColor(),
      getRandomColor(),
      getRandomColor(),
      getRandomColor(),
      getRandomColor(),
      getRandomColor(),
      getRandomColor(),
      getRandomColor(),
      getRandomColor(),
    ];
  }
}