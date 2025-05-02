import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StoreProfileController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement StoreProfileController

  late TabController  tabController;
  final count = 0.obs;
  @override
  void onInit() {    
    super.onInit();
   tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

    var isTitleVisible = false.obs;
  void increment() => count.value++;
  final List<String> crouseImages= [
    'assets/images/storeProfile/bannerImage-1.jpg',
    'assets/images/storeProfile/bannerImage-2.jpg',
    'assets/images/storeProfile/bannerImage-3.jpg',
    'assets/images/storeProfile/bannerImage-4.jpg',
    'assets/images/storeProfile/bannerImage-5.jpg'
  ];
  // final List<String> stringItems = [
  //   'First Slide',
  //   'Second Slide',
  //   'Third Slide',
  //   'Fourth Slide',
  //   'Fifth Slide'
  // ];
}
