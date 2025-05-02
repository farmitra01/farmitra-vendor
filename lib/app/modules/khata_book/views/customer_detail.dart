import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/khata_book/controllers/customer_detail_controller.dart';
import 'package:farmitra/app/modules/khata_book/views/add_Customer.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custom_text_form_field.dart';
import 'package:farmitra/app/utils/global_widgets/custome_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerDetail extends StatelessWidget {
  const CustomerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomerDetailController customerDetailController = Get.put(
      CustomerDetailController(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        leadingWidth: 25,
        iconTheme: IconThemeData(color: AppColors.white),
        title: GestureDetector(
          onTap: () {
            // Get.to(AddCustomer());
          },
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: Text(
                    'SR',
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryGradinatMixColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shankar Rane',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Noida Uttar Pradesh 201301',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white),
                ),

                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.message, color: AppColors.white),
                ),
              ),
              SizedBox(width: 5),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  border: Border.all(color: AppColors.white),
                ),

                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.call, color: AppColors.white),
                ),
              ),
              SizedBox(width: 15),
            ],
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.green.withOpacity(0.2),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '₹4532',
                              style: GoogleFonts.montserrat(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryGradinatMixColor,
                              ),
                            ),

                            Icon(
                              Icons.keyboard_double_arrow_right,
                              color: AppColors.primaryGradinatMixColor,
                            ),
                          ],
                        ),
                        // SizedBox(height: 10),
                        Text(
                          'You Will Get',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryGradinatMixColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomGradientButton(
                                borderRadius: 10,
                                text: 'Request Money',
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              flex: 1,
                              child: CustomGradientButton(
                                borderRadius: 10,
                                text: 'Pay',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    borderRadius: 5,
                    hintText: 'Date',
                    keyboardType: TextInputType.datetime,
                    controller: customerDetailController.date,
                    validator: (p0) {},
                    suffixWidget: GestureDetector(
                      onTap: () => customerDetailController.pickDate(context),
                      child: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order - 1001',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '02 APR 2024',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            '- ₹4532',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.error,
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       flex: 2,
                      //       child: CustomGradientButton(
                      //         borderRadius: 10,
                      //         text: 'Request Money',
                      //         onPressed: () {},
                      //       ),
                      //     ),
                      //     SizedBox(width: 5),
                      //     Expanded(
                      //       flex: 1,
                      //       child: CustomGradientButton(
                      //         borderRadius: 10,
                      //         text: 'Pay',
                      //         onPressed: () {},
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
