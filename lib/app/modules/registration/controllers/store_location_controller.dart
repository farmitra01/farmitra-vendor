import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreLocationController extends GetxController {
  //TODO: Implement StoreLocationController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
  var address = TextEditingController();
  var floor = TextEditingController();
  var pincode = TextEditingController();
  var combinedController = TextEditingController(); 

  void CombinController (){
    combinedController.text = '${address.text} - ${floor.text} - ${pincode.text}';
  }

}
