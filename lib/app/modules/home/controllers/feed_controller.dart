import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
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

  void increment() => count.value++;
  var search = TextEditingController();
  var reply = TextEditingController();
  List<Map<String, dynamic>> action = [
    {'icon': Icons.favorite_outline_outlined, 'count': '45'},
    {'icon': Icons.chat, 'count': '5'},
    {'icon': Icons.bookmark_add, 'count': '10'},
    {'icon': Icons.share, 'count': '15'},
  ];
  final List<String> imagePaths = [
    'assets/images/damage_leaves_01.jpg',
    'assets/images/damage_leaves_02.jpg',
    'assets/images/damage_leaves_03.jpg',
  ];

  // Example list of YouTube video URLs
  final List<String> youtubeVideoUrls = [
    'https://www.youtube.com/watch?v=APDgPbxQ7bQ', // Example video 1
    'https://www.youtube.com/watch?v=ALC2Qv-4sGg', // Example video 2
    'https://www.youtube.com/watch?v=Vv7nJ3oF6z8', // Example video 3
  ];
}
