import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/home/controllers/appointment_controller.dart';
import 'package:farmitra/app/modules/home/views/Appointment_Details.dart';
import 'package:farmitra/app/modules/home/views/reply.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/vendor_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    final AppointmentController appointmentController = Get.put(
      AppointmentController(),
    );
    return Scaffold(
      appBar: VendorAppBar(title: 'Appointment'),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  color: AppColors.border,
                  offset: Offset(0, 1),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: TabBar(
              isScrollable: false,
              physics: NeverScrollableScrollPhysics(),
              controller: appointmentController.tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              dividerHeight: 0,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.primaryGradinatMixColor,
              ),
              labelColor: AppColors.white,
              labelStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              unselectedLabelColor: AppColors.textSecondary,
              tabs: [
                Tab(text: 'Online Consultation'),
                Tab(text: 'Farm Visit'),
                // Tab(text: 'Completed'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: appointmentController.tabController,
              children: [
                buildOnlineConsultationTab(),
                buildFarmAdvisoryTab(1),
                // buildOnlineConsultationTab(),
                // buildPendingTab(),
                // buildProcessingTab(),
                // builConfirmedTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildOnlineConsultationTab() {
  final AppointmentController appointmentController = Get.put(
    AppointmentController(),
  );
  return Container(
    child: Column(
      children: [
        SizedBox(height: 5),
        TabBar(
          controller: appointmentController.consultationTabController,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          labelColor: AppColors.primaryGradinatMixColor,
          unselectedLabelColor: AppColors.textSecondary,
          labelPadding: EdgeInsets.all(0),
          tabs: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),

              color: Colors.transparent,
              child: Tab(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.background,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2.5,
                        color: AppColors.containerShadowColor,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/Package.svg',
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '15',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('Appointment'),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),

              color: Colors.transparent,
              child: Tab(
                child: Container(
                  height: 100,

                  // width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.background,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2.5,
                        color: AppColors.containerShadowColor,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/Package.svg',
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '15',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('Disease'),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),

              color: Colors.transparent,
              child: Tab(
                child: Container(
                  height: 100,
                  // width: 80,

                  // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.background,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2.5,
                        color: AppColors.containerShadowColor,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/Package.svg',
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '15',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('Farm Advisory'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: appointmentController.consultationTabController,
            children: [
              buildAppointmentTab(1),
              buildDiseaseTab(2),
              buildFarmAdvisoryTab(3),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildFarmVisit() {
  final AppointmentController appointmentController = Get.put(
    AppointmentController(),
  );
  return Container(
    child: Column(
      children: [
        SizedBox(height: 5),
        TabBar(
          controller: appointmentController.consultationTabController,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          labelColor: AppColors.primaryGradinatMixColor,
          unselectedLabelColor: AppColors.textSecondary,
          labelPadding: EdgeInsets.all(0),
          tabs: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),

              color: Colors.transparent,
              child: Tab(
                child: Container(
                  height: 100,
                  // width: 80,
                  // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.background,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2.5,
                        color: AppColors.containerShadowColor,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/Package.svg',
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '15',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('Appointment'),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),

              color: Colors.transparent,
              child: Tab(
                child: Container(
                  height: 100,

                  // width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.background,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2.5,
                        color: AppColors.containerShadowColor,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/Package.svg',
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '15',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('Disease'),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),

              color: Colors.transparent,
              child: Tab(
                child: Container(
                  height: 100,
                  // width: 80,

                  // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.background,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2.5,
                        color: AppColors.containerShadowColor,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/Package.svg',
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '15',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('Farm Advisory'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: appointmentController.consultationTabController,
            children: [
              buildPendingTab(1),
              buildProcessingTab(),
              builConfirmedTab(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildAppointmentTab(int Tabindex) {
  final AppointmentController appointmentController = Get.put(
    AppointmentController(),
  );
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: AppColors.border,
              offset: Offset(0, 1),
              spreadRadius: 1,
            ),
          ],
        ),
        child: TabBar(
          isScrollable: false,
          physics: NeverScrollableScrollPhysics(),
          controller: appointmentController.threeTabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          dividerHeight: 0,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.primaryGradinatMixColor,
          ),
          labelColor: AppColors.white,
          labelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelColor: AppColors.textSecondary,
          tabs: [
            Tab(text: 'Pending'),
            Tab(text: 'In Process'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      Expanded(
        child: TabBarView(
          controller: appointmentController.threeTabController,
          children: [
            buildPendingTab(Tabindex),
            buildProcessingTab(),
            builConfirmedTab(),
          ],
        ),
      ),
    ],
  );
}

Widget buildDiseaseTab(int Tabindex) {
  final AppointmentController appointmentController = Get.put(
    AppointmentController(),
  );
  // print('Tab index in desease ${Tabindex}')
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: AppColors.border,
              offset: Offset(0, 1),
              spreadRadius: 1,
            ),
          ],
        ),
        child: TabBar(
          isScrollable: false,
          physics: NeverScrollableScrollPhysics(),
          controller: appointmentController.threeTabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          dividerHeight: 0,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.primaryGradinatMixColor,
          ),
          labelColor: AppColors.white,
          labelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelColor: AppColors.textSecondary,
          tabs: [
            Tab(text: 'Pending'),
            Tab(text: 'In Process'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      Expanded(
        child: TabBarView(
          controller: appointmentController.threeTabController,
          children: [
            buildPendingTab(Tabindex),
            buildProcessingTab(),
            builConfirmedTab(),
          ],
        ),
      ),
    ],
  );
}

Widget buildFarmAdvisoryTab(int Tabindex) {
  final AppointmentController appointmentController = Get.put(
    AppointmentController(),
  );
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: AppColors.border,
              offset: Offset(0, 1),
              spreadRadius: 1,
            ),
          ],
        ),
        child: TabBar(
          isScrollable: false,
          physics: NeverScrollableScrollPhysics(),
          controller: appointmentController.threeTabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          dividerHeight: 0,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.primaryGradinatMixColor,
          ),
          labelColor: AppColors.white,
          labelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelColor: AppColors.textSecondary,
          tabs: [
            Tab(text: 'Pending'),
            Tab(text: 'In Process'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      Expanded(
        child: TabBarView(
          controller: appointmentController.threeTabController,
          children: [
            buildPendingTab(Tabindex),
            buildProcessingTab(),
            builConfirmedTab(),
          ],
        ),
      ),
    ],
  );
}

Widget buildPendingTab(int Tabindex) {
  // print(' this is index for tab' + Tabindex.toString());
  final AppointmentController appointmentController = Get.put(
    AppointmentController(),
  );
  final RxInt currentIndex = 0.obs;

  return Obx(() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: appointmentController.apointment.length,
      itemBuilder: (context, index) {
        var appointmentData = appointmentController.apointment[index];
        // Get the crop images for the current appointment
        List<String> cropImages = List<String>.from(
          appointmentData['cropimage'],
        );
        String userName = appointmentData['user'];
        String cropName = appointmentData['cropName'];
        print(
          'on press button accepted value =  ${appointmentController.isaccepted}',
        );
        return GestureDetector(
          onTap: () {
            Get.to(() => AppointmentDetails(), arguments: currentIndex);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.background,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2.5,
                  offset: Offset(0, 2), // Natural shadow
                  color: AppColors.containerShadowColor,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Prevents Expanded issues
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.green,
                      radius: 20, // Ensuring proper avatar size
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                userName,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Free', // You can adjust this based on your data
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 1.5),
                          Text(
                            '1.0 KM • Sector 4L', // Adjust this if you have location data
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.message, color: AppColors.green),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () async {
                        final Uri phoneUri = Uri(
                          scheme: 'tel',
                          path: '9277103055',
                        );
                        if (await canLaunchUrl(phoneUri)) {
                          await launchUrl(phoneUri);
                        } else {
                          // Optionally show an error
                          print('Could not launch dialer');
                        }
                      },
                      child: Icon(Icons.call, color: AppColors.yellow),
                    ),
                  ],
                ),
                Divider(color: AppColors.primaryGradinatMixColor),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 130,
                      width: 80,
                      child: GestureDetector(
                        onTap: () {
                          Get.dialog(buildImagePopUp(index));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 15),
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 90, // Adjust height
                                autoPlay: true, // Auto-slide
                                enlargeCenterPage:
                                    true, // Zoom effect on center image
                                aspectRatio: 16 / 9,
                                viewportFraction:
                                    0.8, // Show partial next/previous image
                              ),
                              items:
                                  cropImages.map((imagePath) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        imagePath,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    );
                                  }).toList(),
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Get.dialog(buildImagePopUp(index));
                              },
                              child: Text(
                                'View All',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.error,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cropName,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              // SizedBox(width:  0.5),
                              Text(
                                '01 Apr 25, 13:09', // Adjust this if you have location data
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryGradinatMixColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.lightGrey,
                            ),
                            child: Center(
                              child: Text(
                                'Reddish - brown pustules on a wheat stem will turn black as it decays',
                                style: GoogleFonts.montserrat(fontSize: 12),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 95,
                                child: CustomGradientButton(
                                  gradientColors: [
                                    AppColors.yellow,
                                    AppColors.yellow,
                                  ],
                                  borderRadius: 10,
                                  text: 'Reject',
                                  onPressed: () {
                                    // Remove the current appointment
                                    // appointmentController.removeAppointment(
                                    //   index,
                                    // );
                                    Get.dialog(buildCaution());
                                    // appointmentController.rejected_index.value = [index];
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 40,
                                width: 95,
                                child: CustomGradientButton(
                                  borderRadius: 10,
                                  text:
                                      Tabindex == 1 ||
                                              appointmentController
                                                      .isaccepted
                                                      .value ==
                                                  false
                                          ? 'Accept'
                                          : Tabindex == 2
                                          ? 'Reply'
                                          : "Advise",
                                  onPressed: () {
                                    appointmentController.isaccepted.value =
                                        true;
                                    // !appointmentController.isaccepted.value;
                                    Tabindex != 1
                                        ? Get.to(
                                          () => Reply(),
                                          arguments: currentIndex,
                                        )
                                        : '';
                                    // print(
                                    //   'on press button accepted value =  ${appointmentController.isaccepted}',
                                    // );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  });
}

Widget buildProcessingTab() {
  final AppointmentController appointmentController = Get.put(
    AppointmentController(),
  );
  final RxInt currentIndex = 1.obs;

  return Obx(() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: appointmentController.apointment.length,
      itemBuilder: (context, index) {
        var appointmentData = appointmentController.apointment[index];

        // Get the crop images for the current appointment
        List<String> cropImages = List<String>.from(
          appointmentData['cropimage'],
        );
        String userName = appointmentData['user'];
        String cropName = appointmentData['cropName'];

        return GestureDetector(
          onTap: () {
            Get.to(() => AppointmentDetails(), arguments: currentIndex);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.background,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2.5,
                  offset: Offset(0, 2), // Natural shadow
                  color: AppColors.containerShadowColor,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Prevents Expanded issues
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.green,
                      radius: 20, // Ensuring proper avatar size
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                userName,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Free', // You can adjust this based on your data
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 1.5),
                          Text(
                            '1.0 KM • Sector 4L', // Adjust this if you have location data
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.message, color: AppColors.green),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () async {
                        final Uri phoneUri = Uri(
                          scheme: 'tel',
                          path: '9277103055',
                        );
                        if (await canLaunchUrl(phoneUri)) {
                          await launchUrl(phoneUri);
                        } else {
                          // Optionally show an error
                          print('Could not launch dialer');
                        }
                      },
                      child: Icon(Icons.call, color: AppColors.yellow),
                    ),
                  ],
                ),
                Divider(color: AppColors.primaryGradinatMixColor),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 130,
                      width: 80,
                      child: GestureDetector(
                        onTap: () {
                          Get.dialog(buildImagePopUp(index));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 15),
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 90, // Adjust height
                                autoPlay: true, // Auto-slide
                                enlargeCenterPage:
                                    true, // Zoom effect on center image
                                aspectRatio: 16 / 9,
                                viewportFraction:
                                    0.8, // Show partial next/previous image
                              ),
                              items:
                                  cropImages.map((imagePath) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        imagePath,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    );
                                  }).toList(),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'View All',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cropName,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              // SizedBox(width:  0.5),
                              Text(
                                '01 Apr 25, 13:09', // Adjust this if you have location data
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryGradinatMixColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.lightGrey,
                            ),
                            child: Center(
                              child: Text(
                                'Reddish - brown pustules on a wheat stem will turn black as it decays',
                                style: GoogleFonts.montserrat(fontSize: 12),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 95,
                                child: CustomGradientButton(
                                  gradientColors: [
                                    AppColors.yellow,
                                    AppColors.yellow,
                                  ],
                                  borderRadius: 10,
                                  text: 'Solved',
                                  onPressed: () {
                                    appointmentController.removeAppointment(
                                      index,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 40,
                                width: 95,
                                child: CustomGradientButton(
                                  borderRadius: 10,
                                  text: 'Processing',
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  });
}

Widget builConfirmedTab() {
  final AppointmentController appointmentController = Get.put(
    AppointmentController(),
  );
  final RxInt currentIndex = 2.obs;

  return Obx(() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: appointmentController.apointment.length,
      itemBuilder: (context, index) {
        var appointmentData = appointmentController.apointment[index];

        // Get the crop images for the current appointment
        List<String> cropImages = List<String>.from(
          appointmentData['cropimage'],
        );
        String userName = appointmentData['user'];
        String cropName = appointmentData['cropName'];
        return GestureDetector(
          onTap: () {
            Get.to(() => AppointmentDetails(), arguments: currentIndex);
            appointmentController.isComlete.value = true;
            print('object');
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.background,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2.5,
                  offset: Offset(0, 2), // Natural shadow
                  color: AppColors.containerShadowColor,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Prevents Expanded issues
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.green,
                      radius: 20, // Ensuring proper avatar size
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                userName,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Free', // You can adjust this based on your data
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 1.5),
                          Text(
                            '1.0 KM • Sector 4L', // Adjust this if you have location data
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.message, color: AppColors.green),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () async {
                        final Uri phoneUri = Uri(
                          scheme: 'tel',
                          path: '9277103055',
                        );
                        if (await canLaunchUrl(phoneUri)) {
                          await launchUrl(phoneUri);
                        } else {
                          // Optionally show an error
                          print('Could not launch dialer');
                        }
                      },
                      child: Icon(Icons.call, color: AppColors.yellow),
                    ),
                  ],
                ),
                Divider(color: AppColors.primaryGradinatMixColor),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 130,
                      width: 80,
                      child: GestureDetector(
                        onTap: () {
                          Get.dialog(buildImagePopUp(index));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 15),
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 90, // Adjust height
                                autoPlay: true, // Auto-slide
                                enlargeCenterPage:
                                    true, // Zoom effect on center image
                                aspectRatio: 16 / 9,
                                viewportFraction:
                                    0.8, // Show partial next/previous image
                              ),
                              items:
                                  cropImages.map((imagePath) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        imagePath,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    );
                                  }).toList(),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'View All',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cropName,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              // SizedBox(width:  0.5),
                              Text(
                                '01 Apr 25, 13:09', // Adjust this if you have location data
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryGradinatMixColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.lightGrey,
                            ),
                            child: Center(
                              child: Text(
                                'Reddish - brown pustules on a wheat stem will turn black as it decays',
                                style: GoogleFonts.montserrat(fontSize: 12),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          CustomGradientButton(
                            borderRadius: 10,
                            // width: 100,
                            height: 40,
                            text: 'Completed',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  });
}

// Widget buildOfflineTab() {
//   final AppointmentController appointmentController = Get.put(
//     AppointmentController(),
//   );

//   return Obx(() {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: appointmentController.apointment.length,
//       itemBuilder: (context, index) {
//         var appointmentData = appointmentController.apointment[index];
//         // Get the crop images for the current appointment
//         List<String> cropImages = List<String>.from(
//           appointmentData['cropimage'],
//         );
//         String userName = appointmentData['user'];
//         String cropName = appointmentData['cropName'];
//         return Container(
//           margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//           decoration: BoxDecoration(
//             color: AppColors.background,
//             boxShadow: [
//               BoxShadow(
//                 spreadRadius: 1,
//                 blurRadius: 2.5,
//                 offset: Offset(0, 2), // Natural shadow
//                 color: AppColors.containerShadowColor,
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min, // Prevents Expanded issues
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: AppColors.green,
//                     radius: 20, // Ensuring proper avatar size
//                     child: Icon(Icons.person, color: Colors.white),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               userName,
//                               style: GoogleFonts.montserrat(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w700,
//                                 color: AppColors.textPrimary,
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Text(
//                               'Free', // You can adjust this based on your data
//                               style: GoogleFonts.montserrat(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         // SizedBox(height: 1.5),
//                         Text(
//                           '1.0 KM • Sector 4L', // Adjust this if you have location data
//                           style: GoogleFonts.montserrat(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.textSecondary,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Icon(Icons.message, color: AppColors.green),
//                   SizedBox(width: 20),
//                   Icon(Icons.call, color: AppColors.yellow),
//                 ],
//               ),
//               Divider(color: AppColors.primaryGradinatMixColor),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 130,
//                     width: 80,
//                     child: GestureDetector(
//                       onTap: () {
//                         Get.dialog(buildImagePopUp(index));
//                       },
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 15),
//                           CarouselSlider(
//                             options: CarouselOptions(
//                               height: 90, // Adjust height
//                               autoPlay: true, // Auto-slide
//                               enlargeCenterPage:
//                                   true, // Zoom effect on center image
//                               aspectRatio: 16 / 9,
//                               viewportFraction:
//                                   0.8, // Show partial next/previous image
//                             ),
//                             items:
//                                 cropImages.map((imagePath) {
//                                   return ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.asset(
//                                       imagePath,
//                                       fit: BoxFit.cover,
//                                       width: double.infinity,
//                                     ),
//                                   );
//                                 }).toList(),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             'View All',
//                             style: GoogleFonts.montserrat(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.error,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               cropName,
//                               style: GoogleFonts.montserrat(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w700,
//                                 color: AppColors.textPrimary,
//                               ),
//                             ),
//                             // SizedBox(width:  0.5),
//                             Text(
//                               '01 Apr 25, 13:09', // Adjust this if you have location data
//                               style: GoogleFonts.montserrat(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.primaryGradinatMixColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         Container(
//                           padding: EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: AppColors.lightGrey,
//                           ),
//                           child: Center(
//                             child: Text(
//                               'Reddish - brown pustules on a wheat stem will turn black as it decays',
//                               style: GoogleFonts.montserrat(fontSize: 12),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             SizedBox(
//                               height: 40,
//                               width: 95,
//                               child: CustomGradientButton(
//                                 gradientColors: [
//                                   AppColors.yellow,
//                                   AppColors.yellow,
//                                 ],
//                                 borderRadius: 10,
//                                 text: 'Reject',
//                                 onPressed: () {
//                                   // Remove the current appointment
//                                   appointmentController.removeAppointment(
//                                     index,
//                                   );
//                                 },
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             SizedBox(
//                               height: 40,
//                               width: 95,
//                               child: CustomGradientButton(
//                                 borderRadius: 10,
//                                 text: 'Accept',
//                                 onPressed: () {},
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   });
// }

Widget buildImagePopUp(int index) {
  final AppointmentController appointmentController =
      Get.find<AppointmentController>();

  return Obx(() {
    if (appointmentController.apointment.isEmpty ||
        index >= appointmentController.apointment.length) {
      return SizedBox(); // Handle case where index is out of bounds
    }

    var appointmentData = appointmentController.apointment[index];

    List<String> cropImages = List<String>.from(
      appointmentData['cropimage'] ?? [],
    );
    return AlertDialog(
      backgroundColor: AppColors.lightGrey.withOpacity(0.8),
      contentPadding: EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.close, color: AppColors.error),
                  ),
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 350,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
                items:
                    cropImages.map((imagePath) {
                      return GestureDetector(
                        onTap: () {
                          Get.dialog(
                            Dialog(
                              backgroundColor: Colors.black,
                              insetPadding: EdgeInsets.all(0),
                              child: Stack(
                                children: [
                                  InteractiveViewer(
                                    panEnabled: true,
                                    minScale: 1.0,
                                    maxScale: 4.0,
                                    child: Center(
                                      child: Image.asset(
                                        imagePath,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    right: 20,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => Get.back(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  });
}

Widget buildCaution() {
  final AppointmentController appointmentController =
      Get.find<AppointmentController>();
  return Container(
    height: 150,
    child: AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.close, color: AppColors.error),
          ),
        ],
      ),
      content: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svgs/alert_triangel.svg',
              color: AppColors.error,
            ),
            // SizedBox(height: 10),
            Text('Are You sure want to reject'),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomGradientButton(
                gradientColors: [AppColors.green, AppColors.green],
                height: 35,
                borderRadius: 10,
                text: 'Cancel',
                onPressed: () {
                  // appointmentController.removeAppointment(index);
                  Get.back();
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomGradientButton(
                gradientColors: [AppColors.error, AppColors.error],
                text: 'Reject',
                onPressed: () {
                  // appointmentController.removeAppointment(index);.
                  Get.back();
                },
                height: 35,
                borderRadius: 10,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
