import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hawkeye/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:hawkeye/app/routes/app_pages.dart';
import 'package:hawkeye/colors.dart';

class HomeView extends GetView {
  final HomePageController _homeController = Get.find();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      endDrawer: ClipRRect(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
        child: Container(
          width: Get.width * .3,
          color: Colors.transparent,
          height: 200.h,
          child: Drawer(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber[100].withOpacity(.8),
              ),
              // mainAxisSize: MainAxisSize.min,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red[300],
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'call 112',
                      style: TextStyle(
                        color: nimbusBlue.withOpacity(.8),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'NGO\'s',
                      style: TextStyle(
                        color: nimbusBlue.withOpacity(.8),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Police',
                      style: TextStyle(
                        color: nimbusBlue.withOpacity(.8),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<HomePageController>(
          builder: (_) => SafeArea(
                child: Container(
                  color: Color(0xfff1f6fa),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: Get.width * .5,
                              height: Get.height * .25,
                              decoration: BoxDecoration(
                                color: Colors.amber[50],
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Welcome',
                                  style: TextStyle(
                                    fontSize: 30,
                                    letterSpacing: 4,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  _drawerKey.currentState.openEndDrawer(),
                              child: Container(
                                width: Get.width * .5,
                                height: Get.height * .25,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        // color: Colors.blue,
                                        height: 100.h,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                // color: Colors.green,
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey[300],
                                                      spreadRadius: 2.5,
                                                      blurRadius: 2,
                                                      offset: Offset(0, 2))
                                                ],
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        left: Radius.circular(
                                                            25))),
                                            height: 50.h,
                                            width: 65.w,
                                            padding: EdgeInsets.all(10),
                                            child: Icon(
                                                Icons.bubble_chart_outlined),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          // color: Colors.red,
                                          height: 100.h,
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              'Christina',
                                              style: TextStyle(
                                                color: Color(0xFF262626),
                                                fontSize: 21.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                // color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 65.h,
                      ),
                      Container(
                        height: 55.h,
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    '21',
                                    style: TextStyle(
                                      color: Color(0xFF262626).withOpacity(.8),
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    // textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'stories',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.sp,
                                      // fontWeight: FontWeight.w700,
                                    ),
                                    // textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    '9',
                                    style: TextStyle(
                                      color: Color(0xFF262626).withOpacity(.8),
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    // textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'streaks',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.sp,
                                      // fontWeight: FontWeight.w700,
                                    ),
                                    // textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      color: Color(0xFF262626).withOpacity(.8),
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    // textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'favorites',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.sp,
                                      // fontWeight: FontWeight.w700,
                                    ),
                                    // textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 54.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                        height: 100.h,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 5.5,
                                  spreadRadius: 3,
                                  offset: Offset(0, 4))
                            ]),
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  'Area Reports',
                                  style: TextStyle(
                                    fontSize: 40,
                                    letterSpacing: 4,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey[100],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: -10.w,
                              child: Container(
                                height: 25.w,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    color: Colors.amber[50],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 4,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff281380),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10.w,
                              left: 10.w,
                              child: Container(
                                // padding: EdgeInsets.all(16),
                                // height: 25.w,
                                // width: 40.w,
                                // decoration: BoxDecoration(
                                //     color: Colors.amber[50],
                                //     borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  'Reports in your area',
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    // letterSpacing: 4,
                                    fontWeight: FontWeight.w700,
                                    // color: Color(0xff281380),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                            child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 180.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[300],
                                    blurRadius: 5.5,
                                    spreadRadius: 5,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff281380).withOpacity(.8),
                                    Color(0xff4F25FF).withOpacity(.8)
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(children: [
                                  Positioned(
                                    top: 25.h,
                                    child: Container(
                                      child: Text(
                                        'Report',
                                        style: TextStyle(
                                          fontSize: 30,
                                          letterSpacing: 4,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Report',
                                            style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 21.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          Text(
                                            'make your emergency reports here',
                                            style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.ALERT_CATEGORY_PAGE);
                              },
                              child: Container(
                                height: 180.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    // gradient: LinearGradient(
                                    //   colors: [
                                    //     Color(0xff4F25FF).withOpacity(.8),
                                    //     Color(0xff281380).withOpacity(.8)
                                    //   ],
                                    // ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[300],
                                          blurRadius: 5.5,
                                          spreadRadius: 5,
                                          offset: Offset(0, 4))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 25.h,
                                        child: Container(
                                          child: Text(
                                            'Alerts',
                                            style: TextStyle(
                                              fontSize: 30,
                                              letterSpacing: 4,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.grey[200],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.add_alert_rounded,
                                            color: Color(0xff4F25FF),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Alerts',
                                                style: TextStyle(
                                                  color: Color(0xff4F25FF),
                                                  fontSize: 21.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                'create an emergency alert',
                                                style: TextStyle(
                                                  color: Color(0xff4F25FF),
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
