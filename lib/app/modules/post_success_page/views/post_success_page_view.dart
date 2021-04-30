import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hawkeye/app/routes/app_pages.dart';
import 'package:hawkeye/colors.dart';

class PostSuccessPageView extends StatefulWidget {
  @override
  _PostSuccessPageViewState createState() => _PostSuccessPageViewState();
}

class _PostSuccessPageViewState extends State<PostSuccessPageView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Get.until((route) => route.settings.name == Routes.HOME_PAGE);
    });
    super.initState();
  }

  final String message = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prunePlum,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        height: MediaQuery.of(context).size.height,
        // color: prunePlum,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 78.h,
              ),
              Container(
                  height: 93.h,
                  width: 93.w,
                  child: Icon(
                    Icons.check,
                    size: 45,
                    color: Colors.green,
                  )),
              SizedBox(
                height: 51.h,
              ),
              Container(
                height: 59.h,
                width: 274.w,
                child: Text(
                  'Successful!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                // height: 38.h,
                width: 263.w,
                child: Text(
                  message,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 159,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
