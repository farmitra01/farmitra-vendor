import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/login/controllers/login_controller.dart';
import 'package:farmitra/app/modules/login/controllers/otp_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/gradiant_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var validate = false.obs;
    final OtpController otpController = Get.put(OtpController());
    final LoginController loginController = Get.put(LoginController());
    // final receivedNumber = Get.arguments; // Receiving from LoginView
    bool isOtpComplete() =>
        otpController.OTPcontrollers.every((c) => c.text.trim().isNotEmpty);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () => Get.back(),
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                const SizedBox(height: 15),
                Text(
                  'We have sent a verification code on',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff636363),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '+91 ${otpController.mobile}',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 100),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: 50,
                            height: 50,
                            child: Obx(
                              () => TextFormField(
                                cursorColor: AppColors.primaryGradinatMixColor,
                                controller: otpController.OTPcontrollers[index],
                                focusNode: otpController.focusNodes[index],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          otpController
                                                  .otpErrorMessage
                                                  .isNotEmpty
                                              ? AppColors.error
                                              : const Color(0xff636363),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          otpController
                                                  .otpErrorMessage
                                                  .isNotEmpty
                                              ? AppColors.error
                                              : AppColors
                                                  .primaryGradinatMixColor,
                                    ),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.error,
                                    ),
                                  ),
                                ),
                                maxLines: 1,
                                onChanged:
                                    (value) => otpController.onOTPChanged(
                                      value,
                                      index,
                                    ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 8),
                      Obx(() {
                        return otpController.otpErrorMessage.isNotEmpty
                            ? Text(
                              otpController.otpErrorMessage.value,
                              style: const TextStyle(
                                color: AppColors.error,
                                fontSize: 12,
                              ),
                            )
                            : const SizedBox();
                      }),
                      // SizedBox(height: 10),
                      const SizedBox(height: 30),
                      Obx(
                        () => CustomGradientButton(
                          text: 'Verify',
                          gradientColors:
                              otpController.isOtpFilled.value
                                  ? [
                                    AppColors.primaryFirstGradiant,
                                    AppColors.primarySecondGradiant,
                                  ]
                                  : [AppColors.lightGrey, AppColors.secondary],
                          onPressed: () {
                            if (!otpController.isOtpFilled.value) {
                              otpController.showOtpError(
                                "Please enter 4-digit Valid OTP",
                              );

                              return;
                            }

                            if (_formkey.currentState!.validate()) {
                              otpController.submitOtp();
                            } else {
                              otpController.OTPValidation();
                            }
                          },
                        ),
                      ),

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive it? ",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Obx(
                            () => InkWell(
                              onTap:
                                  otpController.isButtonEnabled.value
                                      ? () {
                                        loginController.loginWithOtp();
                                        otpController.startTimer();
                                      }
                                      : null,
                              child: Text(
                                otpController.isButtonEnabled.value
                                    ? "Resend OTP"
                                    : "${otpController.formattedTime}s",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryGradinatMixColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Obx(
                      //       () => Expanded(
                      //         child: GradientOutlinedButton(
                      //           borderRadius: BorderRadius.circular(25),

                      //           text:
                      //               otpController.isButtonEnabled.value
                      //                   ? "Resend OTP"
                      //                   : 'Resend OTP in ${otpController.formattedTime}s',
                      //           gradient:
                      //               otpController.isButtonEnabled.value
                      //                   ? LinearGradient(
                      //                     colors: [
                      //                       AppColors.primaryFirstGradiant,
                      //                       AppColors.primarySecondGradiant,
                      //                     ],
                      //                   )
                      //                   : LinearGradient(
                      //                     colors: [
                      //                       AppColors.border,
                      //                       AppColors.border,
                      //                     ],
                      //                   ),
                      //           onPressed: () {
                      //             otpController.isButtonEnabled.value
                      //                 ? loginController.loginWithOtp()
                      //                 : null;
                      //             otpController.isButtonEnabled.value
                      //                 ? otpController.startTimer()
                      //                 : null;

                      //             // Get.snackbar(
                      //             //   'Notice',
                      //             //   otpController.isButtonEnabled.value == true
                      //             //       ? 'Requested for new OTP on ${otpController.mobile}'
                      //             //       : 'Wait For 2 Minustes',
                      //             //   backgroundColor:
                      //             //       AppColors.primaryGradinatMixColor,
                      //             //   colorText: AppColors.white,
                      //             //   snackPosition: SnackPosition.TOP,
                      //             // );
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 15),
                      //     Expanded(
                      //       child: GradientOutlinedButton(
                      //         borderRadius: BorderRadius.circular(25),
                      //         text: "Call me",
                      //         gradient: LinearGradient(
                      //           colors: [
                      //             AppColors.primaryFirstGradiant,
                      //             AppColors.primarySecondGradiant,
                      //           ],
                      //         ),
                      //         onPressed: () {
                      //           Get.snackbar(
                      //             'Notice',
                      //             'Requested for call on ${otpController.mobile}',
                      //             backgroundColor:
                      //                 AppColors.primaryGradinatMixColor,
                      //             colorText: AppColors.white,
                      //             snackPosition: SnackPosition.TOP,
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
