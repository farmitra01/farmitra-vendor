import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/registration/controllers/store_category_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_location_search_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreLocationSearchView extends GetView {
  const StoreLocationSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    final StoreLocationSearchController store_location_search_controller =
        Get.put(StoreLocationSearchController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          children: [
            SizedBox(height: 40),
            CustomTextFormField(
              prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
              hintText: 'Search for your location',
              keyboardType: TextInputType.text,
              controller: store_location_search_controller.search,
              suffixIcon: Icons.my_location_sharp,
              // suffixIcon: Icon(
              //       Icons.my_location_sharp,
              //       color: AppColors.textSecondary,
              //     ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Store Name';
                }
                return null;
              },
              inputFormatters: [LengthLimitingTextInputFormatter(35)],
            ),

            // Container(
            //   decoration: BoxDecoration(
            //     boxShadow: [
            //       BoxShadow(
            //         color: AppColors.containerShadowColor,
            //         blurRadius: 7,
            //         spreadRadius: 2,
            //         offset: Offset(0, 1),
            //       ),
            //     ],
            //     color: AppColors.background,
            //     borderRadius: BorderRadius.circular(25),
            //   ),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       prefixIcon: Icon(
            //         Icons.search,
            //         color: AppColors.textSecondary,
            //       ),
            //       suffixIcon: Icon(
            //         Icons.my_location_sharp,
            //         color: AppColors.textSecondary,
            //       ),
            //       hintText: "Search for your location",
            //       hintStyle: TextStyle(
            //         color: AppColors.textSecondary,
            //         fontSize: 14,
            //         fontWeight: FontWeight.w500,
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25),
            //         borderSide: BorderSide(
            //           color: AppColors.primaryGradinatMixColor,
            //         ),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25),
            //         borderSide: BorderSide(color: AppColors.border),
            //       ),
            //       focusedErrorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25),
            //         borderSide: BorderSide(color: AppColors.error),
            //       ),
            //       errorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25),
            //         borderSide: BorderSide(color: AppColors.error),
            //       ),
            //     ),
            //     validator: (value) {
            //       if (value == null || value.isEmpty) {
            //         return 'Please Enter Store Name';
            //       }
            //       return null;
            //     },
            //     inputFormatters: [LengthLimitingTextInputFormatter(35)],
            //   ),
            // ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryGradinatMixColor.withOpacity(
                        0.15,
                      ),
                      blurRadius: 25,
                      spreadRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  // .withOpacity(0.035),
                ),
                child: SvgPicture.asset(
                  'assets/svgs/location.svg',
                  color: AppColors.primaryGradinatMixColor,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: CustomGradientButton(
                text: 'Save',
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
