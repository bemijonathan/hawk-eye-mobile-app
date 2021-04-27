import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hawkeye/app/general_widgets/app_bar.dart';
import 'package:hawkeye/app/general_widgets/custom_text_field.dart';
import 'package:hawkeye/app/general_widgets/spinkit.dart';
import 'package:hawkeye/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  final LoginPageController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: loginController.loginLoader.value,
          color: Colors.white,
          progressIndicator: spinkit,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: ListView(
              children: [
                PsuedoAppBar(
                  showBackButton: true,
                  title: 'Welcome',
                  subtitle: 'Sign in to access your account',
                ),
                SizedBox(
                  height: 45.h,
                ),
                CustomTextInputForm(
                  inputTitle: 'Email',
                  hintText: 'Enter your email',
                  errorText: 'Email field should be a valid email',
                  controller: loginController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validate: loginController.emailValidator.value,
                  // enable: loginController.verifyEmailLoader.value ? false : true,
                  onChanged: (_) {
                    loginController.onchangedEmail();
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextInputForm(
                  inputTitle: 'Password',
                  hintText: 'Enter your password',
                  errorText:
                      loginController.passwordController.text.length > 1 &&
                              loginController.passwordController.text.length < 6
                          ? 'Password length should not be less than 6'
                          : 'Password field should not be empty',
                  obscureText: true,
                  controller: loginController.passwordController,
                  validate: loginController.passwordValidator.value,
                  // enable: loginController.verifyEmailLoader.value ? false : true,
                  onChanged: (_) {
                    loginController.onchangedPassword();
                  },
                ),
                SizedBox(
                  height: 32.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      loginController.login();
                      // Get.toNamed(Routes.HOME_PAGE);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xff4F25FF))),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Need an account?',
                      style: TextStyle(
                          color: Color(0xff646A86),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTRATION_PAGE);
                      },
                      child: Text(
                        'Create account.',
                        style: TextStyle(
                            color: Color(0xff4F25FF), fontSize: 15.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
