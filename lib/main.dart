import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hawkeye/app/routes/app_pages.dart';
import 'package:hawkeye/r.g.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: R.fontFamily.nunito,
          primaryColor: Color(0xff4F25FF),
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
