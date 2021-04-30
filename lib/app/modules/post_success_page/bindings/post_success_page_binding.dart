import 'package:get/get.dart';

import '../controllers/post_success_page_controller.dart';

class PostSuccessPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostSuccessPageController>(
      () => PostSuccessPageController(),
    );
  }
}
