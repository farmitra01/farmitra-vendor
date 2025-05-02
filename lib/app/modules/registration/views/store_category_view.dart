import 'package:dotted_border/dotted_border.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/data/models/store_category_model/store_category_model.dart';
import 'package:farmitra/app/modules/kyc_documents/views/rental_kyc.dart';
import 'package:farmitra/app/modules/registration/controllers/store_category_controller.dart';
import 'package:farmitra/app/modules/registration/controllers/store_selected_module_controller.dart';
import 'package:farmitra/app/modules/registration/views/retailer_store_details_form.dart';
import 'package:farmitra/app/utils/global_widgets/custom_gradiant_button.dart';
import 'package:farmitra/app/utils/global_widgets/custome_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    // Handle null arguments with a fallback
    final previousPageGridTitle =
        Get.arguments?.toString() ?? 'Default Category';

    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        onHelpTap: () {
          Get.toNamed('/help-center');
        },
        onTranslateTap: () {
          Get.toNamed('/add');
        },
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
                              previousPageGridTitle,
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
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              'Edit     ',
                              style: GoogleFonts.montserrat(
                                color: AppColors.primaryGradinatMixColor,
                                fontSize: 14,
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
                        gradient: const LinearGradient(
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
                'Select Rental Services Category -',
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
                if (controller.gridContent.isEmpty &&
                    controller.rentalCategoriesList.isEmpty &&
                    controller.droneCategoryList.isEmpty &&
                    controller.inputSuppliesCategoriesList.isEmpty &&
                    controller.farmEquipmentMachinaryCategoriesList.isEmpty &&
                    controller.farmToolsCategoriesList.isEmpty &&
                    controller
                        .agriServicesInfrastructureCategoriesList
                        .isEmpty &&
                    controller.animalHusbandryCategoriesList.isEmpty &&
                    controller.organicNaturalFarmingCategoriesList.isEmpty &&
                    controller
                        .ValueAdditionFoodProcessingCategoriesList
                        .isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Use null-safe trim with fallback
                final title = previousPageGridTitle.trim();

                final isRental = title == 'Rental';
                final isDrone = title == 'Drone';
                final isRetailer = title == 'Input Supplies';
                final isFarmEquipment = title == 'Farm Equipment & Machinery';
                final isFarmTool = title == 'Farm Tools';
                final isAgriServices =
                    title == 'Agri-Services & Infrastructure';
                final isAnimalHusbandry = title == 'Animal Husbandry';
                final isOrganicFarming = title == 'Organic & Natural Farming';
                final isValueAddition =
                    title == 'Value Addition / Food Processing';

                final itemCount =
                    isRental
                        ? controller.rentalCategoriesList.length
                        : isDrone
                        ? controller.droneCategoryList.length
                        : isRetailer
                        ? controller.inputSuppliesCategoriesList.length
                        : isFarmEquipment
                        ? controller.farmEquipmentMachinaryCategoriesList.length
                        : isFarmTool
                        ? controller.farmToolsCategoriesList.length
                        : isAgriServices
                        ? controller
                            .agriServicesInfrastructureCategoriesList
                            .length
                        : isAnimalHusbandry
                        ? controller.animalHusbandryCategoriesList.length
                        : isOrganicFarming
                        ? controller.organicNaturalFarmingCategoriesList.length
                        : isValueAddition
                        ? controller
                            .ValueAdditionFoodProcessingCategoriesList
                            .length
                        : controller.gridContent.length;

                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    String? svgImage;
                    IconData? iconData;
                    String label = '';
                    bool setImage = false;

                    if (isRental) {
                      iconData = controller.rentalCategoriesList[index]['Icon'];
                      label = controller.rentalCategoriesList[index]['name'];
                    } else if (isDrone) {
                      svgImage =
                          controller.droneCategoryList[index]['svgImaga'];
                      label = controller.droneCategoryList[index]['name'];
                    } else if (isRetailer) {
                      svgImage =
                          controller
                              .inputSuppliesCategoriesList[index]
                              .Imagepath;
                      label =
                          controller.inputSuppliesCategoriesList[index].text;
                      setImage = svgImage != null && svgImage.isNotEmpty;
                    } else if (isFarmEquipment) {
                      svgImage =
                          controller
                              .farmEquipmentMachinaryCategoriesList[index]
                              .Imagepath;
                      label =
                          controller
                              .farmEquipmentMachinaryCategoriesList[index]
                              .text;
                      setImage = svgImage != null && svgImage.isNotEmpty;
                    } else if (isFarmTool) {
                      svgImage =
                          controller.farmToolsCategoriesList[index].Imagepath;
                      label = controller.farmToolsCategoriesList[index].text;
                      setImage = svgImage != null && svgImage.isNotEmpty;
                    } else if (isAgriServices) {
                      svgImage =
                          controller
                              .agriServicesInfrastructureCategoriesList[index]
                              .Imagepath;
                      label =
                          controller
                              .agriServicesInfrastructureCategoriesList[index]
                              .text;
                      setImage = svgImage != null && svgImage.isNotEmpty;
                    } else if (isAnimalHusbandry) {
                      svgImage =
                          controller
                              .animalHusbandryCategoriesList[index]
                              .Imagepath;
                      label =
                          controller.animalHusbandryCategoriesList[index].text;
                      setImage = svgImage != null && svgImage.isNotEmpty;
                    } else if (isOrganicFarming) {
                      svgImage =
                          controller
                              .organicNaturalFarmingCategoriesList[index]
                              .Imagepath;
                      label =
                          controller
                              .organicNaturalFarmingCategoriesList[index]
                              .text;
                      setImage = svgImage != null && svgImage.isNotEmpty;
                    } else if (isValueAddition) {
                      svgImage =
                          controller
                              .ValueAdditionFoodProcessingCategoriesList[index]
                              .Imagepath;
                      label =
                          controller
                              .ValueAdditionFoodProcessingCategoriesList[index]
                              .text;
                      setImage = svgImage != null && svgImage.isNotEmpty;
                    } else {
                      final item = controller.gridContent[index];
                      svgImage = item.Imagepath;
                      label = item.text;
                      setImage = svgImage != null && svgImage.isNotEmpty;
                    }

                    return Obx(() {
                      final isSelected = controller.selectedItems.contains(
                        index,
                      );

                      return GestureDetector(
                        onTap: () => controller.toggleSelection(index),
                        child: Container(
                          margin: const EdgeInsets.all(5),
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
                                if (isRental && iconData != null)
                                  Icon(
                                    iconData,
                                    color:
                                        isSelected
                                            ? AppColors.textPrimary
                                            : AppColors.textSecondary,
                                  )
                                else if ((isDrone ||
                                        isRetailer ||
                                        isFarmEquipment ||
                                        isFarmTool ||
                                        isAgriServices ||
                                        isAnimalHusbandry ||
                                        isOrganicFarming ||
                                        isValueAddition ||
                                        setImage) &&
                                    svgImage != null)
                                  SvgPicture.asset(
                                    svgImage,
                                    height: 28,
                                    color:
                                        isSelected
                                            ? AppColors.textPrimary
                                            : AppColors.textSecondary,
                                  )
                                else
                                  const Icon(Icons.star_border_outlined),
                                const SizedBox(height: 5),
                                Text(
                                  label,
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
                                      onTap: () => showInfoBottomSheet(context),
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
              }),
              GestureDetector(
                onTap: () {
                  showBottomSheet(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: AppColors.border,
                    radius: const Radius.circular(10),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 110,
                        width: 90,
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
                storeSelectedModuleController.PreviousSelectedValue ==
                        'As a Retailer'
                    ? Get.to(() => RetailerStoreDetailsFrom())
                    : Get.toNamed(
                      '/store_details_form',
                      arguments: previousPageGridTitle,
                    );
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

// Rest of the code (showBottomSheet and showInfoBottomSheet) remains unchanged
void showBottomSheet(BuildContext context) {
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
                  onTap: () {
                    Get.back();
                  },
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
                    var item = StoreCategoryModel(
                      text: controller.customeCategory.text,
                      Imagepath:
                          'assets/icons/store_category_grid_icons/grocery&general.svg',
                    );
                    controller.addGridItem(item);
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
                onTap: () {
                  Get.back();
                },
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
              'Baby Care/Beauty/Bath Essentials/Breakfast, Snacks & Sweets/Ready To Eat/Milk & Dairy Products/Grocery Item/Oral Care/Spices, Sauces & Spreads/Beverages & Health Drinks/Home Care & Cleaning/Household/Fragrances/Stationary/Organic.',
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
