import 'package:get/get.dart';
import 'package:hawkeye/app/api_client.dart';
import 'package:hawkeye/app/routes/app_pages.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SplashPageController extends GetxController {
  //TODO: Implement SplashPageController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    splashScreenDelay();
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  // final AccountService _accountService = Get.find();

  // @override
  // void onInit() {
  //   super.onInit();
  //   Get.lazyPut(() => AccountRepository(), fenix: true);

  //   Get.put(ProfileClient(Get.find<HttpService>().dio), permanent: true);
  // }

  // @override
  // void onReady() {
  //   splashScreenDelay();
  //   // emailController = TextEditingController();
  //   // passwordController = TextEditingController();

  //   super.onReady();
  // }

  void splashScreenDelay() {
    Future.delayed(Duration(seconds: 3), () {
      // Get.toNamed(Routes.REGISTRATION_PAGE);
      checkIfOldUser();
      // initUniLinks();
      // OnboardingScreen());
    });
  }

  // /* final oldUser = GetStorage();

  // // void writeOldUser(bool value) {
  // //   oldUser.write('oldUser', value);
  // // } */

  void checkIfOldUser() async {
    final myApiClient = ApiClient();

    // Map<String, dynamic> decodedToken = JwtDecoder.decode(_oldUser);
    // decodedToken.forEach((key, value) {
    //   print('$key : $value');
    // });
    String _oldUser = myApiClient.box.read('token');
    if (_oldUser != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(_oldUser);
      decodedToken.forEach((key, value) {
        print('$key : $value');
      });
      DateTime expirationDate = JwtDecoder.getExpirationDate(_oldUser);
      bool isTokenExpired = JwtDecoder.isExpired(_oldUser);
      print(isTokenExpired);
      print('============== + $expirationDate');
      if (JwtDecoder.isExpired(_oldUser)) {
        Get.offNamed(Routes.LOGIN_PAGE);
      } else {
        // check if old user token has expired.
        // User has logged in
        await myApiClient.getUserProfile();
        await myApiClient.getStatistics();

        Get.offAndToNamed(Routes.HOME_PAGE);
      }
    } else {
      /// New user
      Get.offNamed(Routes.REGISTRATION_PAGE);
    }
  }
}
