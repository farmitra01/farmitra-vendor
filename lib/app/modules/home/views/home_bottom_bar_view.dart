import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/POS/views/pos_view.dart';
import 'package:farmitra/app/modules/home/controllers/home_bottom_bar_controller.dart';
import 'package:farmitra/app/modules/home/views/Appointment.dart';
import 'package:farmitra/app/modules/home/views/order_view.dart';
import 'package:farmitra/app/modules/registration/controllers/store_category_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_selected_module_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBottomBarView extends GetView<HomeBottomBarController> {
  HomeBottomBarView({super.key});
  final HomeBottomBarController homeBottomBarController = Get.put(
    HomeBottomBarController(),
  );
  var previousPageGridTitle = Get.arguments;
  final StoreCategoryController storeCategoryController = Get.put(
    StoreCategoryController(),
  );
  final StoreSelectedModuleController storeSelectedModuleController = Get.put(
    StoreSelectedModuleController(),
  );

  @override
  Widget build(BuildContext context) {
    print(
      'previous page content = ${storeSelectedModuleController.PreviousSelectedValue}',
    );
    return Scaffold(
      body: Obx(() {
        final pageIndex = homeBottomBarController.currentIndex.value;
        return homeBottomBarController.pages[pageIndex];
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          storeSelectedModuleController.PreviousSelectedValue == 'As a Retailer'
              ? Get.toNamed('/pos')
              : Get.to(() => Appointment());
          print("Floating Action Button Pressed");
        },
        child:
            storeSelectedModuleController.PreviousSelectedValue ==
                    'As a Retailer'
                ? Icon(Icons.storefront, color: AppColors.white)
                : Icon(Icons.calendar_month, color: AppColors.white),
        backgroundColor: AppColors.primaryGradinatMixColor,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GetBuilder<HomeBottomBarController>(
        builder: (homeBottomBarController) {
          return BottomAppBar(
            color: AppColors.white,
            shadowColor: AppColors.containerShadowColor,
            elevation: 75,
            clipBehavior: Clip.none,
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    homeBottomBarController.onTapIndex(0);
                  },
                  child: Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color:
                              homeBottomBarController.currentIndex == 0
                                  ? AppColors.primaryGradinatMixColor
                                  : AppColors.secondary,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Home',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight:
                                homeBottomBarController.currentIndex == 0
                                    ? FontWeight.w500
                                    : FontWeight.w300,
                            color:
                                homeBottomBarController.currentIndex == 0
                                    ? AppColors.primaryGradinatMixColor
                                    : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.onTapIndex(1);
                    print('${previousPageGridTitle}');
                  },
                  child: Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          storeSelectedModuleController.PreviousSelectedValue ==
                                  'As a Retailer'
                              ? Icons.file_download_outlined
                              : Icons.layers_outlined,
                          color:
                              homeBottomBarController.currentIndex == 1
                                  ? AppColors.primaryGradinatMixColor
                                  : AppColors.secondary,
                        ),
                        SizedBox(height: 5),
                        Text(
                          storeSelectedModuleController.PreviousSelectedValue ==
                                  'As a Retailer'
                              ? 'Order'
                              : 'Feed',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight:
                                homeBottomBarController.currentIndex == 0
                                    ? FontWeight.w500
                                    : FontWeight.w300,
                            color:
                                homeBottomBarController.currentIndex == 1
                                    ? AppColors.primaryGradinatMixColor
                                    : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    storeSelectedModuleController.PreviousSelectedValue ==
                            'As a Retailer'
                        ? 'POS'
                        : 'Appointment',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight:
                          homeBottomBarController.currentIndex == 0
                              ? FontWeight.w500
                              : FontWeight.w300,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    homeBottomBarController.onTapIndex(2);
                  },
                  child: Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.message_outlined,
                          color:
                              homeBottomBarController.currentIndex == 2
                                  ? AppColors.primaryGradinatMixColor
                                  : AppColors.secondary,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Chat',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight:
                                homeBottomBarController.currentIndex == 0
                                    ? FontWeight.w500
                                    : FontWeight.w300,
                            color:
                                controller.currentIndex == 2
                                    ? AppColors.primaryGradinatMixColor
                                    : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    homeBottomBarController.onTapIndex(3);
                  },
                  child: Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.manage_accounts_outlined,
                          color:
                              homeBottomBarController.currentIndex == 3
                                  ? AppColors.primaryGradinatMixColor
                                  : AppColors.secondary,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Profile',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight:
                                homeBottomBarController.currentIndex == 0
                                    ? FontWeight.w500
                                    : FontWeight.w300,
                            color:
                                homeBottomBarController.currentIndex == 3
                                    ? AppColors.primaryGradinatMixColor
                                    : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
