import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/data/models/store_category_model/store_template_model.dart';
import 'package:farmitra/app/data/models/store_select_model/store_select_model.dart';
import 'package:farmitra/app/modules/kyc_documents/views/rental_kyc.dart';
import 'package:farmitra/app/modules/registration/controllers/store_category_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_details_form_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_location_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_selected_module_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_template_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_dropdown.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custom_text_form_field.dart';
import 'package:farmitra/app/utils/global_widgets/custome_appBar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class StoreDetailsFormView extends GetView {
  StoreDetailsFormView({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final StoreLocationController storeLocationController = Get.put(
    StoreLocationController(),
  );
  final StoreDetailsFormController storeDetailsFormController = Get.put(
    StoreDetailsFormController(),
  );
  final StoreTemplateController storeTemplateController = Get.put(
    StoreTemplateController(),
  );
  final StoreCategoryController storeCategoryController = Get.put(
    StoreCategoryController(),
  );
  final StoreSelectedModuleController storeSelectModelController = Get.put(
    StoreSelectedModuleController(),
  );
  var previousPageGridTitle = Get.arguments;
  @override
  Widget build(BuildContext context) {
    List<int> selectedIndexes = [];
    final StoreTemplateModel? selectedTemplate =
        Get.arguments is StoreTemplateModel
            ? Get.arguments as StoreTemplateModel
            : null;
    // print('Received store template data: $selectedTemplate');
    print('store details page type $previousPageGridTitle ');
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        onHelpTap: () {
          Get.toNamed('/help-center');
        },
        onTranslateTap: () {
          Get.toNamed('/add');
        },
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  previousPageGridTitle == 'Rental'
                      ? 'Enter Rental Details'
                      : previousPageGridTitle == 'Drone'
                      ? 'Enter Store Drone'
                      : 'Enter Expert Details',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Profile Upload Section
                    Column(
                      children: [
                        Obx(() {
                          return GestureDetector(
                            onTap:
                                () => storeDetailsFormController.pickImage(
                                  'logo',
                                ),
                            child: DottedBorder(
                              color: AppColors.secondary,
                              strokeWidth: 1,
                              dashPattern: [6, 3],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(100),
                              child: Container(
                                height: 125,
                                width: 125,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    storeDetailsFormController
                                            .selectedLogoPath
                                            .value
                                            .isEmpty
                                        ? selectedTemplate != null
                                            ? Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  height: 125,
                                                  width: 125,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        selectedTemplate
                                                            .backgroundColor,
                                                  ),
                                                ),

                                                Positioned(
                                                  // bottom: 10,
                                                  child: Center(
                                                    child: RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Farmitra',
                                                            style: GoogleFonts.montserrat(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  selectedTemplate!
                                                                      .spanTextColor,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: 'Expert',
                                                            style: GoogleFonts.montserrat(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  AppColors
                                                                      .primaryGradinatMixColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                            : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/uploadicon.svg',
                                                  color: AppColors.secondary,
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  'Upload Profile',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  'JPEG, PNG less\n    than 3MB',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.secondary,
                                                  ),
                                                ),
                                              ],
                                            )
                                        : ClipOval(
                                          child: Image.file(
                                            File(
                                              storeDetailsFormController
                                                  .selectedLogoPath
                                                  .value,
                                            ),
                                            fit: BoxFit.cover,
                                            height: 125,
                                            width: 125,
                                          ),
                                        ),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 10),
                        Text(
                          'Upload your Profile\n       here (1:1)',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),

                    /// Banner Upload Section
                    Column(
                      children: [
                        Obx(() {
                          return GestureDetector(
                            onTap:
                                () => storeDetailsFormController.pickImage(
                                  'banner',
                                ),
                            child: DottedBorder(
                              color: AppColors.secondary,
                              strokeWidth: 1,
                              dashPattern: [6, 3],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              child: Container(
                                height: 125,
                                width: 180,
                                child:
                                    storeDetailsFormController
                                            .selectedBannerPath
                                            .value
                                            .isEmpty
                                        ? selectedTemplate != null
                                            ? Stack(
                                              children: [
                                                Image.asset(
                                                  selectedTemplate!.bannerImage,
                                                  fit: BoxFit.cover,
                                                  height: 125,
                                                  width: 180,
                                                ),
                                                Positioned(
                                                  top: 10,
                                                  left: 35,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Farmitra',
                                                          style: GoogleFonts.montserrat(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                selectedTemplate!
                                                                    .spanTextColor,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              storeCategoryController
                                                                          .previousPageGridTitle ==
                                                                      'Expert'
                                                                  ? 'Expert'
                                                                  : storeCategoryController
                                                                          .previousPageGridTitle ==
                                                                      'Rental'
                                                                  ? 'Rental'
                                                                  : storeCategoryController
                                                                          .previousPageGridTitle ==
                                                                      'Drone'
                                                                  ? 'Drone'
                                                                  : 'Retailer',
                                                          style: GoogleFonts.montserrat(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                AppColors
                                                                    .primaryGradinatMixColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                            : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/uploadicon.svg',
                                                  color: AppColors.secondary,
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  'Upload banner',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors.textPrimary,
                                                  ),
                                                ),
                                                Text(
                                                  'JPEG, PNG less than 5MB',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        AppColors.textSecondary,
                                                  ),
                                                ),
                                              ],
                                            )
                                        : Image.file(
                                          File(
                                            storeDetailsFormController
                                                .selectedBannerPath
                                                .value,
                                          ),
                                          fit: BoxFit.cover,
                                          height: 125,
                                          width: 180,
                                        ),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 10),
                        Text(
                          'Upload your banner\n      here (2:1)',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/store_template");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 30,
                        color: AppColors.primaryGradinatMixColor,
                      ),
                      Text(
                        " If you don't have Profile & banner\n Use Farmitra Templates",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryGradinatMixColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryGradinatMixColor,
                        ),
                      ),
                    ],
                  ),
                ),

                // SizedBox(height: 20),
                // previousPageGridTitle.trim() == 'Rental'
                //     ? Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         CustomDropdown<String>(
                //           hint: 'Choose Rental Services',
                //           items: storeDetailsFormController.rentalItemlist,
                //           selectedItem:
                //               storeDetailsFormController
                //                       .selectedRentalItem
                //                       .value
                //                       .isEmpty
                //                   ? null
                //                   : storeDetailsFormController
                //                       .selectedRentalItem
                //                       .value,
                //           onChanged: (value) {
                //             storeDetailsFormController
                //                 .updatedselectedRentalItem(value ?? '');
                //           },
                //           itemBuilder: (item) => item,
                //         ),
                //         SizedBox(height: 10),
                //         CustomTextFormField(
                //           hintText: 'Other',
                //           keyboardType: TextInputType.text,
                //           controller: storeDetailsFormController.other,
                //           validator: (value) {
                //             if (value == null || value.isEmpty) {
                //               return 'Please enter name';
                //             }
                //             return null;
                //           },
                //         ),
                //       ],
                //     )
                //     : SizedBox.shrink(),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: ' Name ',
                  keyboardType: TextInputType.text,
                  controller: storeDetailsFormController.storeName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                //  Obx(
                //     () => CustomDropdown<String>(
                //       hint: 'Store Channel',
                //       items:
                //           retailerStoreDetailsFormController
                //               .storeChannelList, // Keep it as List<String>
                //       selectedItem:
                //           retailerStoreDetailsFormController
                //                   .selectedItem
                //                   .value
                //                   .isEmpty
                //               ? null
                //               : retailerStoreDetailsFormController
                //                   .selectedItem
                //                   .value,
                //       onChanged: (value) {
                //         retailerStoreDetailsFormController.updatedSelectedValue(
                //           value ?? '',
                //         );
                //       },
                //       itemBuilder: (item) => item, // Correct item mapping
                //     ),
                //   ),
                CustomTextFormField(
                  hintText: 'WhatsApp number',
                  keyboardType: TextInputType.number,
                  controller: storeDetailsFormController.whatsAppNumber,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null; // Field is optional, so empty is valid
                    }
                    if (value.length < 10) {
                      return "Please enter a 10-digit WhatsApp number";
                    }
                    return null; // Valid input
                  },
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: ' Location',
                  keyboardType: TextInputType.text,
                  controller: storeLocationController.combinedController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Location";
                    }
                    return null;
                  },
                  suffixIcon: Icons.location_on_sharp,
                  onSuffixIconTap: () {
                    Get.toNamed('/store_location');
                  },
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: ' Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: storeDetailsFormController.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' Enter Expert Email';
                    } else if (!RegExp(
                      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
                    ).hasMatch(value)) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<String>(
                        activeColor: AppColors.primaryGradinatMixColor,
                        value: 'Male',
                        groupValue:
                            storeDetailsFormController.selectedGender.value,
                        onChanged:
                            (value) =>
                                storeDetailsFormController.changeGender(value!),
                      ),
                      Text('Male'),
                      SizedBox(width: 20),
                      Radio<String>(
                        activeColor: AppColors.primaryGradinatMixColor,
                        value: 'Female',
                        groupValue:
                            storeDetailsFormController.selectedGender.value,
                        onChanged:
                            (value) =>
                                storeDetailsFormController.changeGender(value!),
                      ),
                      Text('Female'),
                      SizedBox(width: 20),
                      Radio<String>(
                        activeColor: AppColors.primaryGradinatMixColor,
                        value: 'Other',
                        groupValue:
                            storeDetailsFormController.selectedGender.value,
                        onChanged:
                            (value) =>
                                storeDetailsFormController.changeGender(value!),
                      ),
                      Text('Other'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText:
                      storeCategoryController.previousPageGridTitle == 'Expert'
                          ? 'About Expert'
                          : storeCategoryController.previousPageGridTitle ==
                              'Rental'
                          ? 'About Rental Item'
                          : 'About Drone',
                  borderRadius: 10,
                  keyboardType: TextInputType.text,
                  controller: storeDetailsFormController.About,
                  maxLines: 3,
                  validator: (p0) {},
                  // (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please Enter About Rental Item';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Language Spoken'),
                    Icon(Icons.arrow_forward_ios_outlined, size: 15),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: storeDetailsFormController.languages.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap:
                            () => storeDetailsFormController.toggleSelection(
                              index,
                            ),
                        child: Obx(() {
                          bool isSelected = storeDetailsFormController
                              .isSelected(index);
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? AppColors.primaryGradinatMixColor
                                      : Colors.transparent,
                              border: Border.all(
                                color:
                                    isSelected
                                        ? Colors.transparent
                                        : AppColors.border,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              storeDetailsFormController.languages[index],
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,

                                color:
                                    isSelected
                                        ? AppColors.white
                                        : AppColors.textPrimary,
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: CustomGradientButton(
                text: 'Next',
                onPressed: () {
                  if (formkey.currentState!.validate()
                  //  &&
                  //     storeDetailsFormController.validateForm()
                  ) {
                    // If both form fields and image validation pass, close the form or proceed
                    storeCategoryController.previousPageGridTitle == 'Rental' ||
                            storeCategoryController.previousPageGridTitle ==
                                'Drone'
                        ? Get.to(
                          () => RentalKyc(),
                          arguments:
                              storeCategoryController.previousPageGridTitle,
                        )
                        : Get.toNamed(
                          '/kyc-documents',
                          arguments:
                              storeCategoryController.previousPageGridTitle,
                        );
                  } else {
                    // If either form or image validation fails, show error
                    Get.snackbar(
                      'Notice',
                      "All fileds are required & mandatory ",
                      backgroundColor: AppColors.appBarColor,
                      colorText: AppColors.white,
                    );
                  }
                },
              ),
            ),
            GestureDetector(
              // onTap: () {
              //   previousPageGridTitle == 'Rental' ||
              //           previousPageGridTitle == 'Drone'
              //       ? Get.to(() => RentalKyc())
              //       : Get.toNamed(
              //         '/kyc-documents',
              //         arguments: previousPageGridTitle,
              //       );
              // },
              child: Text(
                "You Can’t Skip this step",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGradinatMixColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
