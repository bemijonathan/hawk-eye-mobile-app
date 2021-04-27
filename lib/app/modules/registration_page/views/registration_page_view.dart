import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hawkeye/app/general_widgets/app_bar.dart';
import 'package:hawkeye/app/general_widgets/custom_text_field.dart';
import 'package:hawkeye/app/general_widgets/spinkit.dart';
import 'package:hawkeye/app/modules/registration_page/views/contact_view.dart';
import 'package:hawkeye/app/routes/app_pages.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../controllers/registration_page_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPageView extends StatefulWidget {
  @override
  _RegistrationPageViewState createState() => _RegistrationPageViewState();
}

class _RegistrationPageViewState extends State<RegistrationPageView> {
  RegistrationPageController regController = Get.find();

//  final regController = Get.put(RegistrationPageController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: regController.registrationLoader.value,
          color: Colors.white,
          progressIndicator: spinkit,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: ListView(
              children: [
                PsuedoAppBar(
                  showBackButton: true,
                  title: 'Register',
                  subtitle: 'Tell us abou t you',
                ),
                SizedBox(
                  height: 45.h,
                ),
                CustomTextInputForm(
                  inputTitle: 'First name',
                  hintText: 'Enter your first name',
                  errorText: 'First name should not be empty',
                  controller: regController.firstNameController,
                  validate: regController.firstNameValidator.value,
                  onChanged: (value) => regController.onchangedFirstName(),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextInputForm(
                  inputTitle: 'Last name',
                  hintText: 'Enter last name',
                  controller: regController.lastNameController,
                  errorText: 'Last name should not be empty',
                  validate: regController.lastNameValidator.value,
                  // enable: regController.verifyEmailLoader.value ? false : true,
                  onChanged: (_) {
                    regController.onchangedLastName();
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextInputForm(
                  inputTitle: 'Email',
                  hintText: 'Enter your email',
                  errorText: 'Email field should be a valid email',
                  controller: regController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validate: regController.emailValidator.value,
                  // enable: regController.verifyEmailLoader.value ? false : true,
                  onChanged: (_) {
                    regController.onchangedEmail();
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextInputForm(
                  inputTitle: 'Phone Number',
                  hintText: 'Enter your phone number',
                  errorText: 'Phone field should not be empty',
                  controller: regController.phoneNumberController,
                  keyboardType: TextInputType.phone,
                  validate: regController.phoneNumberValidator.value,
                  // enable: regController.verifyEmailLoader.value ? false : true,
                  onChanged: (_) {
                    regController.onchangedPhoneNumber();
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextInputForm(
                  inputTitle: 'Password',
                  hintText: 'Enter your password',
                  errorText: regController.passwordController.text.length > 1 &&
                          regController.passwordController.text.length < 6
                      ? 'Password length should not be less than 6'
                      : 'Password field should not be empty',
                  obscureText: true,
                  controller: regController.passwordController,
                  validate: regController.passwordValidator.value,
                  // enable: regController.verifyEmailLoader.value ? false : true,
                  onChanged: (_) {
                    regController.onchangedPassword();
                  },
                ),

                SizedBox(
                  height: 32.h,
                ),
                // regController.verifyEmailLoader.value
                //     ? Container(
                //         margin: EdgeInsets.symmetric(
                //           horizontal: 33.w,
                //         ),
                //         height: 42.h,
                //         // width: 72.8.w,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(8),
                //             gradient: LinearGradient(
                //                 colors: [Color(0xff4F25FF), Color(0xff281380)])),
                //         child: Center(
                //           child: Container(height: 22, child: spinkit),
                //         ),
                //       )
                // :
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      // Get.to(() => ContactView());

                      regController.register();
                      // Get.toNamed(Routes.HOME_PAGE);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xff4F25FF))),
                    child: Center(
                      child: Text(
                        'Register',
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
                      'Have an account?',
                      style: TextStyle(
                          color: Color(0xff646A86),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN_PAGE);
                        // regController.verifyEmailLoader.value
                        //     ? null
                        //     : Get.to(() => LoginScreen());
                      },
                      child: Text(
                        'Log in.',
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

// class TermsAndConditionTextButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.centerLeft,
//       child: Text.rich(TextSpan(
//           text: 'By creating your account, you accept the ',
//           style: TextStyle(
//             fontSize: 14.sp,
//             color: Color(0xff646A86),
//             fontWeight: FontWeight.w500,
//           ),
//           children: <TextSpan>[
//             TextSpan(
//                 text: 'Terms of use',
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xff4F25FF),
//                   decoration: TextDecoration.underline,
//                 ),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () {
//                     // code to open / launch terms of service link here
//                   }),
//             TextSpan(
//                 text: ' and acknowledge the ',
//                 style: TextStyle(fontSize: 14.sp, color: Color(0xff646A86)),
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: 'Privacy Policy',
//                       style: TextStyle(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xff4F25FF),
//                           decoration: TextDecoration.underline),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           // code to open / launch privacy policy link here
//                         })
//                 ])
//           ])),
//     );
//   }
// }
