import 'dart:math';

import 'package:farmitra/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqGridPagesView extends GetView {
  final String Title;
  const FaqGridPagesView({Key? key, required this.Title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff373A60),
        leadingWidth: double.tryParse('175'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    Get.arguments['title'],
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffDADADA),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FAQ',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Card(
                    child: ExpansionTile(
                      collapsedIconColor: Colors.grey.shade800,
                      iconColor: Colors.grey.shade800,
                      title: Text("Coming Soon..."),
                      children: <Widget>[
                        ListTile(
                          title: Text("Coming Soon..."),
                        ),
                        ListTile(
                          title: Text("Coming Soon..."),
                        )
                      ],
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                      ),
                      collapsedShape:
                          RoundedRectangleBorder(side: BorderSide.none),
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
