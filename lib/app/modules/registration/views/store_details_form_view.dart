import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/data/models/store_category_model/store_template_model.dart';
import 'package:farmitra/app/modules/kyc_documents/views/rental_kyc.dart';
import 'package:farmitra/app/modules/registration/controllers/store_category_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_details_form_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_location_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_dropdown.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custom_text_form_field.dart';
import 'package:farmitra/app/utils/global_widgets/custome_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreDetailsFormView extends StatelessWidget {
  const StoreDetailsFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final StoreLocationController storeLocationController = Get.put(
      StoreLocationController(),
    );
    final StoreDetailsFormController storeDetailsFormController = Get.put(
      StoreDetailsFormController(),
    );
    final StoreCategoryController storeCategoryController = Get.put(
      StoreCategoryController(),
    );

    final arguments = Get.arguments ?? {};
    print('StoreDetailsFormView: Arguments received: $arguments');

    final String? logoImagePath = arguments['logoImage'] as String?;
    final String? bannerImagePath = arguments['bannerImage'] as String?;
    final StoreTemplateModel? logoTemplate =
        arguments['logoTemplate'] as StoreTemplateModel?;
    final StoreTemplateModel? bannerTemplate =
        arguments['bannerTemplate'] as StoreTemplateModel?;
    final String firstName = arguments['firstName'] as String? ?? 'Farmitra';
    final String lastName =
        arguments['lastName'] as String? ??
        storeCategoryController.previousPageGridTitle ??
        'Expert';

    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        onHelpTap: () => Get.toNamed('/help-center'),
        onTranslateTap: () => Get.toNamed('/add'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeCategoryController.previousPageGridTitle == 'Rental'
                      ? 'Enter Rental Details'
                      : storeCategoryController.previousPageGridTitle == 'Drone'
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
                    Column(
                      children: [
                        Obx(() {
                          return GestureDetector(
                            onTap:
                                () => Get.toNamed(
                                  '/store_template',
                                  arguments: {
                                    'imageType': 'logo',
                                    'firstName': firstName,
                                    'lastName': lastName,
                                    'category': arguments['category'],
                                    'savedIndexes':
                                        storeDetailsFormController
                                            .selectedIndexes
                                            .toList(),
                                  },
                                ),
                            child: DottedBorder(
                              color: AppColors.secondary,

                              strokeWidth: 1,
                              dashPattern: const [6, 3],
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
                                            .isNotEmpty
                                        ? ClipOval(
                                          child: Image.file(
                                            File(
                                              storeDetailsFormController
                                                  .selectedLogoPath
                                                  .value,
                                            ),
                                            fit: BoxFit.cover,
                                            height: 125,
                                            width: 125,
                                            errorBuilder: (
                                              context,
                                              error,
                                              stackTrace,
                                            ) {
                                              print(
                                                'StoreDetailsFormView: Error loading logo image: $error',
                                              );
                                              return ClipOval(
                                                child: Image.asset(
                                                  'assets/images/Null_ticket.png',
                                                  fit: BoxFit.cover,
                                                  height: 125,
                                                  width: 125,
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                        : logoTemplate != null
                                        ? Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 125,
                                              width: 125,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    logoTemplate
                                                        .backgroundColor,
                                              ),
                                              child: Image.network(
                                                logoTemplate.bannerImage,
                                                fit: BoxFit.cover,
                                                height: 125,
                                                width: 125,
                                                loadingBuilder: (
                                                  context,
                                                  child,
                                                  loadingProgress,
                                                ) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return const CircularProgressIndicator();
                                                },
                                                errorBuilder: (
                                                  context,
                                                  error,
                                                  stackTrace,
                                                ) {
                                                  print(
                                                    'StoreDetailsFormView: Error loading logo template: $error',
                                                  );
                                                  return ClipOval(
                                                    child: Image.asset(
                                                      'assets/images/Null_ticket.png',
                                                      fit: BoxFit.cover,
                                                      height: 125,
                                                      width: 125,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Positioned(
                                              child: Center(
                                                child: RichText(
                                                  textAlign: TextAlign.center,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: firstName,
                                                        style: GoogleFonts.montserrat(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              logoTemplate
                                                                  .spanTextColor,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: lastName,
                                                        style: GoogleFonts.montserrat(
                                                          fontSize: 14,
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
                                            ),
                                          ],
                                        )
                                        : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                color: AppColors.textPrimary,
                                              ),
                                            ),
                                            Text(
                                              'JPEG, PNG less than 5MB',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300,
                                                color: AppColors.textSecondary,
                                              ),
                                            ),
                                          ],
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
                    Column(
                      children: [
                        Obx(() {
                          return GestureDetector(
                            onTap:
                                () => Get.toNamed(
                                  '/store_template',
                                  arguments: {
                                    'imageType': 'banner',
                                    'firstName': firstName,
                                    'lastName': lastName,
                                    'category': arguments['category'],
                                    'savedIndexes':
                                        storeDetailsFormController
                                            .selectedIndexes
                                            .toList(),
                                  },
                                ),
                            child: DottedBorder(
                              color: AppColors.secondary,
                              strokeWidth: 1,
                              dashPattern: const [6, 3],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              child: Container(
                                height: 125,
                                width: 180,
                                child:
                                    storeDetailsFormController
                                            .selectedBannerPath
                                            .value
                                            .isNotEmpty
                                        ? Image.file(
                                          File(
                                            storeDetailsFormController
                                                .selectedBannerPath
                                                .value,
                                          ),
                                          fit: BoxFit.fill,
                                          height: 125,
                                          width: 180,
                                          errorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            print(
                                              'StoreDetailsFormView: Error loading banner image: $error',
                                            );
                                            return Image.asset(
                                              'assets/images/Null_ticket.png',
                                              fit: BoxFit.fill,
                                              height: 125,
                                              width: 180,
                                            );
                                          },
                                        )
                                        : bannerTemplate != null
                                        ? Stack(
                                          children: [
                                            Image.network(
                                              bannerTemplate.bannerImage,
                                              fit: BoxFit.fill,
                                              height: 125,
                                              width: 180,
                                              loadingBuilder: (
                                                context,
                                                child,
                                                loadingProgress,
                                              ) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                              errorBuilder: (
                                                context,
                                                error,
                                                stackTrace,
                                              ) {
                                                print(
                                                  'StoreDetailsFormView: Error loading banner template: $error',
                                                );
                                                return Image.asset(
                                                  'assets/images/Null_ticket.png',
                                                  fit: BoxFit.fill,
                                                  height: 125,
                                                  width: 180,
                                                );
                                              },
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 35,
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: firstName,
                                                      style: GoogleFonts.montserrat(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            bannerTemplate
                                                                .spanTextColor,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: lastName,
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
                                                color: AppColors.textPrimary,
                                              ),
                                            ),
                                            Text(
                                              'JPEG, PNG less than 5MB',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300,
                                                color: AppColors.textSecondary,
                                              ),
                                            ),
                                          ],
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
                // GestureDetector(
                //   onTap:
                //       () => Get.toNamed(
                //         "/store_template",
                //         arguments: {
                //           'firstName': firstName,
                //           'lastName': lastName,
                //           'category': arguments['category'],
                //           'savedIndexes':
                //               storeDetailsFormController.selectedIndexes
                //                   .toList(),
                //         },
                //       ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(
                //         Icons.star,
                //         size: 30,
                //         color: AppColors.primaryGradinatMixColor,
                //       ),
                //       Text(
                //         " If you don't have Profile & banner\n Use Farmitra Templates",
                //         style: GoogleFonts.montserrat(
                //           fontSize: 12,
                //           fontWeight: FontWeight.w500,
                //           color: AppColors.primaryGradinatMixColor,
                //           decoration: TextDecoration.underline,
                //           decorationColor: AppColors.primaryGradinatMixColor,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 10),
                // const SizedBox(height: 10),
                storeCategoryController.previousPageGridTitle.trim() == 'Rental'
                    ? Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDropdown<String >(
                            hint: 'Choose Rental Services',
                            items: storeDetailsFormController.rentalItemList,
                            selectedItem:
                                storeDetailsFormController
                                        .selectedRentalItem
                                        .value
                                        .isEmpty
                                    ? null
                                    : storeDetailsFormController
                                        .selectedRentalItem
                                        .value,
                            onChanged: (value) {
                              storeDetailsFormController
                                  .updateSelectedRentalItem(value ?? '');
                            },
                            itemBuilder: (item) => item,
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            hintText: 'Other',
                            keyboardType: TextInputType.text,
                            controller: storeDetailsFormController.other,
                            validator: (value) {
                              if (storeDetailsFormController
                                          .selectedRentalItem
                                          .value ==
                                      'Others' &&
                                  (value == null || value.isEmpty)) {
                                return 'Please specify other rental item';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    )
                    : const SizedBox.shrink(),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Name',
                  keyboardType: TextInputType.text,
                  controller: storeDetailsFormController.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'WhatsApp number',
                  keyboardType: TextInputType.number,
                  controller: storeDetailsFormController.whatsAppNumber,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null; // Optional field
                    }
                    if (value.length < 10) {
                      return 'Please enter a 10-digit WhatsApp number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Location',
                  keyboardType: TextInputType.text,
                  controller: storeLocationController.combinedController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Location';
                    }
                    return null;
                  },
                  suffixIcon: Icons.location_on_sharp,
                  onSuffixIconTap: () => Get.toNamed('/store_location'),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: storeDetailsFormController.email,
                  validator:
                      (value) =>
                          storeDetailsFormController.validateEmail(value),
                ),
                const SizedBox(height: 10),
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
                      const Text('Male'),
                      const SizedBox(width: 20),
                      Radio<String>(
                        activeColor: AppColors.primaryGradinatMixColor,
                        value: 'Female',
                        groupValue:
                            storeDetailsFormController.selectedGender.value,
                        onChanged:
                            (value) =>
                                storeDetailsFormController.changeGender(value!),
                      ),
                      const Text('Female'),
                      const SizedBox(width: 20),
                      Radio<String>(
                        activeColor: AppColors.primaryGradinatMixColor,
                        value: 'Other',
                        groupValue:
                            storeDetailsFormController.selectedGender.value,
                        onChanged:
                            (value) =>
                                storeDetailsFormController.changeGender(value!),
                      ),
                      const Text('Other'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                  controller: storeDetailsFormController.about,
                  maxLines: 3,
                  validator: (value) => null, // Optional field
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text('Language Spoken'),
                    const Icon(Icons.arrow_forward_ios_outlined, size: 15),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: storeDetailsFormController.languages.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        bool isSelected = storeDetailsFormController.isSelected(
                          index,
                        );
                        return GestureDetector(
                          onTap: () {
                            print('ListView.builder: Tapped index $index');
                            storeDetailsFormController.toggleSelection(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            margin: const EdgeInsets.symmetric(
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
                          ),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomGradientButton(
                text: 'Next',
                onPressed: () {
                  // bool isDropdownValid =
                  //     storeDetailsFormController.validateDropdown();
                  bool isRentalDropdownValid =
                      storeCategoryController.previousPageGridTitle == 'Rental'
                          ? storeDetailsFormController.validateRentalDropdown()
                          : true;
                  if (formKey.currentState!.validate() &&
                      // isDropdownValid &&
                      isRentalDropdownValid) {
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
                    Get.snackbar(
                      'Notice',
                      'All required fields must be filled',
                      backgroundColor: AppColors.appBarColor,
                      colorText: AppColors.white,
                    );
                  }
                },
              ),
              const SizedBox(height: 5),
              // GestureDetector(
              //   child: Text(
              //     "You Can’t Skip this step",
              //     style: GoogleFonts.montserrat(
              //       fontSize: 14,
              //       fontWeight: FontWeight.w500,
              //       color: AppColors.primaryGradinatMixColor,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
