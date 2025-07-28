import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/storeProfile/controllers/store_profile_controller.dart';
import 'package:farmitra/app/modules/storeProfile/views/about_view.dart';
import 'package:farmitra/app/modules/storeProfile/views/review_view.dart';
import 'package:farmitra/app/modules/storeProfile/views/storesTabProfile_view.dart';
import 'package:farmitra/app/utils/global_widgets/gradiant_svgIcons.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreProfileView extends GetView<StoreProfileController> {
  StoreProfileView({super.key});
  final StoreProfileController storeProfileController = Get.put(
    StoreProfileController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                // **Fixed Header (Jp Provisional Store)**

                // **Carousel & Store Details**
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 200.0,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,
                            ),
                            items:
                                storeProfileController.crouseImages.map((
                                  imagePath,
                                ) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurStyle: BlurStyle.inner,
                                              spreadRadius: 10,
                                              blurRadius: 5,
                                              color: Colors.white,
                                              offset: Offset(0, 10),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.asset(
                                            imagePath,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 25,
                            child: Container(
                              height: 35,
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff02A146),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '4.5',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(),
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  VerticalDivider(
                                    color: Colors.white,
                                    indent: 5,
                                    endIndent: 5,
                                  ),
                                  Text(
                                    '23',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(),
                                  Icon(
                                    Icons.group,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: -10,
                            child: SizedBox(
                              height: 50,
                              width: 100,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    storeProfileController.crouseImages.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor:
                                          AppColors.primaryGradinatMixColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 20,
                            child: GestureDetector(
                              onTap: () {
                                Get.closeAllSnackbars();
                                Get.back(closeOverlays: true);
                                ();
                              },
                              child: Container(
                                height: 50,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white70,
                                ),
                                child: Icon(Icons.arrow_back),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 25,
                            child: Container(
                              height: 50,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white70,
                              ),
                              child: Icon(Icons.message_rounded, size: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  collapsedHeight: 80,
                  expandedHeight: 80,
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'First',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                'Find',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryGradinatMixColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          // Wrap text with Expanded
                          child: Text(
                            'Jp Provisional Store',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'NCR Region, 7, Market, Near Metro hospital & Heart institute, Block l, Sector 12, Noida',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Grocery',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text('|', style: TextStyle(fontSize: 22)),
                            SizedBox(width: 2),
                            Flexible(
                              child: Text(
                                'Stationary',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sun-Mon ',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            Text(
                              '|',
                              style: TextStyle(
                                fontSize: 22,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '9:00 Am - 8:00 Pm',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textSecondary,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: AppColors.primaryGradinatMixColor,
                                ),
                              ),
                              child: GradientSvgIcon(
                                icon: Icon(Icons.campaign),
                                size: 30,
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.primaryFirstGradiant,
                                    AppColors.primaryGradinatMixColor,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 5, color: AppColors.border),
                      ],
                    ),
                  ),
                ),
                // **Scrollable Tab Bar**
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: _SliverTabBarDelegate(
                    TabBar(
                      tabs: [
                        Tab(text: 'Profile'),
                        Tab(text: 'Reviews'),
                        Tab(text: 'About'),
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.white,
                      ),
                      labelColor: AppColors.textPrimary,
                      labelStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      dividerColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      unselectedLabelColor: AppColors.textSecondary,
                    ),
                  ),
                ),
              ];
            },

            // **Scrollable TabBarView**
            body: TabBarView(
              children: [StoresTabProfileView(), ReviewView(), AboutView()],
            ),
          ),
        ),
      ),
    );
  }
}

// **Custom SliverPersistentHeader Delegate for TabBar**
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: AppColors.lightGrey, child: tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
