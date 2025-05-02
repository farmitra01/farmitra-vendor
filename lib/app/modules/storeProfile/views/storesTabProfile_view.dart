import 'dart:ffi';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/storeProfile/controllers/storeTabProfile_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custom_text_form_field.dart';
import 'package:farmitra/app/utils/global_widgets/gradiant_svgIcons.dart';
import 'package:farmitra/app/utils/global_widgets/gradiant_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoresTabProfileView extends GetView {
  StoresTabProfileView({super.key});
  final StoresTabProfileController storesTabProfileController =
      Get.put(StoresTabProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Store Information:',
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'GST Number',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    '22AAAAA0000A1Z5',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Phone',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary),
                  ),
                  Text(
                    '+91 87234 04233',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Location',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    'Noida, Uttar Pradesh',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary),
                  ),
                  Text(
                    'teststore@firstfind.com',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Website',
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary),
                  ),
                  Text(
                    'www.jpprovisionalstore.in',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryGradinatMixColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryGradinatMixColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: AppColors.border,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // height: 120,
                    // width: 90,
                    // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFFE7E7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GradientSvgIcon(
                            icon: Icon(Icons.diamond_outlined),
                            size: 25,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.primaryFirstGradiant,
                                AppColors.primarySecondGradiant,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Retailer',
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Nature ',
                            style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/Edit.svg',
                                height: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Edit',
                                style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textSecondary),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // height: 120,
                    // width: 90,
                    // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffE8F4FF),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GradientSvgIcon(
                            icon: Icon(Icons.store_outlined),
                            size: 25,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.primaryFirstGradiant,
                                AppColors.primarySecondGradiant,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'F Mart  ',
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Module ',
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/Edit.svg',
                                height: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Edit',
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // height: 120,
                    // width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFDF8DD),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        children: [
                          GradientSvgIcon(
                            icon: Icon(Icons.add_business_outlined),
                            size: 25,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.primaryFirstGradiant,
                                AppColors.primarySecondGradiant,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Grocery',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Category',
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/svgs/Edit.svg',
                                height: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Edit',
                                style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: AppColors.border,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  // Logo Upload
                  GestureDetector(
                    onTap: () {
                      storesTabProfileController.pickImage('logo');
                    },
                    child: Obx(() {
                      return DottedBorder(
                        dashPattern: [2.5, 5],
                        borderType: BorderType.RRect,
                        color: AppColors.border,
                        radius: Radius.circular(10),
                        child: Container(
                          height: 125,
                          width: 125,
                          child: storesTabProfileController
                                  .selectedLogoPath.value.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/svgs/uploadicon.svg'),
                                    SizedBox(height: 5),
                                    Text(
                                      'Upload Logo',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      textAlign: TextAlign.center,
                                      'JPEG, PNG, less than 3 MB',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(storesTabProfileController
                                        .selectedLogoPath.value),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(width: 15),
                  // Banner Upload
                  GestureDetector(
                    onTap: () {
                      storesTabProfileController.pickImage('banner');
                    },
                    child: Obx(() {
                      return DottedBorder(
                        dashPattern: [2.5, 5],
                        borderType: BorderType.RRect,
                        color: AppColors.border,
                        radius: Radius.circular(10),
                        child: Container(
                          height: 125,
                          width: 175,
                          child: storesTabProfileController
                                  .selectedBannerPath.value.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/svgs/uploadicon.svg'),
                                    SizedBox(height: 5),
                                    Text(
                                      'Upload Banner',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'JPEG, PNG, less than 5 MB',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(storesTabProfileController
                                        .selectedBannerPath.value),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientSvgIcon(
                    icon: Icon(Icons.star_rounded),
                    size: 15,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primaryFirstGradiant,
                        AppColors.primarySecondGradiant
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  GradientText(
                    text: 'Use First Find Templates',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryGradinatMixColor,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primaryFirstGradiant,
                        AppColors.primarySecondGradiant
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Store Name',
                keyboardType: TextInputType.text,
                inputFormatters: [],
                controller: storesTabProfileController.storeName,
                validator: (p0) {},
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Store WhatsApp NO.',
                keyboardType: TextInputType.text,
                inputFormatters: [],
                controller: storesTabProfileController.whatsAppNo,
                validator: (p0) {},
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Email',
                keyboardType: TextInputType.text,
                inputFormatters: [],
                controller: storesTabProfileController.email,
                validator: (p0) {},
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Complite address',
                keyboardType: TextInputType.text,
                inputFormatters: [],
                controller: storesTabProfileController.completeAddress,
                validator: (p0) {},
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Floor',
                keyboardType: TextInputType.text,
                inputFormatters: [],
                controller: storesTabProfileController.floor,
                validator: (p0) {},
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Pin Code',
                keyboardType: TextInputType.text,
                inputFormatters: [],
                controller: storesTabProfileController.pinCode,
                validator: (p0) {},
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Website link(if any)',
                keyboardType: TextInputType.text,
                inputFormatters: [],
                controller: storesTabProfileController.floor,
                validator: (p0) {},
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: AppColors.border,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Banner Images:',
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                'Upload Images for your profile banner.',
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 135,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10), // Apply border radius to image
                          child: Image.asset(
                            storesTabProfileController
                                .gridImage[0], // Display the first image
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4, // We have 4 images left
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.border),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10), // Apply border radius to image
                            child: Image.asset(
                              storesTabProfileController.gridImage[
                                  index + 1], // Display the next four images
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomGradientButton(
                  text: '+ Edit Banner Images', onPressed: () {}),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: AppColors.border,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Business KYC:',
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                'Documents uploaded for KYC',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'Shop & E-License Certificate-',
                          style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppColors.border,
                            ),
                          ),
                          child: Row(
                            children: [
                              DottedBorder(
                                borderType: BorderType.RRect,
                                color: AppColors.border,
                                child: Container(
                                  height: 100,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/kyc/pan-card.webp'),
                                        fit: BoxFit.fill,
                                        opacity: 0.2),
                                  ),
                                  child: Center(
                                    child: Container(
                                        color: AppColors.background,
                                        child: SizedBox(
                                          height: 15,
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('For KYC'),
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shoplicense.pdf',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'ID: 201 103 XXX X',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Uploaded on: 2024, March 24',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: AppColors.lightBlue,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.check_circle_outline_outlined,
                                            color: AppColors.lightskyBlue,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Approved ',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.lightskyBlue,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ]);
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomGradientButton(
                text: '+ Add New Document',
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GradientText(
                  text: 'Contact for help!',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primaryFirstGradiant,
                      AppColors.primarySecondGradiant
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: AppColors.border,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Store photos:',
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Take or upload clear photos of your store or shop.',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          storesTabProfileController.pickImage('inside');
                        },
                        child: Obx(
                          () {
                            return DottedBorder(
                              dashPattern: [2.5, 5],
                              borderType: BorderType.RRect,
                              color: AppColors.border,
                              radius: Radius.circular(10),
                              child: Container(
                                height: 120,
                                width: 135,
                                child: storesTabProfileController
                                        .inside.value.isEmpty
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/svgs/uploadicon.svg'),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Upload Logo',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            'JPEG,PNG,less then 3 MB',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          File(storesTabProfileController
                                              .inside.value),
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Inside',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Obx(() {
                        return GestureDetector(
                          onTap: () {
                            storesTabProfileController.pickImage('outside');
                          },
                          child: DottedBorder(
                            dashPattern: [2.5, 5],
                            borderType: BorderType.RRect,
                            color: AppColors.border,
                            radius: Radius.circular(10),
                            child: Container(
                                height: 120,
                                width: 135,
                                child: storesTabProfileController
                                        .outside.value.isEmpty
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/svgs/uploadicon.svg',
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Upload Logo',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            'JPEG,PNG,less then 5 MB',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          File(storesTabProfileController
                                              .outside.value),
                                        ),
                                      )),
                          ),
                        );
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Outside',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: AppColors.border,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Delivery Details:',
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Free Delivery Radius(Km)',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                hintText: "Radius",
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(5),
                ],
                controller: storesTabProfileController.redius,
                validator: (p0) {},
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: "Minimum Order Value(MOV)(₹)",
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(5),
                ],
                controller: storesTabProfileController.minOrderValue,
                validator: (p0) {},
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Define Scheduled Delivery Charges:',
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Set delivery charges based on the distance range(Kms)',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'No Range Available ',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    TextSpan(
                      text: '+ Add Now',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryGradinatMixColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Support Express Delivery',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Additional ₹40 will be charged',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => Switch(
                      value:
                          storesTabProfileController.isAddtionalCharges.value,
                      onChanged: (value) {
                        storesTabProfileController.isAddtionalCharges.value =
                            value;
                      },
                      // activeColor: Color(0xffF27129),
                      activeTrackColor: AppColors.primaryGradinatMixColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: AppColors.border,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Delivery Slots:',
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Available for service for this duration',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'No Slots Available  ',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    TextSpan(
                      text: '+ Add Slots',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryGradinatMixColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: AppColors.border,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Gift / Wrapping Price:',
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Your delivery charges for send product as gift.',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Amount:'),
              CustomTextFormField(
                hintText: '₹',
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(5)],
                controller: storesTabProfileController.giftWrapAmmount,
                validator: (p0) {},
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: AppColors.border,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Serving Hours:',
                style: GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Available for service for this duration',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Start Time:'),
                        CustomTextFormField(
                          hintText: '00:00 Hrs',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5)
                          ],
                          controller: storesTabProfileController.startTime,
                          validator: (p0) {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('End Time:'),
                        CustomTextFormField(
                          hintText: '00:00 Hrs',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5),
                          ],
                          controller: storesTabProfileController.endTime,
                          validator: (p0) {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: AppColors.border,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Account Status'),
                        SizedBox(height: 5),
                        GradientText(
                          text: "FF FREEMIUM",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w800),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xffFD4044),
                              Color(0xff800002),
                              Color(0xff08094B),
                            ],
                          ),
                        ),
                        Text(
                          'Valid till August 20, 2024',
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: CustomGradientButton(
                        text: "Go Premium",
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildImageWidget(String imagePath) {
  File imageFile = File(imagePath);
  if (imageFile.existsSync()) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.file(imageFile, fit: BoxFit.cover),
    );
  } else {
    return Center(
      child: Text(
        "Image not found",
        style: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.error,
        ),
      ),
    );
  }
}
