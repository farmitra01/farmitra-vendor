import 'package:farmitra/app/data/models/help_center_model/faq_grid_model.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  //TODO: Implement FaqController
  var items = <Faq_Grid_Model>[].obs;

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

  final List<Faq_Grid_Model> gridContent = [
    Faq_Grid_Model(
        title: 'Business Details',
        imagePath: 'assets/icons/faq_grid_icons/business.svg'),
    Faq_Grid_Model(
        title: 'Bank Account',
        imagePath: 'assets/icons/faq_grid_icons/bank.svg'),
    Faq_Grid_Model(
        title: 'KYC',
        imagePath: 'assets/icons/faq_grid_icons/kyc.svg'),
    Faq_Grid_Model(
        title: 'Account Activation',
        imagePath: 'assets/icons/faq_grid_icons/account.svg'),
    Faq_Grid_Model(
        title: 'Registration & Login',
        imagePath: 'assets/icons/faq_grid_icons/registrantion.svg'),
    Faq_Grid_Model(
        title: 'Returns & Refunds',
        imagePath: 'assets/icons/faq_grid_icons/return.svg'),
    Faq_Grid_Model(
        title: 'Delivery Support',
        imagePath: 'assets/icons/faq_grid_icons/delievery.svg'),
  ];
}
