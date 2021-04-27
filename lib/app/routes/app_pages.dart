import 'package:get/get.dart';

import 'package:hawkeye/app/modules/home_page/bindings/home_page_binding.dart';
import 'package:hawkeye/app/modules/home_page/views/home_page_view.dart';
import 'package:hawkeye/app/modules/login_page/bindings/login_page_binding.dart';
import 'package:hawkeye/app/modules/login_page/views/login_page_view.dart';
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
  ];
}
