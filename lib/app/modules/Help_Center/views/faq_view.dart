import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/Help_Center/controllers/faq_controller.dart';
import 'package:farmitra/app/routes/app_pages.dart';
import 'package:farmitra/app/utils/global_widgets/gradiant_outlined_button.dart';
import 'package:farmitra/app/utils/global_widgets/vendor_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqView extends GetView {
  FaqView({super.key});

  final FaqController faqController = Get.put(FaqController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: VendorAppBar(title: 'FAQ'),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Need Help?',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: faqController.gridContent.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Routes.faq_grid_pages,
                          arguments: {
                            'title': faqController.gridContent[index].title,
                          },
                        );
                        print(faqController.gridContent[index].title);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            faqController.gridContent[index].imagePath,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            faqController.gridContent[index].title,
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.border)),
                  Text('Or'),
                  Expanded(child: Divider(color: AppColors.border)),
                ],
              ),
              SizedBox(height: 50),
              Container(
                // color: AppColors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Need More Help?',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Chat with our support team for quick assistance.',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(height: 20),
                          GradientOutlinedButton(
                            borderRadius: BorderRadius.circular(10),
                            text: "Chat with us",
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.primaryFirstGradiant,
                                AppColors.primarySecondGradiant,
                              ],
                            ),
                            onPressed: () {
                              Get.toNamed('/text-support');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SvgPicture.asset('assets/svgs/transparant_firstfind.svg'),
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
