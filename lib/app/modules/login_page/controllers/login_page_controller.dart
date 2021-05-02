import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hawkeye/app/api_client.dart';
import 'package:hawkeye/app/routes/app_pages.dart';

class LoginPageController extends GetxController {
  //TODO: Implement LoginPageController
  //
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

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  RxBool emailValidator = false.obs;
  RxBool passwordValidator = false.obs;

  void onchangedEmail() {
    if (emailController.text.isNotEmpty) {
      emailValidator.value = false;
    }
  }

  void onchangedPassword() {
    if (passwordController.text.isNotEmpty) {
      // password.value = passwordController.text;
      passwordValidator.value = false;
    }
  }

  checkifvalid() {
    if (emailController.text.isEmpty ||
        !GetUtils.isEmail(emailController.text)) {
      emailValidator.value = true;
    } else if (passwordController.text.length < 6) {
      passwordValidator.value = true;
    }
  }

  RxBool loginLoader = false.obs;

  Future<void> login() async {
    if (emailController.text.isEmpty ||
        !GetUtils.isEmail(emailController.text)) {
      emailValidator.value = true;
    } else if (passwordController.text.length < 6) {
      passwordValidator.value = true;
    } else {
      try {
        Map<String, dynamic> body = {
          'email': emailController.text,
          "password": passwordController.text,
        };
        loginLoader.value = true;
        final result = await myApiClient.loginUser(body);
        if (result.status == true) {
          await myApiClient.getUserProfile();
          await myApiClient.getStatistics();
          Get.offAllNamed(Routes.HOME_PAGE);
        } else {
          loginLoader.value = false;

          Get.snackbar('An error occured', result.message,
              backgroundColor: Color(0xff4F25FF), colorText: Color(0xffFFFFFF));
        }
      } catch (e) {
        loginLoader.value = false;

        rethrow;
      } finally {
        loginLoader.value = false;
      }
    }
  }
}
