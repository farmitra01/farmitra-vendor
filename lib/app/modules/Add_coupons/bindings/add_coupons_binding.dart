import 'package:get/get.dart';

import '../controllers/add_coupons_controller.dart';

class AddCouponsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCouponsController>(
      () => AddCouponsController(),
    );
  }
}
