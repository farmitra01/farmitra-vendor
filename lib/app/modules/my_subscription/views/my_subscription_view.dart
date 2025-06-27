import 'dart:math';

import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/my_subscription/views/racharge_plan_view.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/my_subscription_controller.dart';

class MySubscriptionView extends GetView<MySubscriptionController> {
  const MySubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final MySubscriptionController mySubscriptionController = Get.put(
      MySubscriptionController(),
    );

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.secondary,
            size: 20.sp,
          ),
        ),
        title: Text(
          'My Business Plan',
          style: GoogleFonts.montserrat(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: AppColors.border,
                    offset: Offset(0, 1),
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 5.h,
                ),
                dividerHeight: 0,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: AppColors.primaryGradinatMixColor,
                ),
                labelColor: AppColors.white,
                labelStyle: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
                unselectedLabelColor: AppColors.textSecondary,
                controller: mySubscriptionController.tabController,
                tabs: const [
                  Tab(text: 'Silver'),
                  Tab(text: 'Gold'),
                  Tab(text: 'Platinum'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: mySubscriptionController.tabController,
                children: [
                  buildSilverPlan(),
                  buildGoldPlan(),
                  buildPlatinumPlan(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        child: Obx(() {
          String buttonText;
          if (!mySubscriptionController.trial.value) {
            buttonText = 'Start 1-Month Free Trial';
          } else if (mySubscriptionController.trial.value) {
            buttonText = 'Trial Period Expires in 15 Days';
          } else if (mySubscriptionController.renew.value) {
            buttonText = 'Renew/Upgrade Plan';
          } else {
            buttonText = 'Unknown Status';
          }
          return CustomGradientButton(
            text: buttonText,
            onPressed: () {
              if (!mySubscriptionController.trial.value) {
                mySubscriptionController.trial.value = true;
              } else if (mySubscriptionController.trial.value) {
                mySubscriptionController.renew.value = true;
                mySubscriptionController.trial.value = false;
                Get.to(() => RechargePlan());
              } else if (mySubscriptionController.renew.value) {
                mySubscriptionController.trial.value = false;
                Get.to(() => RechargePlan());
              }
            },
          );
        }),
      ),
    );
  }

  Widget buildSilverPlan() {
    final MySubscriptionController mySubscriptionController =
        Get.find<MySubscriptionController>();
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: Column(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Silver',
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const Spacer(),
                        Card(
                          elevation: 0,
                          color: AppColors.lightGrey,
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: AppColors.textPrimary,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  'Active',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Next Billing Date: \n30/05/2025',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.primaryGradinatMixColor,
                        size: 16.sp,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '50 Queries / Month',
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 98.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: mySubscriptionController.plans.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 180.w,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap:
                              () => mySubscriptionController.selectPlan(index),
                          child: Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 15.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 8.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        mySubscriptionController.plans[index],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      const Spacer(),
                                      Obx(
                                        () => Radio<int>(
                                          activeColor:
                                              AppColors.primaryGradinatMixColor,
                                          value: index,
                                          groupValue:
                                              mySubscriptionController
                                                  .selectedIndex
                                                  .value,
                                          onChanged: (int? value) {
                                            if (value != null) {
                                              mySubscriptionController
                                                  .selectPlan(value);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    mySubscriptionController.prices[index],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    mySubscriptionController
                                        .originalPrices[index],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textSecondary,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    mySubscriptionController.billingText[index],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (index == 0)
                          Positioned(
                            top: -5.h,
                            left: 0,
                            right: 0,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: AppColors.green,
                                ),
                                child: Text(
                                  'Saving 30%',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGoldPlan() {
    final MySubscriptionController mySubscriptionController =
        Get.find<MySubscriptionController>();
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: Column(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Gold',
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const Spacer(),
                        Card(
                          elevation: 0,
                          color: AppColors.lightGrey,
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: AppColors.textPrimary,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  'Active',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Next Billing Date: \n30/05/2025',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.primaryGradinatMixColor,
                        size: 16.sp,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '100 Queries / Month',
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 98.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: mySubscriptionController.plans.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 180.w,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap:
                              () => mySubscriptionController.selectPlan(index),
                          child: Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 15.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 8.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        mySubscriptionController.plans[index],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      const Spacer(),
                                      Obx(
                                        () => Radio<int>(
                                          activeColor:
                                              AppColors.primaryGradinatMixColor,
                                          value: index,
                                          groupValue:
                                              mySubscriptionController
                                                  .selectedIndex
                                                  .value,
                                          onChanged: (int? value) {
                                            if (value != null) {
                                              mySubscriptionController
                                                  .selectPlan(value);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    mySubscriptionController.prices[index],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    mySubscriptionController
                                        .originalPrices[index],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textSecondary,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    mySubscriptionController.billingText[index],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (index == 0)
                          Positioned(
                            top: -5.h,
                            left: 0,
                            right: 0,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: AppColors.green,
                                ),
                                child: Text(
                                  'Saving 30%',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPlatinumPlan() {
    final MySubscriptionController mySubscriptionController =
        Get.find<MySubscriptionController>();
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: Column(
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Platinum',
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const Spacer(),
                        Card(
                          elevation: 0,
                          color: AppColors.lightGrey,
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: AppColors.textPrimary,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  'Active',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Next Billing Date: \n30/05/2025',
                      style: GoogleFonts.montserrat(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.primaryGradinatMixColor,
                        size: 16.sp,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '200 Queries / Month',
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 120.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: mySubscriptionController.plans.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 180.w,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap:
                              () => mySubscriptionController.selectPlan(index),
                          child: Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 15.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 8.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        mySubscriptionController.plans[index],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      const Spacer(),
                                      Obx(
                                        () => Radio<int>(
                                          activeColor:
                                              AppColors.primaryGradinatMixColor,
                                          value: index,
                                          groupValue:
                                              mySubscriptionController
                                                  .selectedIndex
                                                  .value,
                                          onChanged: (int? value) {
                                            if (value != null) {
                                              mySubscriptionController
                                                  .selectPlan(value);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    mySubscriptionController.prices[index],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    mySubscriptionController
                                        .originalPrices[index],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textSecondary,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    mySubscriptionController.billingText[index],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (index == 0)
                          Positioned(
                            top: -5.h,
                            left: 0,
                            right: 0,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: AppColors.green,
                                ),
                                child: Text(
                                  'Saving 30%',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
