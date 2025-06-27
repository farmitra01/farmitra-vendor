import 'package:dotted_border/dotted_border.dart';
import 'package:farmitra/app/ApiModels/getModuleSubCategory.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/modules/registration/controllers/store_category_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_selected_module_controller.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custome_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreCategoryView extends GetView<StoreCategoryController> {
  StoreCategoryView({super.key});

  @override
  final StoreCategoryController controller = Get.put(StoreCategoryController());
  final StoreSelectedModuleController storeSelectedModuleController = Get.put(
    StoreSelectedModuleController(),
  );

  @override
  Widget build(BuildContext context) {
    final previousPageGridTitle =
        Get.arguments?.toString() ?? 'id:0,name:Default Category';
    String? categoryId;
    String? categoryName;
    if (previousPageGridTitle.isNotEmpty) {
      final parts = previousPageGridTitle.split(',');
      for (var part in parts) {
        if (part.startsWith('id:')) {
          categoryId = part.split(':')[1];
        } else if (part.startsWith('name:')) {
          categoryName = part.split(':')[1];
        }
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        onHelpTap: () => Get.toNamed('/help-center'),
        onTranslateTap: () => Get.toNamed('/add'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              categoryName ?? 'Unknown',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Text(
                              'Edit     ',
                              style: GoogleFonts.montserrat(
                                color: AppColors.primaryGradinatMixColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 45,
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primaryFirstGradiant,
                            AppColors.primarySecondGradiant,
                          ],
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 15,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.primaryFirstGradiant,
                                  AppColors.primarySecondGradiant,
                                ],
                              ),
                            ),
                            child: const CircleAvatar(
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  size: 15,
                                  color: AppColors.white,
                                ),
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Select Expert Service Categories -',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'A category that describes your business well.',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 10),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryGradinatMixColor,
                    ),
                  );
                } else if (controller.gridContent.isEmpty) {
                  return const Center(
                    child: Text('No subcategories available'),
                  );
                } else {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.85,
                        ),
                    itemCount: controller.gridContent.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        final item = controller.gridContent[index];
                        final isSelected =
                            controller.selectedItems.contains(index) ||
                            controller.selectedIndex.value == index;

                        return GestureDetector(
                          onTap: () {
                            controller.selectItem(index);
                            controller.toggleSelection(index);
                          },
                          child: Container(
                            // margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:
                                    isSelected
                                        ? AppColors.primaryGradinatMixColor
                                        : AppColors.border,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (item.imagePath != null &&
                                      item.imagePath!.isNotEmpty)
                                    SvgPicture.asset(
                                      item.imagePath!,
                                      height: 28,
                                      color:
                                          isSelected
                                              ? AppColors.textPrimary
                                              : AppColors.textSecondary,
                                    )
                                  else
                                    Icon(
                                      Icons.category,
                                      color:
                                          isSelected
                                              ? AppColors.textPrimary
                                              : AppColors.textSecondary,
                                    ),
                                  const SizedBox(height: 5),
                                  Text(
                                    item.name ?? 'Unknown',
                                    maxLines: 3,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          isSelected
                                              ? AppColors.textPrimary
                                              : AppColors.textSecondary,
                                    ),
                                  ),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 5,
                                        bottom: 5,
                                      ),
                                      child: GestureDetector(
                                        onTap:
                                            () => showInfoBottomSheet(context),
                                        child: const Icon(
                                          Icons.error_outline_rounded,
                                          size: 20,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  );
                }
              }),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => showBottomSheet(context, categoryId: categoryId),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  color: AppColors.border,
                  radius: const Radius.circular(10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: 120,
                      width: 95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.add_circle_sharp,
                            color: AppColors.secondary,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Custom',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomGradientButton(
              text: 'Proceed',
              onPressed: () {
                if (controller.selectedIndex.value >= 0 &&
                    controller.gridContent.isNotEmpty) {
                  final selectedItem =
                      controller.gridContent[controller.selectedIndex.value];
                  final argument =
                      'id:${selectedItem.id},name:${selectedItem.name ?? 'Unknown'}';
                  if (storeSelectedModuleController.previousSelectedValue ==
                      'As a Retailer') {
                    Get.toNamed(
                      '/retailer_store_details_form',
                      arguments: argument,
                    );
                  } else {
                    Get.toNamed('/store_details_form', arguments: argument);
                  }
                } else {
                  Get.snackbar('Error', 'Please select a category');
                }
              },
            ),
            const SizedBox(height: 10),
            Text(
              "You Can’t Skip this step",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showBottomSheet(BuildContext context, {String? categoryId}) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final StoreCategoryController controller = Get.find();

  Get.bottomSheet(
    Form(
      key: formKey,
      child: Container(
        height: 250,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                ShaderMask(
                  shaderCallback:
                      (bounds) => const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primaryFirstGradiant,
                          AppColors.primarySecondGradiant,
                        ],
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                  child: Text(
                    'Add custom category:',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.cancel, color: Color(0xff636363)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Give a name to your custom category',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xff636363),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.customeCategory,
              decoration: InputDecoration(
                hintText: "Custom Category",
                hintStyle: const TextStyle(
                  color: Color(0xff636363),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: AppColors.primaryGradinatMixColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Color(0xffDADADA)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Category Name';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryFirstGradiant,
                    AppColors.primarySecondGradiant,
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final now = DateTime.now().toIso8601String();
                    final item = ModuleSubCategory(
                      id: -(controller.gridContent.length + 1),
                      name: controller.customeCategory.text,
                      moduleCategoryId: int.tryParse(categoryId ?? '0') ?? 0,
                      description: 'Custom category',
                      status: 'active',
                      createdAt: now,
                      updatedAt: now,
                      imagePath: 'assets/svgs/default_category.svg',
                    );
                    controller.addGridItem(item);
                    controller.selectItem(controller.gridContent.length - 1);
                    Get.back();
                    controller.customeCategory.clear();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add, color: Colors.white, size: 10),
                    Text(
                      'Add',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.white,
  );
}

void showInfoBottomSheet(BuildContext context) {
  Get.bottomSheet(
    Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ShaderMask(
                shaderCallback:
                    (bounds) => const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primaryFirstGradiant,
                        AppColors.primarySecondGradiant,
                      ],
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/registration_stepper_icons/store.svg',
                      height: 25,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Shop',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.cancel_sharp,
                  color: AppColors.primaryGradinatMixColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Center(
            child: Text(
              'Select a subcategory that best describes your service or product.',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryGradinatMixColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const CircleAvatar(
                  child: Icon(Icons.arrow_back, color: AppColors.white),
                  backgroundColor: AppColors.primaryGradinatMixColor,
                ),
                const Spacer(),
                const CircleAvatar(
                  child: Icon(Icons.arrow_forward, color: AppColors.white),
                  backgroundColor: AppColors.primaryGradinatMixColor,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: true,
  );
}
