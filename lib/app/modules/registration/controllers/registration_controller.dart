
import 'package:farmitra/app/data/models/registration_model/registration_model.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  //TODO: Implement RegistrationController

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
  var currentStep = 0.obs; // Observable variable for the current step

  void setStep(int stepIndex) {
    currentStep.value = stepIndex;
  }

  var items = <Registration_Model>[].obs;

  List<Registration_Model> stepperContent = [
    Registration_Model(
      title: "Profile Validation",
      subtitle: "Validate your profile using your mobile no.",
      imagePath: "assets/icons/registration_stepper_icons/profile.svg",
    ),
    Registration_Model(
      title: "Store Details",
      subtitle: "Provide basic details about your store",
      imagePath: "assets/icons/registration_stepper_icons/store.svg",
    ),
    Registration_Model(
      title: "K.Y.C.",
      subtitle: "Legal documentations about you & your business",
      imagePath: "assets/icons/registration_stepper_icons/kyc.svg",
    ),
    Registration_Model(
      title: "Bank Details",
      subtitle: "Payment receiving details",
      imagePath: "assets/icons/registration_stepper_icons/bank.svg",
    )
  ];
}
