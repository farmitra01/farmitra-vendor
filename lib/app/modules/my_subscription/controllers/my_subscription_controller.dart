import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySubscriptionController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement MySubscriptionController
  late TabController tabController;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  var selectedIndex = RxInt(-1); // -1 means no selection initially

  // Method to update the selected index
  void selectPlan(int index) {
    selectedIndex.value = index;
  }
   
   var selectedPaymentIndex = RxInt(-1); // -1 means no selection initially

  // Method to update the selected index
  void selectPaymentmothod(int index) {
    selectedPaymentIndex.value = index;
  }
   
   
   
  final plans = ['Quarterly', 'Monthly', 'Yearly'];
  final prices = ['₹65.98/QTR', '₹125.99/MO', '₹199.99/YR'];
  final originalPrices = ['₹170.98/QTR', '₹35.99/MO', '₹299.99/YR'];
  final billingText = [
    'Billed quarterly after free trial',
    'Billed monthly after free trial',
    'Billed yearly after free trial',
  ];

  var trial = false.obs;
  var renew = false.obs;

   final List<Map<String, dynamic>> priceDetails =
      [
        {
          "title": "Item Total",
          "price": "₹3099",
          "discountedPrice": "₹1379",
          "isStrikethrough": true,
        },
        {"title": "MRP", "price": "₹3098"},
        {"title": "Product Discount", "price": "₹1750", "color": Colors.blue},
        {"title": "Promotional Discount", "price": "₹35"},
        {"title": "Additional Discount", "price": "₹35"},
        {"title": "Delivery fee 3.7 KM", "price": "₹35"},
        {"title": "Handling Charges", "price": "₹15"},
      ].obs; 

       var addedItems =
      <Map<String, dynamic>>[
        {
          'productname': 'Bombay Shaving Company\nNoir Deodorant Spray',
          'productPrice': '220',
          'hasGift': true,
        },
        {
          'productname': 'Sample Product\nItem Two',
          'productPrice': '150',
          'hasGift': false,
        },
      ].obs;
      var quantities = <int>[1, 1].obs;
}
