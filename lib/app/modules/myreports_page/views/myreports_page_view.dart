import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hawkeye/app/api_client.dart';
import 'package:hawkeye/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:hawkeye/app/modules/police_numbers_page/views/police_numbers_page_view.dart';
import 'package:hawkeye/app/modules/user_profile_page/controllers/user_profile_page_controller.dart';
import 'package:hawkeye/app/modules/user_profile_page/models/user_profile_model.dart';
import 'package:hawkeye/app/routes/app_pages.dart';
import 'package:hawkeye/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MyreportsPageView extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final myApiClient = ApiClient();
  final _homeController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    UserProfile userProfile = myApiClient.box.read('user');

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _homeController.myApiClient.box.erase();
                        Get.offAllNamed(Routes.LOGIN_PAGE);
                      },
                      child: Container(
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
                    ),
                    GestureDetector(
                      onTap: () async {
                        await launch('tel://112');
                      },
                      child: Container(
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
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     padding: EdgeInsets.all(8),
                    //     child: Text(
                    //       'Profile',
                    //       style: TextStyle(
                    //         color: nimbusBlue.withOpacity(.8),
                    //         fontSize: 18.sp,
                    //         fontWeight: FontWeight.w700,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () => Get.to(() => PoliceNumbersPageView()),
                      child: Container(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: Color(0xfff1f6fa),
            child: ListView(children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
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
                          'Your Reports',
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
                      onTap: () => _drawerKey.currentState.openEndDrawer(),
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
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(25))),
                                    height: 50.h,
                                    width: 65.w,
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.bubble_chart_outlined),
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
                                      userProfile.data.firstName,
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
              for (var i = 0; i < _homeController.myreports.length; i++)
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                            Container(
                              padding: EdgeInsets.all(12),
                              color: Colors.amber[50],
                              height: Get.height * .6,
                              child: ListView(
                                children: [
                                  Text(
                                    _homeController.myreports[i].title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(_homeController.myreports[i].content),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                ],
                              ),
                            ),
                            isScrollControlled: true);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                        height: 150.h,
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
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Reports',
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
                                width: Get.width.w * .4,
                                decoration: BoxDecoration(
                                    color: Colors.amber[50],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    'report no ${i + 1}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 3,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff281380),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 25.w,
                              left: 10.w,
                              child: Container(
                                // padding: EdgeInsets.all(16),
                                // height: 25.w,
                                // width: 40.w,
                                // decoration: BoxDecoration(
                                //     color: Colors.amber[50],
                                //     borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _homeController.myreports[i].title,
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        // letterSpacing: 4,
                                        fontWeight: FontWeight.w700,
                                        // color: Color(0xff281380),
                                      ),
                                    ),
                                    Container(
                                      color: white,
                                      height: 55.h,
                                      width: 55.w,
                                      child: Image.network(
                                        _homeController
                                            .myreports[i].media.first,
                                      ),
                                    ),
                                    Text(
                                      'tap to view your report details',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        // letterSpacing: 4,
                                        fontWeight: FontWeight.w500,
                                        // color: Color(0xff281380),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              SizedBox(
                height: 24.h,
              ),
            ]),
          ),
        ));
  }
}
