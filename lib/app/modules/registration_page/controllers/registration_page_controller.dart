import 'dart:convert';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hawkeye/app/api_client.dart';
import 'package:hawkeye/app/modules/registration_page/views/contact_view.dart';
import 'package:hawkeye/app/routes/app_pages.dart';

class RegistrationPageController extends GetxController {
  //TODO: Implement RegistrationPageController
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

  Iterable<Contact> contactList = [];
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  RxBool firstNameValidator = false.obs;
  RxBool lastNameValidator = false.obs;
  RxBool emailValidator = false.obs;
  RxBool passwordValidator = false.obs;
  RxBool phoneNumberValidator = false.obs;

  void onchangedEmail() {
    if (emailController.text.isNotEmpty) {
      emailValidator.value = false;
    }
  }

  void onchangedLastName() {
    if (lastNameController.text.isNotEmpty) {
      // lastname.value = lastnameController.text;
      lastNameValidator.value = false;
    }
  }

  void onchangedFirstName() {
    if (firstNameController.text.isNotEmpty) {
      // firstname.value = firstnameController.text;
      firstNameValidator.value = false;
    }
  }

  void onchangedPassword() {
    if (passwordController.text.isNotEmpty) {
      // password.value = passwordController.text;
      passwordValidator.value = false;
    }
  }

  void onchangedPhoneNumber() {
    if (phoneNumberController.text.isNotEmpty) {
      // password.value = passwordController.text;
      passwordValidator.value = false;
    }
  }

  checkifvalid() {
    if (firstNameController.text.isEmpty) {
      firstNameValidator.value = true;
    } else if (lastNameController.text.isEmpty) {
      lastNameValidator.value = true;
    } else if (emailController.text.isEmpty ||
        !GetUtils.isEmail(emailController.text)) {
      emailValidator.value = true;
    } else if (passwordController.text.length < 6) {
      passwordValidator.value = true;
    } else if (phoneNumberController.text.isEmpty) {
      phoneNumberValidator.value = true;
    }
  }

  RxBool registrationLoader = false.obs;
  Future<void> register() async {
    if (firstNameController.text.isEmpty) {
      firstNameValidator.value = true;
    } else if (lastNameController.text.isEmpty) {
      lastNameValidator.value = true;
    } else if (emailController.text.isEmpty ||
        !GetUtils.isEmail(emailController.text)) {
      emailValidator.value = true;
    } else if (passwordController.text.length < 6) {
      passwordValidator.value = true;
    } else if (phoneNumberController.text.isEmpty) {
      phoneNumberValidator.value = true;
    } else {
      try {
        Map<String, dynamic> body = {
          'email': emailController.text,
          "password": passwordController.text,
          "phoneNumber": phoneNumberController.text,
          "firstName": firstNameController.text,
          "lastName": lastNameController.text
        };
        // var dada = jsonEncode(body);
        registrationLoader.value = true;
        final result = await myApiClient.registerUser(body);
        if (result.status == true) {
          Get.off(() => ContactView());
        } else {
          registrationLoader.value = false;

          Get.snackbar('An error occured', result.message,
              backgroundColor: Color(0xff4F25FF), colorText: Color(0xffFFFFFF));
        }
      } catch (e) {
        registrationLoader.value = false;

        rethrow;
      } finally {
        registrationLoader.value = false;
      }
    }
  }

//Add emergency contacts as a group.
  RxBool contactsLoader = false.obs;
  Future<void> addGroupContacts(List body) async {
    try {
      contactsLoader.value = true;

      final result = await myApiClient.addGroupContact(body);
      if (result.status) {
        await myApiClient.getUserProfile();
        await myApiClient.getStatistics();

        Get.offNamed(Routes.HOME_PAGE);
      } else {
        contactsLoader.value = false;

        Get.snackbar('An error occured', result.message,
            backgroundColor: Color(0xff4F25FF), colorText: Color(0xffFFFFFF));
      }
    } catch (e) {
      contactsLoader.value = false;

      rethrow;
    } finally {
      contactsLoader.value = false;
    }
  }
}
