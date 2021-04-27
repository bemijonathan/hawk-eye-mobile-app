import 'package:get/get.dart';

import '../controllers/user_profile_page_controller.dart';

class UserProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfilePageController>(
      () => UserProfilePageController(),
    );
  }
}
