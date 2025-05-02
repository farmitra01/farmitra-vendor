import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/storeProfile/controllers/my_profile_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/vendor_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final MyProfileController myProfileController = Get.put(
      MyProfileController(),
    );
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: VendorAppBar(
        title: 'My Profile',
        actions: [
          Row(
            children: [
              Icon(Icons.shopping_cart, color: AppColors.white),
              SizedBox(width: 15),
              Icon(Icons.notifications_active, color: AppColors.white),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Header + Edit Button
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
                        myProfileController.profileDetail.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          child: Column(
                            children: [
                              Text(
                                myProfileController
                                    .profileDetail[index]['count'],
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(height: 1.5),
                              Text(
                                myProfileController
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
                SizedBox(height: 10),
                CustomGradientButton(
                  text: 'Edit Profile',
                  onPressed: () {},
                  gradientColors: [AppColors.yellow, AppColors.yellow],
                  borderRadius: 10,
                ),
              ],
            ),
          ),
          // Tab Bar
          TabBar(
            labelColor: AppColors.primaryGradinatMixColor,
            indicatorColor: AppColors.primaryGradinatMixColor,
            controller: myProfileController.tabController,
            tabs: [Tab(text: 'My Post'), Tab(text: 'Saved Posts')],
          ),
          // TabBarView (Fixed height for scroll)
          Expanded(
            child: TabBarView(
              controller: myProfileController.tabController,
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: buildMyPost(),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: buildSavedPosts(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 
Widget buildMyPost() {
  return Center(child: Text('My Post Will be available soon...!'),);
}

Widget buildSavedPosts() {
  return Center(child: Text('Saved Post Will be available soon...!'));
}
