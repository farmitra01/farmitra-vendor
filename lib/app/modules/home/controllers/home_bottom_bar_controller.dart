// import 'package:farmitra/app/data/models/store_profile/views/profile_view.dart';
import 'package:farmitra/app/data/models/store_about_model/store_about_model.dart';
import 'package:farmitra/app/modules/home/views/Appointment.dart';
import 'package:farmitra/app/modules/home/views/chat_view.dart';
import 'package:farmitra/app/modules/home/views/feed.dart';
import 'package:farmitra/app/modules/home/views/first_med_order.dart';
import 'package:farmitra/app/modules/home/views/home_view.dart';
import 'package:farmitra/app/modules/home/views/order_view.dart';
import 'package:farmitra/app/modules/my_subscription/views/my_subscription_view.dart';
import 'package:farmitra/app/modules/owner_profile/views/owner_profile_view.dart';
import 'package:farmitra/app/modules/registration/controllers/store_category_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_selected_module_controller.dart';
import 'package:farmitra/app/modules/storeProfile/views/expert_profile.dart';
import 'package:farmitra/app/modules/storeProfile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBottomBarController extends GetxController {
  //TODO: Implement HomeBottomBarController

  final StoreCategoryController storeCategoryController = Get.put(
    StoreCategoryController(),
  );
  final StoreSelectedModuleController storeSelectedModuleController = Get.put(
    StoreSelectedModuleController(),
  );
  var previousPageGridTitle = Get.arguments;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print(
      'previous page content in home Controller = ${storeCategoryController.previousPageGridTitle}',
    );
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

  var currentIndex = 0.obs;

  void onTapIndex(int index) {
    currentIndex.value = index;
  }

  List<Widget> get pages => [
    HomeView(),
    storeSelectedModuleController.previousSelectedValue == 'As a Retailer'
        ? OrderView()
        : Feed(),

    // storeCategoryController.previousPageGridTitle == 'Med'
    // ? FirstMedOrder()
    // ChatView(),
    MySubscriptionView(),
    storeSelectedModuleController.previousSelectedValue == 'As a Retailer'
        ? ProfileView()
        : ExpertProfile(),
  ];
  // ProfileView()
  // previousPageGridTitle == "Med" ? FirstMedOrder() : OrderView(),
}
