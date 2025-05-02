import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/registration/controllers/store_details_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custome_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreDetailsView extends GetView<StoreDetailsController> {
  const StoreDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    Get.put(StoreDetailsController());

    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        onHelpTap: () => Get.toNamed('/help-center'),
        onTranslateTap: () => Get.toNamed('/add'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nature of business-",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Select the nature of your business.",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: controller.listContent.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.selectItem(index),
                    child: Obx(
                      () => Container(
                        height: 100,
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: controller.selectedIndex.value == index
                                ? AppColors.primaryGradinatMixColor
                                : AppColors.secondary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          isThreeLine: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 8,
                          ),
                          title: Text(
                            controller.listContent[index].title,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            controller.listContent[index].subtitle,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          trailing: Radio<int>(
                            value: index,
                            groupValue: controller.selectedIndex.value,
                            activeColor: controller.selectedIndex.value == index
                                ? AppColors.primaryGradinatMixColor
                                : AppColors.secondary,
                            onChanged: (int? value) {
                              if (value != null) {
                                controller.selectItem(value);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: CustomGradientButton(
          text: 'Proceed',
          onPressed: () {
            if (controller.selectedIndex.value == 1) {
              Get.snackbar(
                'Note',
                'Coming Soon ... 🙏🙏',
                snackPosition: SnackPosition.TOP,
                backgroundColor: AppColors.primaryGradinatMixColor,
                colorText: AppColors.white,
              );
            } else if (controller.previousSelectedValue.value.isEmpty) {
              Get.snackbar(
                'Please',
                'Select Any Nature of Business',
                snackPosition: SnackPosition.TOP,
                backgroundColor: AppColors.primaryGradinatMixColor,
                colorText: AppColors.white,
              );
            } else {
              Get.toNamed(
                '/store_select_module',
                arguments: controller.previousSelectedValue.value,
              );
            }
          },
        ),
      ),
    );
  }
}