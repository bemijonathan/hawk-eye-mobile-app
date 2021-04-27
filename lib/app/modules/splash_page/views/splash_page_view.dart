import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hawkeye/r.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/splash_page_controller.dart';

class SplashPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashPageController>(
      init: SplashPageController(),
      builder: (_) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image:
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white.withOpacity(.65),
                child: Center(
                  child: Container(
                    width: 296.5.w,
                    child: Container(
                      child: Image(
                          image: AssetImage(R.image.asset
                              .hAWK_EYE__2__removebg_preview.assetName),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
