import 'package:farmitra/app/data/models/registration_model/store_details_model.dart';
import 'package:get/get.dart';

class StoreDetailsController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxString previousSelectedValue = ''.obs;

  final List<Store_Details_Model> listContent = [
    Store_Details_Model(
      title: 'As a Retailer',
      subtitle: "I will use Farmitra to mainly sell items and services.",
    ),
    Store_Details_Model(
      title: 'As a Supplier/Manufacturer',
      subtitle:
          "I will use Farmitra to supply high-quality materials and products to retailers.",
    ),
    Store_Details_Model(
      title: "As a Service Provider",
      subtitle:
          'I will use Farmitra to offer my expert services to a wider audience.',
    ),
  ];

  Store_Details_Model get selectedData => listContent[selectedIndex.value];

  void selectItem(int index) {
    selectedIndex.value = index;
    previousSelectedValue.value = selectedData.title;
  }

  @override
  void onInit() {
    super.onInit();
    // Set default selected value (index 0)
    selectItem(0);
  }
}