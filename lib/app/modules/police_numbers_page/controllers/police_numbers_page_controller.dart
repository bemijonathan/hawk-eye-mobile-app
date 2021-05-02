import 'package:get/get.dart';
import 'package:hawkeye/app/modules/police_numbers_page/models/police_number_model.dart';
import 'package:hawkeye/app/modules/police_numbers_page/police_json/police_numbers_json.dart';

class PoliceNumbersPageController extends GetxController {
  //TODO: Implement PoliceNumbersPageController

  RxList<StatePolice> policeNumbers = RxList();
  final popoNum = PoliceNumbers.fromJson(policeNumbersJson);

  final count = 0.obs;
  @override
  void onInit() {
    // adjustPhoneNumber();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  RxBool policeLoader = false.obs;
  Future<void> adjustPhoneNumber() async {
    policeLoader.value = true;
    policeNumbers.clear();
    policeNumbers.addAll(popoNum.states);
    policeLoader.value = false;
  }
}
