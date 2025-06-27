import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/login/controllers/otp_controller.dart';
import 'package:farmitra/app/utils/global_widgets/gradiant_outlined_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpView extends GetView {
  final String mobileNumber;

  OtpView({super.key, required this.mobileNumber});
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final receivedNumber = Get.arguments;
    final OtpController otpController = Get.put(OtpController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white),
              ),
              child: const Center(
                child: Icon(Icons.arrow_back, size: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OTP Verification',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'We have sent a verification code on',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff636363),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '+91 ${receivedNumber}',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            width: 50,
                            height: 50,
                            child: TextFormField(
                              cursorColor: AppColors.primaryGradinatMixColor,
                              controller: otpController.OTPcontrollers[index],
                              focusNode: otpController.focusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff636363),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primaryGradinatMixColor,
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.error,
                                  ),
                                ),
                              ),
                              maxLines: 1,
                              onChanged:
                                  (value) =>
                                      otpController.onOTPChanged(value, index),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ' ';
                                  // otpController.OTPValidation();
                                }
                                return null;
                              },
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primaryFirstGradiant,
                              AppColors.primarySecondGradiant,
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Get.toNamed('/registration');
                            } else {
                              otpController.OTPValidation();
                            }
                          },
                          child: Text(
                            'Verify',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GradientOutlinedButton(
                                borderRadius: BorderRadius.circular(25),
                                text: "Resend OTP",
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.primaryFirstGradiant,
                                    AppColors.primarySecondGradiant,
                                  ],
                                ),
                                onPressed: () {
                                  Get.snackbar(
                                    backgroundColor:
                                        AppColors.primaryGradinatMixColor,
                                    colorText: AppColors.white,
                                    'Notice',
                                    'Requested for New OTP on $receivedNumber',
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: GradientOutlinedButton(
                                borderRadius: BorderRadius.circular(25),
                                text: "Call me",
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.primaryFirstGradiant,
                                    AppColors.primarySecondGradiant,
                                  ],
                                ),
                                onPressed: () {
                                  Get.snackbar(
                                    backgroundColor:
                                        AppColors.primaryGradinatMixColor,
                                    colorText: AppColors.white,
                                    'Notice',
                                    'Requested for call on $receivedNumber',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
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
