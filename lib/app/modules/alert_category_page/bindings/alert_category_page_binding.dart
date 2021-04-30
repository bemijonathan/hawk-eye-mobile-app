import 'package:get/get.dart';

import '../controllers/alert_category_page_controller.dart';

class AlertCategoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlertCategoryPageController>(
      () => AlertCategoryPageController(),
    );
  }
}
