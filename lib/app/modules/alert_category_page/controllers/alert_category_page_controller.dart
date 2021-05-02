import 'package:get/get.dart';
import 'package:hawkeye/app/api_client.dart';
import 'package:hawkeye/app/modules/alert_category_page/models/get_category_model.dart';
import 'package:hawkeye/app/routes/app_pages.dart';
import 'package:hawkeye/utils.dart';

class AlertCategoryPageController extends GetxController {
  //TODO: Implement AlertCategoryPageController
  final myApiClient = ApiClient();

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
  void onClose() {}
  void increment() => count.value++;

  RxBool getCategoryLoader = false.obs;

  Future<void> getAlertCategories() async {
    if (alertCategories.length > 0) {
      print(alertCategories.length);
    } else {
      getCategoryLoader.value = true;
      final result = await myApiClient.getAlertCategory();

      if (result.status == true) {
        alertCategories.clear();
        alertCategories.addAll(result.data);
        getCategoryLoader.value = false;
      } else {
        getCategoryLoader.value = false;
        getSnackbar(result.message);
      }
    }
  }

  Future<void> postAlertNotifs({String notifID}) async {
    getCategoryLoader.value = true;
    final result = await myApiClient.postNotifications(notifID);

    if (result.status == true) {
      getCategoryLoader.value = false;
      await myApiClient.getStatistics();
      Get.offNamed(Routes.POST_SUCCESS_PAGE, arguments: result.message);
    } else {
      getCategoryLoader.value = false;
      Get.back();
      getSnackbar(result.message);
    }
  }

  List<GetCategoryData> alertCategories = [];
}
