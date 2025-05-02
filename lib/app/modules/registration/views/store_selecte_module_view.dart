import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/registration/controllers/store_selected_module_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custome_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreSelectedModuleView extends GetView<StoreSelectedModuleController> {
  const StoreSelectedModuleView({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    Get.put(StoreSelectedModuleController());

    final previousSelectedValue = Get.arguments;

    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        onHelpTap: () => Get.toNamed('/help-center'),
        onTranslateTap: () => Get.toNamed('/add'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '$previousSelectedValue',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondary,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Text(
                            'Edit     ',
                            style: GoogleFonts.montserrat(
                              color: AppColors.primaryGradinatMixColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 45,
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryFirstGradiant,
                          AppColors.primarySecondGradiant,
                        ],
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 15,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.primaryFirstGradiant,
                                AppColors.primarySecondGradiant,
                              ],
                            ),
                          ),
                          child: const CircleAvatar(
                            child: Center(
                              child: Icon(
                                Icons.check,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Select a module-',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              'Module under which your business suits well.',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: previousSelectedValue == 'As a Retailer'
                    ? controller.retailerList.length
                    : controller.gridText.length,
                itemBuilder: (context, index) {
                  if (index >= controller.colors.length) {
                    return const SizedBox();
                  }
                  return GestureDetector(
                    onTap: () => controller.selectItem(index),
                    child: Obx(
                      () => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.white,
                              controller.colors[index].withOpacity(0.2),
                            ],
                            stops: const [0.40, 1.0],
                          ),
                          border: Border.all(
                            color: controller.selectedIndex.value == index
                                ? AppColors.primaryGradinatMixColor
                                : Colors.transparent,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 15,
                                  child: Radio<int>(
                                    value: index,
                                    groupValue: controller.selectedIndex.value,
                                    activeColor: AppColors.primaryGradinatMixColor,
                                    onChanged: (int? value) {
                                      if (value != null) {
                                        controller.selectItem(value);
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                      text: previousSelectedValue == 'As a Retailer'
                                          ? controller.retailerList[index]
                                          : controller.gridText[index],
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: controller.colors[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                          ],
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: CustomGradientButton(
          text: 'Proceed',
          onPressed: () {
            if (controller.gridTitle.value.isNotEmpty) {
              Get.toNamed(
                '/store_category',
                arguments: controller.gridTitle.value,
              );
            } else {
              Get.snackbar(
                'Please',
                'Select Any Module',
                snackPosition: SnackPosition.TOP,
                backgroundColor: AppColors.primaryGradinatMixColor,
                colorText: AppColors.white,
              );
            }
          },
        ),
      ),
    );
  }
}