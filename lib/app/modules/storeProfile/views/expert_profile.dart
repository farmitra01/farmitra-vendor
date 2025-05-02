import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/bank_details/views/bank_details_view.dart';
import 'package:farmitra/app/modules/home/views/Appointment.dart';
import 'package:farmitra/app/modules/home/views/feed.dart';
import 'package:farmitra/app/modules/home/views/manage_appointmant.dart';
import 'package:farmitra/app/modules/storeProfile/controllers/expertProfileController.dart';
import 'package:farmitra/app/modules/storeProfile/views/my_profile.dart';
import 'package:farmitra/app/modules/storeProfile/views/reward.dart';
import 'package:farmitra/app/modules/storeProfile/views/profile_view.dart';
import 'package:farmitra/app/utils/global_widgets/vendor_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpertProfile extends StatelessWidget {
  const ExpertProfile({super.key});
  @override
  Widget build(BuildContext context) {
    final ExpertprofileController expertprofileController = Get.put(
      ExpertprofileController(),
    );
    return Scaffold(
      appBar: VendorAppBar(title: 'Profile'),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(color: AppColors.primaryGradinatMixColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(backgroundColor: AppColors.white, radius: 35),
                    SizedBox(width: 10),
                    Row(
                      children: List.generate(
                        expertprofileController.profileDetail.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          child: Column(
                            children: [
                              Text(
                                expertprofileController
                                    .profileDetail[index]['count'],
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(height: 1.5),
                              Text(
                                expertprofileController
                                    .profileDetail[index]['details'],
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Raj Rathod',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '8737055521',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Noida Uttar Pradesh',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              Get.to(() => RewardView());
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.green.withOpacity(0.1),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                        child: Image.asset(
                          'assets/images/storeProfile/gifts.webp',
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Refer & Earn',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.share,
                                  color: AppColors.primaryGradinatMixColor,
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Invite your friends to earn exciting reward',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(color: AppColors.border),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Icon(
                                Icons.diversity_3,
                                size: 35,
                                color: AppColors.primaryGradinatMixColor,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '10',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryGradinatMixColor,
                                    ),
                                  ),
                                  Text(
                                    'Referred Friends',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: 35,
                                color: AppColors.primaryGradinatMixColor,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '10',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryGradinatMixColor,
                                    ),
                                  ),
                                  Text(
                                    'Referred Friends',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
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
          SizedBox(height: 5),
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              children: List.generate(
                expertprofileController.getDetailsList().length,
                (index) {
                  final item =
                      expertprofileController
                          .getDetailsList()[index]; // Get the map at index
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Get.to(() => MyProfile());
                          break;
                        case 1:
                          Get.to(() => Feed());
                          break;
                        case 2:
                          Get.to(() => Appointment());
                          break;
                        case 3:
                          Get.toNamed('/store-profile');
                          break;
                        case 4:
                          Get.toNamed('/owner-profile');
                          break;
                        case 5:
                          Get.to(() => BankDetailsView());
                          break;
                        case 6:
                          Get.to(() => ManageAppointmant());
                          break;
                        case 7:
                          Get.to(() => Appointment());
                          break;
                        default:
                          break;
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Icon(
                            item['icon'], // Use item to access 'icon'
                            color: AppColors.primaryGradinatMixColor,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            item['details'], // Use item to access 'details'
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios, size: 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
