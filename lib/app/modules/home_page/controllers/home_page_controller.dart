import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hawkeye/app/api_client.dart';
import 'package:hawkeye/app/modules/alert_category_page/controllers/alert_category_page_controller.dart';
import 'package:hawkeye/app/modules/myreports_page/model/get_reports_model.dart';
import 'package:hawkeye/app/modules/police_numbers_page/models/police_number_model.dart';
import 'package:hawkeye/app/modules/police_numbers_page/police_json/police_numbers_json.dart';

class HomePageController extends GetxController {
  //TODO: Implement HomePageController
  final AlertCategoryPageController _alertCategoryPageController =
      Get.put(AlertCategoryPageController());
  final myApiClient = ApiClient();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getMyReports();
  }

  @override
  void onReady() {
    postLocation();
    _alertCategoryPageController.getAlertCategories();
    adjustPhoneNumber();

    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print('service enabled true or false $serviceEnabled');
    if (serviceEnabled == false) {
      final location = await Geolocator.getCurrentPosition();
      print('${location.latitude} =============== ${location.longitude}');

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
        // When we reach here, permissions are granted and we can
        // continue accessing the position of the device.
        else {
          final location = await Geolocator.getCurrentPosition();
          print('${location.latitude} =============== ${location.longitude}');
          return location;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // return Future.error('Location services are disabled.');
    } else {
      final location = await Geolocator.getCurrentPosition();
      print('${location.latitude} =============== ${location.longitude}');
      return location;
    }
  }

  Future<void> postLocation() async {
    final location = await _determinePosition();
    Map<String, dynamic> body = {
      'longitude': location.longitude,
      'latitude': location.latitude,
    };
    final result = await myApiClient.postLocation(body);
    if (result.status) {
      print(result.message);
    } else {
      print(result.message);
    }
  }

  TextEditingController reportTitleController = TextEditingController();
  TextEditingController reportContentController = TextEditingController();

  RxBool postReportLoader = false.obs;

  Future<void> postReports() async {
    Map<String, dynamic> body = {
      'title': reportTitleController.text,
      'media': [
        'https://images.freeimages.com/images/large-previews/c25/reporter-tools-2-1560026.jpg'
      ],
      'content': reportContentController.text
    };
    print(body);

    try {
      postReportLoader.value = true;

      final result = await myApiClient.postReport(body);
      if (result.status) {
        getMyReports();
        reportContentController.clear();
        reportTitleController.clear();
        await myApiClient.getStatistics();

        postReportLoader.value = false;

        Get.snackbar(result.message, 'Report submitted',
            backgroundColor: Color(0xff4F25FF), colorText: Color(0xffFFFFFF));
      } else {
        postReportLoader.value = false;
        Get.snackbar('An error occured', result.message,
            backgroundColor: Color(0xff4F25FF), colorText: Color(0xffFFFFFF));
      }
    } catch (e) {
      postReportLoader.value = false;
      rethrow;
    } finally {
      postReportLoader.value = false;
    }
  }

  RxList<StatePolice> policeNumbers = RxList([]);
  final popoNum = PoliceNumbers.fromJson(policeNumbersJson);

  // RxBool policeLoader = false.obs;
  Future<void> adjustPhoneNumber() async {
    // policeLoader.value = true;
    policeNumbers.clear();
    policeNumbers.addAll(popoNum.states);
    // policeLoader.value = false;
    print(policeNumbers.length);
  }

  RxList<Reports> myreports = RxList([]);

  Future<void> getMyReports() async {
    final result = await myApiClient.getMyReports();
    if (result.status) {
      print(result.data.reports);
      myreports.clear();
      myreports.addAll(result.data.reports);
    } else {
      Get.snackbar('An error occured', result.message,
          backgroundColor: Color(0xff4F25FF), colorText: Color(0xffFFFFFF));
    }
  }
}
