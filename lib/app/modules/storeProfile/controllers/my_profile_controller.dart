import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController
    with GetTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
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

  List<Map<String, dynamic>> profileDetail = [
    {'count': '100', 'details': 'Post'},
    {'count': '10k', 'details': 'Followers'},
    {'count': '5k', 'details': 'Following'},
  ];
}
