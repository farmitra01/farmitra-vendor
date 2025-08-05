import 'package:dotted_border/dotted_border.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/kyc_documents/controllers/kyc_upload_document_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class KycUploadDocumentView extends GetView {
  KycUploadDocumentView({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final KycUploadDocumentController kycUploadDocumentController = Get.put(
    KycUploadDocumentController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step 2/2 Upload Document:',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Documents required for complete KYC',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Icon(Icons.close, color: AppColors.primaryGradinatMixColor),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(thickness: 1, color: AppColors.border),
                SizedBox(height: 15),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Certificate Must show:',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkBlue,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.check, size: 20),
                                Text(
                                  '  Registration number',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.darkBlue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.check, size: 20),
                                Text(
                                  '  Legal name',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.darkBlue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.check, size: 20),
                                Text(
                                  '  Trade name',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.darkBlue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Sample',
                              titlePadding: EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                                bottom: 0,
                              ),
                              titleStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: AppColors.primaryGradinatMixColor,
                              ),
                              content: Image.asset(
                                'assets/images/kyc/shopImage.jpg',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                          child: Container(
                            height: 120,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.border),
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/kyc/shopImage.jpg',
                                ),
                                fit: BoxFit.fill,
                                opacity: 0.2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.visibility),
                                Text(
                                  'View Sample',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Fill the ${kycUploadDocumentController.documentName} Details Below',
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: "Enter Document ID/No.",
                  keyboardType: TextInputType.number,
                  controller: kycUploadDocumentController.documentIdNo,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Document ID/No.';
                    }
                    return null;
                  },
                  inputFormatters: [LengthLimitingTextInputFormatter(12)],
                ),
                SizedBox(height: 10),
                Text(
                  'Upload your document here (2:1)',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    showImageSourceDialog(); // Show image source dialog on tap
                  },
                  child: DottedBorder(
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    dashPattern: [6, 3],
                    color: AppColors.border,
                    radius: Radius.circular(15),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 30,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () =>
                                  kycUploadDocumentController
                                              .selectedImage
                                              .value !=
                                          null
                                      ? Image.file(
                                        kycUploadDocumentController
                                            .selectedImage
                                            .value!,
                                        height: 150,
                                        width: 200,
                                        fit: BoxFit.fill,
                                      )
                                      : SvgPicture.asset(
                                        'assets/icons/uploadicon.svg',
                                      ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Upload Outside Image',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'JPEG, PNG less than\n               15MB',
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: kycUploadDocumentController.isChecked.value,
                      activeColor: AppColors.primaryGradinatMixColor,
                      checkColor: AppColors.white,
                      onChanged: (value) {
                        kycUploadDocumentController.toggleCheckBox(value);
                      },
                    ),
                  ),
                  Text(
                    'I confirm my submission for this document.',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              CustomGradientButton(
                text: 'Submit',
                onPressed: () async {
                  if (formkey.currentState!.validate() &&
                      kycUploadDocumentController.isChecked.value == true) {
                    final success =
                        await kycUploadDocumentController
                            .submitBusinessDocument();
                    if (success) {
                      Get.toNamed('/business_kyc');
                    }
                  } else {
                    Get.snackbar(
                      'Notice',
                      'Text field and checkbox are required fields',
                      backgroundColor: AppColors.primaryGradinatMixColor,
                      colorText: AppColors.white,
                    );
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
              //         AppColors.primaryFirstGradiant,
              //         AppColors.primarySecondGradiant,
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
              //       if (formkey.currentState!.validate() &&
              //           kycUploadDocumentController.isChecked.value ==
              //               true) {
              //         Get.toNamed('/business_kyc');
              //       } else {
              //         Get.snackbar(
              //           'Notice',
              //           'Text field and checkbox are required field',
              //           backgroundColor: AppColors.appBarColor,
              //           colorText: AppColors.primaryGradinatMixColor,
              //         );
              //       }
              //     },
              //     child: Text(
              //       'Submit',
              //       style: GoogleFonts.montserrat(
              //         fontSize: 14,
              //         fontWeight: FontWeight.w600,
              //         color: AppColors.white,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 10),
              Text(
                'Contact for help!',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGradinatMixColor,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

void showImageSourceDialog() {
  final KycUploadDocumentController kycUploadDocumentController = Get.put(
    KycUploadDocumentController(),
  );
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select Image :-'),
        titleTextStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: AppColors.primaryGradinatMixColor,
        ),
        // content: Text('Choose where you want to select the image from.'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.closeAllSnackbars();
                  Get.back(closeOverlays: true);
                  ();
                  kycUploadDocumentController.pickImage(ImageSource.camera);
                },
                child: Text(
                  'Camera',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.primaryGradinatMixColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.closeAllSnackbars();
                  Get.back(closeOverlays: true);
                  ();
                  kycUploadDocumentController.pickImage(ImageSource.gallery);
                },
                child: Text(
                  'Gallery',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.primaryGradinatMixColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
