import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hawkeye/r.g.dart';

class PsuedoAppBar extends StatelessWidget {
  const PsuedoAppBar({
    Key key,
    this.title,
    this.subtitle,
    this.showBackButton = false,
    this.showLogo = true,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool showBackButton;
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Container(
            height: 37.13.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                showBackButton
                    ? GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                            width: 17.86.w, child: Icon(Icons.arrow_back_ios)),
                      )
                    : Container(),
                showLogo
                    ? Container(
                        height: 50.h,
                        width: 50.w,
                        child: Image.asset(
                          R.image.asset.hAWK_EYE_logo.assetName,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          SizedBox(
            height: 19.87.h,
          ),
          Container(
            height: 27.h,
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF262626),
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            width: Get.width,
            height: 19.h,
            child: Wrap(
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Color(0xFF646A86),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
