import 'package:farmitra/app/modules/registration/controllers/store_category_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpertprofileController extends GetxController {
  final StoreCategoryController storeCategoryController = Get.put(
    StoreCategoryController(),
  );
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

  List<Map<String, dynamic>> profileDetail = [
    {'count': '100', 'details': 'Post'},
    {'count': '10k', 'details': 'Followers'},
    {'count': '5k', 'details': 'Following'},
  ];

  List<Map<String, dynamic>> getDetailsList() {
    return [
      {'icon': Icons.manage_accounts_outlined, 'details': 'My Profile'},
      {'icon': Icons.layers_outlined, 'details': 'My Feed'},
      {'icon': Icons.calendar_month_outlined, 'details': 'My Appointments'},
      {
        'icon': Icons.business_center,
        'details': storeCategoryController.previousPageGridTitle == 'Expert'
            ? 'Expert Profile'
            : storeCategoryController.previousPageGridTitle == 'Rental'
                ? 'Rental Profile'
                : ''
      },
      {
        'icon': Icons.assignment_add,
        'details': storeCategoryController.previousPageGridTitle == 'Expert'
            ? 'Expert KYC'
            : storeCategoryController.previousPageGridTitle == 'Rental'
                ? 'Rental KYC'
                : ''
      },
      {'icon': Icons.payments, 'details': 'My Payment'},
      {'icon': Icons.event_note, 'details': 'Manage Appointment'},
      {'icon': Icons.shopping_cart, 'details': 'My Shopping Cart'},
      {'icon': Icons.settings, 'details': 'Settings'},
    ];
}}
