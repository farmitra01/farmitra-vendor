import 'dart:math';

import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/registration/controllers/store_location_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreLocationView extends GetView {
  StoreLocationView({super.key});
  final StoreLocationController storeLocationController = Get.put(
    StoreLocationController(),
  );
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Store Location',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.close, color: Color(0xffDB5050)),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(thickness: 1, color: Color(0xffDADADA)),
                SizedBox(height: 15),
                Text(
                  'Locate on map:',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffDADADA)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryGradinatMixColor
                                    .withOpacity(0.15),
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
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/store_location_search');
                          },
                          child: Container(
                            height: 40,
                            width: 155,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 0,
                            ),
                            margin: EdgeInsets.only(left: 10, top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white70,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SvgPicture.asset(
                                    'assets/svgs/location.svg',
                                    fit: BoxFit.fitWidth,
                                    color: AppColors.primaryGradinatMixColor,
                                    height: 30,
                                  ),
                                ),
                                Text(
                                  'Edit map location',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryGradinatMixColor,
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primaryFirstGradiant,
                            AppColors.primarySecondGradiant,
                          ],
                        ),
                      ),
                      child: SizedBox(
                        child: SvgPicture.asset(
                          'assets/icons/registration_stepper_icons/store.svg',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '- Noida, Uttar Pradesh',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff636363),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.5, color: Color(0xffDADADA)),
                    ),
                    Text(
                      ' & ',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff636363),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 0.5, color: Color(0xffDADADA)),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'Enter complete address:',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                // TextFormField(
                //   controller: storeLocationController.address,
                //   decoration: InputDecoration(
                //     hintText: "Address",
                //     hintStyle: TextStyle(
                //       color: Color(0xff636363),
                //       fontSize: 14,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(
                //         color: Color(0xffF27129),
                //       ),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(
                //         color: Color(0xffDADADA),
                //       ),
                //     ),
                //     focusedErrorBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(25),
                //         borderSide: BorderSide(color: Colors.red)),
                //     errorBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(25),
                //         borderSide: BorderSide(color: Colors.red)),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please Enter Store Name';
                //     }
                //     return null;
                //   },
                //   inputFormatters: [LengthLimitingTextInputFormatter(35)],
                // ),
                CustomTextFormField(
                  hintText: "Address",
                  keyboardType: TextInputType.text,
                  controller: storeLocationController.address,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Store Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                // TextFormField(
                //   controller: storeLocationController.floor,
                //   decoration: InputDecoration(
                //     hintText: "Floor",
                //     hintStyle: TextStyle(
                //       color: Color(0xff636363),
                //       fontSize: 14,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(color: Color(0xffF27129)),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(color: Color(0xffDADADA)),
                //     ),
                //     focusedErrorBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(color: Colors.red),
                //     ),
                //     errorBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(color: Colors.red),
                //     ),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please Enter Store Name';
                //     }
                //     return null;
                //   },
                //   inputFormatters: [LengthLimitingTextInputFormatter(35)],
                // ),
                CustomTextFormField(
                  hintText: "Floor",
                  keyboardType: TextInputType.text,
                  controller: storeLocationController.floor,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Store Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                CustomTextFormField(
                  hintText: "Pin Code",
                  keyboardType: TextInputType.number,
                  controller: storeLocationController.pincode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Six Digit Pincode';
                    } else if (value.length != 6) {
                      return 'Please Enter Six Digit Pincode ';
                    }
                    return null;
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                // TextFormField(
                //   controller: storeLocationController.pincode,
                //   decoration: InputDecoration(
                //     hintText: "Pin Code",
                //     hintStyle: TextStyle(
                //       color: AppColors.textSecondary,
                //       fontSize: 14,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(
                //         color: AppColors.primaryGradinatMixColor,
                //       ),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(color: AppColors.border),
                //     ),
                //     focusedErrorBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(color: AppColors.error),
                //     ),
                //     errorBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //       borderSide: BorderSide(color: AppColors.error),
                //     ),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please Enter Six Digit Pincode';
                //     } else if (value.length != 6) {
                //       return 'Please Enter Six Digit Pincode ';
                //     }
                //     return null;
                //   },
                //   keyboardType: TextInputType.number,
                //   inputFormatters: [
                //     LengthLimitingTextInputFormatter(6),
                //     FilteringTextInputFormatter.digitsOnly,
                //   ],
                // ),
                SizedBox(height: 15),
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
                text: 'Save',
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Get.back();
                    storeLocationController.CombinController();
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
