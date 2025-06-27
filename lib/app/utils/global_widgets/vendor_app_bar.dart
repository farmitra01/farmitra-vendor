import 'package:farmitra/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VendorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showTitle; // Control whether to show the title

  const VendorAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.showTitle = true, // Default to showing the title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = GoogleFonts.montserrat(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color:  AppColors.white,
    );

    final double titleWidth = showTitle
        ? (TextPainter(
            text: TextSpan(text: title, style: titleStyle),
            maxLines: 1,
            textDirection: TextDirection.ltr,
          )..layout())
            .width
        : 0;

    return AppBar(
      leadingWidth: showTitle
          ? titleWidth + 75
          : 50, // Adjust leading width based on title visibility
      backgroundColor: AppColors.appBarColor,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          width: 50, // Fixed width to ensure proper alignment
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          margin: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: AppColors.white),
          ),
          alignment:
              Alignment.center, // Ensures icon is centered when title is hidden
          child: showTitle
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.keyboard_backspace_sharp,
                      color: AppColors.white,
                      size: 18,
                    ),
                    Text(title, style: titleStyle),
                  ],
                )
              : const Icon(
                  Icons.arrow_back, // Use arrow_back when title is hidden
                  color: AppColors.white,
                  size: 18,
                ),
        ),
      ),
      centerTitle: false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
