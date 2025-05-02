import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/data/models/store_select_model/store_select_model.dart';
import 'package:farmitra/app/modules/POS/views/filter.dart';
import 'package:farmitra/app/modules/home/views/home_appbar_view.dart';
import 'package:farmitra/app/modules/home/views/manage_appointmant.dart';
import 'package:farmitra/app/modules/home/views/manage_services.dart';
import 'package:farmitra/app/modules/home/views/vehical_list.dart';
import 'package:farmitra/app/modules/registration/controllers/store_category_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_selected_module_controller.dart';
import 'package:farmitra/app/utils/global_widgets/gradiant_svgIcons.dart';
import 'package:farmitra/app/utils/global_widgets/gradiant_text.dart';
import 'package:farmitra/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  final StoreCategoryController storeCategoryController = Get.put(
    StoreCategoryController(),
  );
  final StoreSelectedModuleController storeSelectedModuleController = Get.put(
    StoreSelectedModuleController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: HomeAppbarView(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Analytics',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        Get.to(Filter());
                      },
                      child: Text(
                        'Filter',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryGradinatMixColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 10),
              SizedBox(
                height: 135,
                child: ListView.builder(
                  itemCount: homeController.salesReport.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 0,
                      ),
                      child: Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 0.0,
                              offset: Offset(0, 0),
                              color: AppColors.textSecondary,
                            ),
                          ],
                          color: AppColors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              homeController.salesReport[index].imagePath,
                            ),
                            Text(
                              '₹',
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text('0.00'),
                            Text(homeController.salesReport[index].salesRepot),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quick Access',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/home_icons/Edit.svg'),
                      SizedBox(width: 5),
                      Text(
                        'Edit',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: AppColors.containerShadowColor,
                    ),
                  ],
                  color: AppColors.white,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      storeCategoryController.previousPageGridTitle ==
                                  'Rental' ||
                              storeCategoryController.previousPageGridTitle ==
                                  'Drone'
                          ? homeController.rentalGridItem.length
                          : storeSelectedModuleController
                                  .PreviousSelectedValue ==
                              'As a Retailer'
                          ? homeController.retailerGridItem.length
                          : homeController.quickAccessGridItem.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 2) {
                          storeSelectedModuleController.PreviousSelectedValue ==
                                  'As a Retailer'
                              ? Get.toNamed("/khata-book")
                              : null;
                        }
                        if (index == 6) {
                          if (storeCategoryController.previousPageGridTitle ==
                                  'Rental' ||
                              storeCategoryController.previousPageGridTitle ==
                                  'Drone') {
                            Get.to(() => VehicalList());
                          } else if (storeCategoryController
                                  .previousPageGridTitle ==
                              'Expert') {
                            Get.to(() => ManageAppointmant());
                          }
                        }
                        if (index == 7) {
                          storeCategoryController.previousPageGridTitle ==
                                      'Rental' ||
                                  storeCategoryController
                                          .previousPageGridTitle ==
                                      'Drone'
                              // ||
                              // storeCategoryController
                              //         .previousPageGridTitle ==
                              //     'Expert'
                              ? Get.toNamed("/inventry")
                              : null;
                        }
                        if (index == 9) {
                          storeSelectedModuleController.PreviousSelectedValue ==
                                  'As a Retailer'
                              ? Get.toNamed('/inventry')
                              : null;
                        }
                        if (index == 17) {
                          storeSelectedModuleController.PreviousSelectedValue ==
                                  'As a Retailer'
                              ? Get.toNamed("/inventory")
                              : null;
                        }
                      },
                      child: Column(
                        children: [
                          GradientSvgIcon(
                            icon: Icon(
                              storeCategoryController.previousPageGridTitle ==
                                          'Rental' ||
                                      storeCategoryController
                                              .previousPageGridTitle ==
                                          'Drone'
                                  ? homeController
                                      .rentalGridItem[index]
                                      .gridItemIcon
                                  : storeSelectedModuleController
                                          .PreviousSelectedValue ==
                                      'As a Retailer'
                                  ? homeController
                                      .retailerGridItem[index]
                                      .gridItemIcon
                                  : homeController
                                      .quickAccessGridItem[index]
                                      .gridItemIcon,
                              color: AppColors.primaryGradinatMixColor,
                            ),
                            size: 25,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.primaryFirstGradiant,
                                AppColors.primarySecondGradiant,
                              ],
                            ),
                          ),
                          Text(
                            storeCategoryController.previousPageGridTitle ==
                                        'Rental' ||
                                    storeCategoryController
                                            .previousPageGridTitle ==
                                        'Drone'
                                ? homeController
                                    .rentalGridItem[index]
                                    .gridItemText
                                : storeSelectedModuleController
                                        .PreviousSelectedValue ==
                                    'As a Retailer'
                                ? homeController
                                    .retailerGridItem[index]
                                    .gridItemText
                                : homeController
                                    .quickAccessGridItem[index]
                                    .gridItemText,
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              // Container(
              //   height: 150,
              //   width: double.infinity,
              //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //         blurRadius: 5,
              //         color: AppColors.containerShadowColor,
              //       ),
              //     ],
              //     color: AppColors.background,
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Icons.network_check_sharp,
              //         color: AppColors.textSecondary,
              //       ),
              //       SizedBox(height: 5),
              //       Text(
              //         '  You have no store\ninsights available yet',
              //         style: GoogleFonts.montserrat(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w500,
              //           color: AppColors.textSecondary,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 15),
              GradientText(
                text: 'Farmitra',
                style: GoogleFonts.montserrat(
                  fontSize: 52,
                  fontWeight: FontWeight.w700,
                ),
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryFirstGradiant,
                    AppColors.primarySecondGradiant,
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "The Farmer's Friend.",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.appBarColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Designed & Developed with ❤️ in Bharat',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: HomeBottomBarView()
    );
  }
}
