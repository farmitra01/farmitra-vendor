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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Ensure controller is initialized only once using Get.find or Get.put
    final LoginController loginController = Get.put(
      LoginController(),
      permanent: true,
    );

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
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            children: [
              const SizedBox(height: 100),
              SvgPicture.asset(
                'assets/svgs/farmitra.svg',
                height: 100,
                width: 250,
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              CustomTextFormField(
                prefixIcon: const Icon(
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
                onPressed: () async {
                  try {
                    // Validate the form
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    String? mobileNumber = loginController.mobileNumber.text;

                    // Show loading indicator
                    Get.dialog(
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryGradinatMixColor,
                        ),
                      ),
                      barrierDismissible: false,
                    );
                    // Check internet connection
                    await loginController.checkInternetConnectivity();
                    if (!loginController.isInternetConnected.value) {
                      Get.back(); // Close loading dialog
                      Get.snackbar(
                        'No Internet',
                        'Please enable internet and try again.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppColors.error,
                        colorText: AppColors.white,
                        duration: const Duration(seconds: 3),
                      );
                      return;
                    }
                    // Call login function
                    await loginController.login();
                    // Navigate to OTP screen
                    Get.back(); // Close loading dialog
                    Get.toNamed('/otp', arguments: mobileNumber);
                  } catch (e) {
                    Get.back(); // Ensure loading dialog is closed
                    Get.snackbar(
                      'Error',
                      'An unexpected error occurred. Please try again.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.error,
                      colorText: AppColors.white,
                      duration: const Duration(seconds: 3),
                    );
                    debugPrint('Error in Get OTP: $e');
                  }
                },
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'By Signing up or Login, you agree to our ',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n    Terms of Services',
                      style: const TextStyle(
                        color: AppColors.primaryGradinatMixColor,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => TermsCondition());
                            },
                    ),
                    const TextSpan(
                      text: ' and ',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(
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
    );
  }
}
