import 'package:get/get.dart';

import '../controllers/registration_page_controller.dart';

class RegistrationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationPageController>(
      () => RegistrationPageController(),
    );
  }
}
