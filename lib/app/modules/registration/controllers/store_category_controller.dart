import 'package:farmitra/app/data/models/store_category_model/store_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreCategoryController extends GetxController {
  var selectedItems = <int>{}.obs;
  var previousPageGridTitle = Get.arguments;

  // Toggle selection status of an item
  void toggleSelection(int index) {
    if (selectedItems.contains(index)) {
      selectedItems.remove(index);
    } else {
      selectedItems.add(index);
    }
  }

  // Function to add new item to the grid

  void addGridItem(StoreCategoryModel newItem) {
    gridContent.add(newItem);
  }

  List<StoreCategoryModel> gridContent =
      [
        StoreCategoryModel(
          text: "Field Consulting",
          Imagepath: 'assets/svgs/field_consultation.svg',
        ),
        StoreCategoryModel(
          text: 'Digital Consulting\n',
          Imagepath: 'assets/svgs/digital_consultation.svg',
        ),
        StoreCategoryModel(
          text: 'Training\nWork Shop\n',
          Imagepath: 'assets/svgs/work_shop.svg',
        ),
        StoreCategoryModel(
          text: "Agriculture\nSolution\n",
          Imagepath: 'assets/svgs/agriculture_solution.svg',
        ),
        // StoreCategoryModel(
        //     text: "\n",
        //     Imagepath: 'assets/icons/store_category_grid_icons/computers.svg'),
        // StoreCategoryModel(
        //     text: "Toys\n", Imagepath: 'assets/icons/store_category_grid_icons/toys.svg'),
        // StoreCategoryModel(
        //     text: "Footwear\n", Imagepath: 'assets/icons/store_category_grid_icons/footwear.svg'),
        // StoreCategoryModel(
        //     text: "Electronics\n",
        //     Imagepath: 'assets/icons/store_category_grid_icons/electronics.svg'),
        // StoreCategoryModel(
        //     text: "Stationary\n",
        //     Imagepath: 'assets/icons/store_category_grid_icons/stationary.svg'),
        // StoreCategoryModel(
        //     text: "Tools\n", Imagepath: 'assets/icons/store_category_grid_icons/tools.svg'),
        // StoreCategoryModel(
        //     text: "Sports & Fitness", Imagepath: 'assets/icons/store_category_grid_icons/sports.svg'),
        // StoreCategoryModel(
        //     text: "Pet Care\n", Imagepath: 'assets/icons/store_category_grid_icons/sports.svg'),
      ].obs;

  // Add custom Category ---------

  // List<StoreCategoryModel> retailerContent =
  //     [
  //       StoreCategoryModel(
  //         text: "Grocery & General",
  //         Imagepath:
  //             'assets/icons/store_category_grid_icons/grocery&general.svg',
  //       ),
  //       StoreCategoryModel(
  //         text: 'Gifts\n',
  //         Imagepath: 'assets/icons/store_category_grid_icons/gifts.svg',
  //       ),
  //       StoreCategoryModel(
  //         text: 'Fruits\n',
  //         Imagepath: 'assets/icons/store_category_grid_icons/fruits.svg',
  //       ),
  //       StoreCategoryModel(
  //         text: "Vegetables\n",
  //         Imagepath: 'assets/icons/store_category_grid_icons/vegitable.svg',
  //       ),
  //       StoreCategoryModel(
  //         text: "Computers\n",
  //         Imagepath: 'assets/icons/store_category_grid_icons/computers.svg',
  //       ),
  //       StoreCategoryModel(
  //         text: "Toys\n",
  //         Imagepath: 'assets/icons/store_category_grid_icons/toys.svg',
  //       ),
  //       StoreCategoryModel(
  //         text: "Footwear\n",
  //         Imagepath: 'assets/icons/store_category_grid_icons/footwear.svg',
  //       ),
  //       StoreCategoryModel(
  //         text: "Electronics\n",
  //         Imagepath: 'assets/icons/store_category_grid_icons/electronics.svg',
  //       ),
  //       StoreCategoryModel(
  //         text: "Stationary\n",
  //         Imagepath: 'assets/icons/store_category_grid_icons/stationary.svg',
  //       ),
  //       StoreCategoryModel(
  //         text: "Tools\n",
  //         Imagepath: 'assets/icons/store_category_grid_icons/tools.svg',
  //       ),
  //       StoreCategoryModel(
  //         text: "Sports & Fitness",
  //         Imagepath: 'assets/icons/store_category_grid_icons/sports.svg',
  //       ),
  //       StoreCategoryModel(
  //         text: "Pet Care\n",
  //         Imagepath: 'assets/icons/store_category_grid_icons/sports.svg',
  //       ),
  //     ].obs;

  List<StoreCategoryModel> inputSuppliesCategoriesList =
      [
        StoreCategoryModel(text: "Seeds", Imagepath: 'assets/svgs/seed.svg'),
        StoreCategoryModel(
          text: 'Fertilizers\n',
          Imagepath: 'assets/svgs/fertilizer.svg',
        ),
        StoreCategoryModel(
          text: 'Pesticides\n',
          Imagepath: 'assets/svgs/Pesticides.svg',
        ),
        StoreCategoryModel(
          text: "Soil Conditioners\n",
          Imagepath: 'assets/svgs/plant-root-icon.svg',
        ),
      ].obs;

  List<StoreCategoryModel> farmEquipmentMachinaryCategoriesList =
      [
        StoreCategoryModel(
          text: "Tractors & Implements",
          Imagepath: 'assets/svgs/tractor.svg',
        ),
        StoreCategoryModel(
          text: 'Sprayers\n',
          Imagepath: 'assets/svgs/Sprayers.svg',
        ),
        StoreCategoryModel(
          text: 'Irrigation Equipment\n',
          Imagepath: 'assets/svgs/irrigation Equipment.svg',
        ),
        StoreCategoryModel(
          text: "Harvesting Equipment\n",
          Imagepath: 'assets/svgs/harvesting_equipment.svg',
        ),
      ].obs;

  List<StoreCategoryModel> farmToolsCategoriesList =
      [
        StoreCategoryModel(
          text: "Manual Tools",
          Imagepath: 'assets/svgs/manual_tool.svg',
        ),
        StoreCategoryModel(
          text: 'Protective Gear\n',
          Imagepath: 'assets/svgs/protective_gear.svg',
        ),
      ].obs;

  List<StoreCategoryModel> agriServicesInfrastructureCategoriesList =
      [
        StoreCategoryModel(
          text: "Storage & Post-Harvest",
          Imagepath: 'assets/svgs/storage.svg',
        ),
        StoreCategoryModel(
          text: 'Packaging Materials\n',
          Imagepath: 'assets/svgs/Package.svg',
        ),
        StoreCategoryModel(
          text: 'Polyhouse/Greenhouse Materials\n',
          Imagepath: 'assets/svgs/greenhouse.svg',
        ),
        StoreCategoryModel(
          text: 'Fencing & Enclosures\n',
          Imagepath: 'assets/svgs/fencingenclosures.svg',
        ),
      ].obs;

  List<StoreCategoryModel> animalHusbandryCategoriesList =
      [
        StoreCategoryModel(
          text: "Feed & Fodder",
          Imagepath: 'assets/svgs/feed.svg',
        ),
        StoreCategoryModel(
          text: 'Veterinary Supplies\n',
          Imagepath: 'assets/svgs/veterinarySupplies.svg',
        ),
        StoreCategoryModel(
          text: 'Livestock Equipment\n',
          Imagepath: 'assets/svgs/stock_equipment.svg',
        ),
      ].obs;

  List<StoreCategoryModel> organicNaturalFarmingCategoriesList =
      [
        StoreCategoryModel(
          text: "Organic Inputs",
          Imagepath: 'assets/svgs/organicInputs.svg',
        ),
        StoreCategoryModel(
          text: 'Compost Units\n',
          Imagepath: 'assets/svgs/compostUnits.svg',
        ),
      ].obs;

  List<StoreCategoryModel> ValueAdditionFoodProcessingCategoriesList =
      [
        StoreCategoryModel(
          text: "Small Processing Units",
          Imagepath: 'assets/svgs/small_process_Unit.svg',
        ),
        StoreCategoryModel(
          text: 'Agricultural Packaging Machines\n',
          Imagepath: 'assets/svgs/agriculture_machine.svg',
        ),
      ].obs;

  List<Map<String, dynamic>> rentalCategoriesList = [
    {'Icon': Icons.agriculture, 'name': 'Tractor'},
    {'Icon': Icons.attractions, 'name': 'Harvestor'},
    {'Icon': Icons.heat_pump, 'name': 'Pump Machinary'},
  ];
  List<Map<String, dynamic>> droneCategoryList = [
    {'svgImaga': 'assets/svgs/drone-1.svg', 'name': 'Drone- 1'},
    {'svgImaga': 'assets/svgs/drone-2.svg', 'name': 'Drone- 2'},
    {'svgImaga': 'assets/svgs/drone-3.svg', 'name': 'Drone- 3'},
    {'svgImaga': 'assets/svgs/drone-4.svg', 'name': 'Drone- 4'},
    {'svgImaga': 'assets/svgs/drone-5.svg', 'name': 'Drone- 5'},
  ];

  final customeCategory = TextEditingController();
}
