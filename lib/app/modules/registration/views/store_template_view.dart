import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/registration/controllers/store_category_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_template_controller.dart';
import 'package:farmitra/app/modules/registration/views/retailer_store_details_form.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custom_text_form_field.dart';
// import 'package:firstfind/app/modules/registration/controllers/store_details_form_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class StoreTemplateView extends StatelessWidget {
  StoreTemplateView({super.key});
  final StoreTemplateController storeTemplateController = Get.put(
    StoreTemplateController(),
  );
  final StoreCategoryController storeCategoryController = Get.put(
    StoreCategoryController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Store Profile & Cover',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: Get.back,
            child: Icon(Icons.close, color: AppColors.error),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Divider(thickness: 1, color: AppColors.border),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(100),
                                color:
                                    storeTemplateController
                                        .storeTemplate[storeTemplateController
                                            .selectedLogoIndex
                                            .value]
                                        .backgroundColor,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 62,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              storeTemplateController
                                                  .firstName
                                                  .value,
                                          style: GoogleFonts.montserrat(
                                            color:
                                                storeTemplateController
                                                    .storeTemplate[storeTemplateController
                                                        .selectedLogoIndex
                                                        .value]
                                                    .spanTextColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              storeTemplateController
                                                  .lastName
                                                  .value,
                                          style: GoogleFonts.montserrat(
                                            color:
                                                AppColors
                                                    .primaryGradinatMixColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Profile',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Obx(
                            () => Container(
                              height: 125,
                              // width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    storeTemplateController
                                        .storeTemplate[storeTemplateController
                                            .selectedBannerIndex
                                            .value]
                                        .bannerImage,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 15),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Obx(
                                      () => RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  storeTemplateController
                                                      .firstName
                                                      .value,
                                              style: GoogleFonts.montserrat(
                                                color:
                                                    storeTemplateController
                                                        .storeTemplate[storeTemplateController
                                                            .selectedBannerIndex
                                                            .value]
                                                        .spanTextColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  storeTemplateController
                                                      .lastName
                                                      .value,
                                              style: GoogleFonts.montserrat(
                                                color:
                                                    AppColors
                                                        .primaryGradinatMixColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Banner',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: AppColors.border,
                      indent: 10,
                    ),
                  ),
                  Text(
                    ' OR ',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: AppColors.border,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialogForUpdateName(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Edit Profile & Banner Name',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryGradinatMixColor,
                            color: AppColors.primaryGradinatMixColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Profile:',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: SizedBox(
                  height: 150, // Set a fixed height
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: storeTemplateController.storeTemplate.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          storeTemplateController.selectedLogoIndex(index);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundColor:
                                        storeTemplateController
                                            .storeTemplate[index]
                                            .backgroundColor,
                                    child: Obx(
                                      () => Align(
                                        alignment: Alignment.center,
                                        child: RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    storeTemplateController
                                                        .firstName
                                                        .value,
                                                style: GoogleFonts.montserrat(
                                                  color:
                                                      storeTemplateController
                                                          .storeTemplate[index]
                                                          .spanTextColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    storeTemplateController
                                                        .lastName
                                                        .value,
                                                style: GoogleFonts.montserrat(
                                                  color:
                                                      AppColors
                                                          .primaryGradinatMixColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                              Obx(() {
                                return storeTemplateController
                                            .selectedLogoIndex
                                            .value ==
                                        index
                                    ? Positioned(
                                      right: 10,
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.white,
                                        radius: 15,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                color:
                                                    AppColors
                                                        .primaryGradinatMixColor,
                                                width: 2,
                                              ),
                                            ),
                                            child: const CircleAvatar(
                                              backgroundColor: AppColors.white,
                                              child: Icon(
                                                Icons.check_sharp,
                                                color:
                                                    AppColors
                                                        .primaryGradinatMixColor,
                                                size: 15,
                                                weight: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    : SizedBox.shrink();
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Banner:',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: storeTemplateController.storeTemplate.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          storeTemplateController.selectedBannerIndex(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 180,
                                height: 150,
                                decoration: BoxDecoration(
                                  color:
                                      storeTemplateController
                                          .storeTemplate[index]
                                          .backgroundColor,
                                  // .backgroundColorList[index],
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      storeTemplateController
                                          .storeTemplate[index]
                                          .bannerImage,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 15),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Obx(
                                        () => RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    storeTemplateController
                                                        .firstName
                                                        .value,
                                                style: GoogleFonts.montserrat(
                                                  color:
                                                      storeTemplateController
                                                          .storeTemplate[index]
                                                          .spanTextColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    storeTemplateController
                                                        .lastName
                                                        .value,
                                                style: GoogleFonts.montserrat(
                                                  color:
                                                      AppColors
                                                          .primaryGradinatMixColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(() {
                                print(storeTemplateController.updateName.value);
                                return storeTemplateController
                                            .selectedBannerIndex
                                            .value ==
                                        index
                                    ? Positioned(
                                      right:
                                          -10, // Adjusted to make it appear outside the container
                                      top:
                                          -10, // Positioned above the container
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.white,
                                        radius: 15, // Adjusted the radius
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              border: Border.all(
                                                color:
                                                    AppColors
                                                        .primaryGradinatMixColor,
                                                width: 2,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              backgroundColor: AppColors.white,
                                              radius:
                                                  14, // Adjusted the inner radius
                                              child: Icon(
                                                Icons.check_sharp,
                                                color:
                                                    AppColors
                                                        .primaryGradinatMixColor,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    : SizedBox.shrink();
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: CustomGradientButton(
                text: "Save",
                onPressed: () {
                  if (storeTemplateController.storeTemplate.isNotEmpty) {
                    var selectedTemplate =
                        storeTemplateController
                            .storeTemplate[storeTemplateController
                            .selectedBannerIndex
                            .value];
                    print(
                      'Sending store template data: $selectedTemplate',
                    ); // Debugging

                    storeCategoryController.previousPageGridTitle == 'Expert' ||
                            storeCategoryController.previousPageGridTitle ==
                                'Rental' ||
                            storeCategoryController.previousPageGridTitle ==
                                'Drone'
                        ? Get.toNamed(
                          '/store_details_form',
                          arguments: selectedTemplate,
                        )
                        : Get.to(
                          () => RetailerStoreDetailsFrom(),
                          arguments: selectedTemplate,
                        );
                  } else {
                    print('Error: No store template selected');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showDialogForUpdateName(BuildContext context) {
  final StoreTemplateController storeTemplateController = Get.put(
    StoreTemplateController(),
  );
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: [
            Text(
              'Edit Profile & Banner Name',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryGradinatMixColor,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.close_sharp,
                color: AppColors.primaryGradinatMixColor,
              ),
            ),
          ],
        ),
        content: CustomTextFormField(
          hintText: '',
          keyboardType: TextInputType.text,
          controller: storeTemplateController.updateName,
          validator: (p0) {},
          onChanged: (value) {
            // Whenever the user types, update the controller value.
            storeTemplateController.updateName.text = value;
            storeTemplateController.extractName(
              storeTemplateController.updateName.text,
            );

            storeTemplateController
                .updateName
                .selection = TextSelection.fromPosition(
              TextPosition(
                offset: storeTemplateController.updateName.text.length,
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
            child: CustomGradientButton(
              text: 'Update',
              onPressed: () {
                if (storeTemplateController.updateName.text.isNotEmpty) {
                  storeTemplateController.extractName(
                    storeTemplateController.updateName.text,
                  );
                  Get.back();
                }
              },
            ),
            // Container(
            //   width: double.infinity,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     gradient: const LinearGradient(
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //       colors: [
            //         Color(0xffF27129),
            //         Color(0xffA3410A),
            //       ],
            //     ),
            //     borderRadius: BorderRadius.circular(25),
            //   ),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.transparent,
            //       elevation: 0,
            //     ),
            //     onPressed:
            //     child: Text(
            //       'Update',
            //       style: GoogleFonts.montserrat(
            //         fontSize: 14,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ],
      );
    },
  );
}
