import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  late TabController threeTabController;
  late TabController consultationTabController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    consultationTabController = TabController(length: 3, vsync: this);
    threeTabController = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var isPending = false.obs;
  var isProcess = false.obs;
  var isComlete = false.obs;

  void increment() => count.value++;
  final List<String> imagePaths = [
    'assets/images/damage_leaves_01.jpg',
    'assets/images/damage_leaves_02.jpg',
    'assets/images/damage_leaves_03.jpg',
  ];

  RxList<Map<String, dynamic>> apointment =
      [
        {
          'user': 'Amit Singh',
          'cropName': 'Wheat',
          'cropimage': [
            'assets/images/damage_leaves_01.jpg',
            'assets/images/damage_leaves_02.jpg',
            'assets/images/damage_leaves_03.jpg',
          ],
        },
        {
          'user': 'Ram kamal Yadav',
          'cropName': 'Paddy',

          'cropimage': [
            'assets/images/Null_ticket.png',
            'assets/images/Null_ticket.png',
            'assets/images/Null_ticket.png',
          ],
        },
        {
          'user': 'Shailesh Yadav',
          'cropName': 'Suger cane',
          'cropimage': [
            'assets/images/damage_leaves_01.jpg',
            'assets/images/damage_leaves_02.jpg',
            'assets/images/damage_leaves_03.jpg',
          ],
        },
        {
          'user': 'Subham Rawat',
          'cropName': 'Wheat',
          'cropimage': [
            'assets/images/damage_leaves_01.jpg',
            'assets/images/damage_leaves_02.jpg',
            'assets/images/damage_leaves_03.jpg',
          ],
        },
        {
          'user': 'Radhe Kishan ',
          'cropName': 'Wheat',
          'cropimage': [
            'assets/images/damage_leaves_01.jpg',
            'assets/images/damage_leaves_02.jpg',
            'assets/images/damage_leaves_03.jpg',
          ],
        },
      ].obs;
  void removeAppointment(int index) {
    apointment.removeAt(index);
    print('index of ${index} is removed');
    update(); // Notifies the UI to rebuild
  }

  var rejected_index = ''.obs;

  var isaccepted = false.obs;
}
