import 'package:get/get.dart';

import 'package:hawkeye/app/modules/alert_category_page/bindings/alert_category_page_binding.dart';
import 'package:hawkeye/app/modules/alert_category_page/views/alert_category_page_view.dart';
import 'package:hawkeye/app/modules/home_page/bindings/home_page_binding.dart';
import 'package:hawkeye/app/modules/home_page/views/home_page_view.dart';
import 'package:hawkeye/app/modules/login_page/bindings/login_page_binding.dart';
import 'package:hawkeye/app/modules/login_page/views/login_page_view.dart';
import 'package:hawkeye/app/modules/myreports_page/bindings/myreports_page_binding.dart';
import 'package:hawkeye/app/modules/myreports_page/views/myreports_page_view.dart';
import 'package:hawkeye/app/modules/police_numbers_page/bindings/police_numbers_page_binding.dart';
import 'package:hawkeye/app/modules/police_numbers_page/views/police_numbers_page_view.dart';
import 'package:hawkeye/app/modules/post_success_page/bindings/post_success_page_binding.dart';
import 'package:hawkeye/app/modules/post_success_page/views/post_success_page_view.dart';
import 'package:hawkeye/app/modules/registration_page/bindings/registration_page_binding.dart';
import 'package:hawkeye/app/modules/registration_page/views/registration_page_view.dart';
import 'package:hawkeye/app/modules/splash_page/bindings/splash_page_binding.dart';
import 'package:hawkeye/app/modules/splash_page/views/splash_page_view.dart';
import 'package:hawkeye/app/modules/user_profile_page/bindings/user_profile_page_binding.dart';
import 'package:hawkeye/app/modules/user_profile_page/views/user_profile_page_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_PAGE,
      page: () => SplashPageView(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION_PAGE,
      page: () => RegistrationPageView(),
      binding: RegistrationPageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE_PAGE,
      page: () => UserProfilePageView(),
      binding: UserProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.ALERT_CATEGORY_PAGE,
      page: () => AlertCategoryPageView(),
      binding: AlertCategoryPageBinding(),
    ),
    GetPage(
      name: _Paths.POST_SUCCESS_PAGE,
      page: () => PostSuccessPageView(),
      binding: PostSuccessPageBinding(),
    ),
    GetPage(
      name: _Paths.POLICE_NUMBERS_PAGE,
      page: () => PoliceNumbersPageView(),
      binding: PoliceNumbersPageBinding(),
    ),
    GetPage(
      name: _Paths.MYREPORTS_PAGE,
      page: () => MyreportsPageView(),
      binding: MyreportsPageBinding(),
    ),
  ];
}
