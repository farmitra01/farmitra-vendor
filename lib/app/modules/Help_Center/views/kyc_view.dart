import 'package:farmitra/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KycView extends GetView {
  const KycView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    'KYC',
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
      ),
      body: const Center(
        child: Text('KycView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
