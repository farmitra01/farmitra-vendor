import 'package:dotted_border/dotted_border.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/Help_Center/controllers/text_support_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_dropdown.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custom_text_form_field.dart';
import 'package:farmitra/app/utils/global_widgets/vendor_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class TextSupportView extends GetView {
  const TextSupportView({super.key});
  @override
  Widget build(BuildContext context) {
    final TextSupportController textSupportController = Get.put(
      TextSupportController(),
    );
    return Scaffold(
      appBar: VendorAppBar(
        title: 'Chat',
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/ticket');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SvgPicture.asset('assets/svgs/Ticket.svg'),
                    SizedBox(width: 5),
                    Text(
                      'My Ticket',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffDADADA),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please Select the issue from given categories',
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => CustomDropdown<String>(
                  hint: 'Categories',
                  items:
                      textSupportController
                          .categoriesList, // Keep it as List<String>
                  selectedItem:
                      textSupportController.selectedItem.value.isEmpty
                          ? null
                          : textSupportController.selectedItem.value,
                  onChanged: (value) {
                    textSupportController.updatedSelectedValue(value ?? '');
                  },
                  itemBuilder: (item) => item, // Correct item mapping
                ),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                borderRadius: 5,
                hintText: 'Enter Text Here...',
                keyboardType: TextInputType.text,
                controller: textSupportController.entertext,
                maxLines: 5,
                maxLength: 200,
                validator: (p0) {},
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  _showImagePickerDialog(); // Show image source dialog on tap
                },
                child: Center(
                  child: DottedBorder(
                    color: AppColors.border,
                    dashPattern: [6, 3],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white,
                      ),
                      child: Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textSupportController.selectedImage.value != null
                                ? Image.file(
                                  textSupportController.selectedImage.value!,
                                  height: 100,
                                  width: 125,
                                  fit: BoxFit.fill,
                                )
                                : SvgPicture.asset(
                                  'assets/icons/uploadicon.svg',
                                ),
                            textSupportController.selectedImage.value == null
                                ? Text(
                                  'Upload Document',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                                : SizedBox.shrink(),
                            SizedBox(height: 10),
                            textSupportController.selectedImage.value == null
                                ? Text(
                                  'JPEG, PNG less than 5MB',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textSecondary,
                                  ),
                                )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            children: [
              CustomGradientButton(
                text: 'Submit',
                onPressed: () {
                  Get.toNamed('/ticket');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showImagePickerDialog() {
  final TextSupportController textSupportController = Get.put(
    TextSupportController(),
  );
  showDialog(
    context: Get.context!, // Since you're using GetX
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Select Image:-',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryGradinatMixColor,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min, // To avoid the dialog being too large
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // If you need to add additional content here
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.back(); // Close dialog
                  textSupportController.pickImage(ImageSource.camera);
                },
                child: Text(
                  'Camera',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGradinatMixColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.back(); // Close dialog
                  textSupportController.pickImage(ImageSource.gallery);
                },
                child: Text(
                  'Gallery',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
