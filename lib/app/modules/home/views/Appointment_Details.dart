import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/home/controllers/Appointment_Details_Controller.dart';
import 'package:farmitra/app/modules/home/controllers/appointment_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/vendor_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final AppointmentDetailsController appointmentDetailsController = Get.put(
      AppointmentDetailsController(),
    );
    final AppointmentController appointmentController = Get.put(
      AppointmentController(),
    );

    final RxInt tabIndex = Get.arguments;
    print('Selected Tab index = ${tabIndex}');
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: VendorAppBar(title: 'Appointment Details'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // Reduced vertical padding
              color: AppColors.background,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primaryGradinatMixColor,
                          radius: 20,
                          child: Icon(Icons.person, color: AppColors.white),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Amit Singh',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryGradinatMixColor,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Free',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.yellow,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '1.0 KM • Sector 4L',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryGradinatMixColor,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.message,
                          color: AppColors.primaryGradinatMixColor,
                        ),
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
                  ),
                  Divider(color: AppColors.primaryGradinatMixColor),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wheat',
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
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Get.dialog(buildImagePopUp(index));
              },
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200, // Adjust height
                  autoPlay: true, // Auto-slide
                  enlargeCenterPage: true, // Zoom effect on center image
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8, // Show partial next/previous image
                ),
                items:
                    appointmentDetailsController.cropImage.map((imagePath) {
                      return InteractiveViewer(
                        maxScale: 1.4,
                        minScale: 1.4,
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
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Details'),
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.lightGrey,
              ),
              child: Center(
                child: Text(
                  '''Reddish-brown pustules on a wheat stem are a common symptom of stem rust, a serious fungal disease caused by *Puccinia graminis f. sp. tritici*. These pustules often appear elongated and slightly raised, breaking through the surface of the stem, leaf sheaths, and even leaf blades. Initially, potentially carrying over to the next crop cycle. The presence of these black pustules can weaken the plant structure, making the stem brittle and prone to lodging (falling over), which can result in significant yield loss. Stem rust thrives in warm, moist environments and can spread rapidly under favorable conditions. Its historical impact on wheat production has been devastating in many parts of the world. Therefore, timely identification and management of the disease are crucial. Resistant wheat varieties, crop rotation, and fungicidal sprays are commonly used strategies to control its spread and protect wheat crops from severe damage.''',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            Obx(() {
              return tabIndex.value == 2
                  ? SizedBox.shrink()
                  : Expanded(
                    child: CustomGradientButton(
                      text: tabIndex.value == 0 ? 'Reject' : 'Solved',
                      onPressed: () {
                        Get.dialog(buildCaution());
                      },
                      gradientColors: [AppColors.yellow, AppColors.yellow],
                      borderRadius: 10,
                    ),
                  );
            }),
            SizedBox(width: 10),
            Expanded(
              child: Obx(
                () => CustomGradientButton(
                  text:
                      tabIndex.value == 0
                          ? 'Accept'
                          : tabIndex.value == 1
                          ? 'Processing'
                          : tabIndex.value == 2
                          ? 'Completed'
                          : 'Accept',
                  onPressed: () {},
                  borderRadius: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
