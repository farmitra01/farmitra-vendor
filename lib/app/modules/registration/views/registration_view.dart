
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custome_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/svg.dart';
// import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  RegistrationView({super.key});

  final RegistrationController controller = Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        onHelpTap: () {
          Get.toNamed('/help-center');
        },
        onTranslateTap: () {
          Get.toNamed('/add');
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  FlutterCarousel(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      showIndicator: true,
                      slideIndicator: CircularSlideIndicator(
                        slideIndicatorOptions: SlideIndicatorOptions(
                          indicatorBackgroundColor: AppColors.secondary,
                          currentIndicatorColor:
                              AppColors.primaryGradinatMixColor,
                          enableAnimation: true,
                        ),
                      ),
                    ),
                    items: [
                      'assets/elephant.webp',
                      'assets/elephant.webp',
                      'assets/elephant.webp',
                    ].map(
                      (imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.border),
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          color: AppColors.lightGrey),
                      child: Text(
                        'How to register as vendor?',
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryFirstGradiant,
                    AppColors.primarySecondGradiant
                  ],
                ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                child: Text(
                  'Let’s get started:',
                  style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '    Steps to register-',
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondary),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () {
                      // Use Obx to rebuild the stepper when the currentStep changes
                      return Column(
                        children: [
                          for (int index = 0; index < 4; index++) ...[
                            _buildStep(index),
                            if (index < 3) _buildConnector(index),
                          ],
                        ],
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomGradientButton(
                text: 'Register Now!',
                onPressed: () {
                  Get.toNamed('/store-details');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildStep(int stepIndex) {
  final RegistrationController controller = Get.put(RegistrationController());

  return GestureDetector(
    onTap: () {
      // Use the controller to update the current step
      controller.setStep(stepIndex);
    },
    child: Container(
      // margin: EdgeInsets.symmetric(vertical: 0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: controller.currentStep.value == stepIndex
                  ? AppColors
                      .primaryGradinatMixColor // Background color when currentStep matches stepIndex
                  : Colors.transparent, // No background color otherwise
              border: Border.all(
                color: controller.currentStep.value == stepIndex
                    ? AppColors
                        .primaryGradinatMixColor // Border color when selected
                    : AppColors.secondary, // Grey border when not selected
                width: 2,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                controller.stepperContent[stepIndex].imagePath,
                color: controller.currentStep.value == stepIndex
                    ? AppColors.white
                    : AppColors.secondary,
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.stepperContent[stepIndex].title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: controller.currentStep.value == stepIndex
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: controller.currentStep.value == stepIndex
                        ? AppColors.primaryGradinatMixColor
                        : AppColors.secondary),
              ),
              SizedBox(height: 5),
              Text(
                controller.stepperContent[stepIndex].subtitle,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: controller.currentStep.value == stepIndex
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: AppColors.textSecondary),
              ),
              SizedBox(
                height: 10,
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
              //     onPressed: () {
              //       // Get.toNamed('/store-details');
              //     },
              //     child: Center(
              //       child: Row(
              //         children: [
              //           Icon(Icons.add),
              //           Text(
              //             'Add',
              //             style: GoogleFonts.montserrat(
              //               fontSize: 14,
              //               fontWeight: FontWeight.w600,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildConnector(int index) {
  final RegistrationController controller = Get.put(RegistrationController());

  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      margin: EdgeInsets.only(left: 20), // Adjust as needed
      width: 2,
      height: 20, // Adjust based on your design
      color: AppColors.secondary,
    ),
  );
}
