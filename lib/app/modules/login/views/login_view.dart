import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/login/views/privacy_policy.dart';
import 'package:farmitra/app/modules/login/views/terms_condition.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custom_text_form_field.dart';
import 'package:farmitra/app/utils/global_widgets/custome_appBar.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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

      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              children: [
                SizedBox(height: 100),

                SvgPicture.asset(
                  'assets/svgs/farmitra.svg',
                  height: 100,
                  width: 250,
                ),
                SizedBox(height: 20),

                Center(
                  child: Text(
                    'Enter mobile number or vendor ID to continue',
                    style: GoogleFonts.montserrat(
                      color: AppColors.secondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.call_outlined,
                    color: AppColors.secondary,
                  ),
                  hintText: 'Mobile Number',
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 10,
                  controller: loginController.mobileNumber,
                  validator: loginController.validateMobileNumber,
                ),
                const SizedBox(height: 15),
                CustomGradientButton(
                  text: 'Get OTP',
                  onPressed: () {
                    String? mobileNumber = loginController.mobileNumber.text;
                    print(mobileNumber);
                    // Validate the mobile number using the validation function
                    String? validationResult = loginController
                        .validateMobileNumber(mobileNumber);

                    if (validationResult == null) {
                      // If the validation passes (returns null), navigate to the OTP screen
                      Get.toNamed('/otp', arguments: mobileNumber);
                    } else {
                      Get.snackbar(
                        'Invalid Input',
                        validationResult,
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: AppColors.primaryGradinatMixColor,
                        colorText: AppColors.white,
                      );
                    }
                  },
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'By Signing up or Login, you agree to our ',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n    Terms of Services',
                        style: TextStyle(
                          color: AppColors.primaryGradinatMixColor,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => TermsCondition());
                              },
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: AppColors.primaryGradinatMixColor,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => PrivacyPolicy());
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
