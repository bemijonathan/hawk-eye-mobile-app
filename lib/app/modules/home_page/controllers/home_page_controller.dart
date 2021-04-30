import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hawkeye/app/api_client.dart';

class HomePageController extends GetxController {
  //TODO: Implement HomePageController
  //
  final myApiClient = ApiClient();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    postLocation();
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
}
