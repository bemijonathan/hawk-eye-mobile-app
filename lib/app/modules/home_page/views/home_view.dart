import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hawkeye/app/api_client.dart';
import 'package:hawkeye/app/general_widgets/custom_text_field.dart';
import 'package:hawkeye/app/general_widgets/spinkit.dart';
import 'package:hawkeye/app/modules/alert_category_page/views/alert_category_page_view.dart';
import 'package:hawkeye/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:hawkeye/app/modules/home_page/models/report_stats_model.dart';
import 'package:hawkeye/app/modules/police_numbers_page/views/police_numbers_page_view.dart';
import 'package:hawkeye/app/modules/user_profile_page/models/user_profile_model.dart';
import 'package:hawkeye/app/routes/app_pages.dart';
import 'package:hawkeye/colors.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends GetView {
  final HomePageController _homeController = Get.find();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final myApiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    UserProfile userProfile = myApiClient.box.read('user');
    ReportStats userStats = myApiClient.box.read('stats');
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
                      _homeController.myApiClient.box.remove('stats');
                      _homeController.myApiClient.box.remove('user');

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
                  // Container(
                  //   padding: EdgeInsets.all(8),
                  //   child: Text(
                  //     'NGO\'s',
                  //     style: TextStyle(
                  //       color: nimbusBlue.withOpacity(.8),
                  //       fontSize: 18.sp,
                  //       fontWeight: FontWeight.w700,
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
      body: GetX<HomePageController>(
          builder: (_) => SafeArea(
                child: ModalProgressHUD(
                  inAsyncCall: _.postReportLoader.value,
                  progressIndicator: spinkit,
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
                                      userStats.data.allreport.toString(),
                                      style: TextStyle(
                                        color:
                                            Color(0xFF262626).withOpacity(.8),
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      // textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'All reports',
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
                                      userStats.data.myreport.toString(),
                                      style: TextStyle(
                                        color:
                                            Color(0xFF262626).withOpacity(.8),
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      // textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'my reports',
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
                                      userStats.data.myAlert.toString(),
                                      style: TextStyle(
                                        color:
                                            Color(0xFF262626).withOpacity(.8),
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      // textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'my alerts',
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
                        GestureDetector(
                          onTap: () {
                            Get.snackbar('coming soon...',
                                'Reports in your area will be available soon',
                                backgroundColor: Color(0xff4F25FF),
                                colorText: Color(0xffFFFFFF));
                          },
                          child: Container(
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                        ),
                        SizedBox(height: 24.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                              child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        color: Colors.amber[50],
                                        height: Get.height * .6,
                                        child: ListView(
                                          children: [
                                            Text('Your report here'),
                                            SizedBox(
                                              height: 24.h,
                                            ),
                                            CustomTextInputForm(
                                              inputTitle: 'Title',
                                              hintText: 'report title here',
                                              controller: _homeController
                                                  .reportTitleController,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey[300])),
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.multiline,
                                                textInputAction:
                                                    TextInputAction.newline,
                                                controller: _homeController
                                                    .reportContentController,
                                                minLines: 1,
                                                maxLines: 10,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 24),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  if (_homeController
                                                          .reportTitleController
                                                          .text
                                                          .isNotEmpty &&
                                                      _homeController
                                                          .reportContentController
                                                          .text
                                                          .isNotEmpty) {
                                                    Get.back();
                                                    _homeController
                                                        .postReports();
                                                  } else {
                                                    Get.snackbar(
                                                        'An empty field detected',
                                                        'Ensure you fill in the title and content of your report',
                                                        backgroundColor:
                                                            Color(0xff4F25FF),
                                                        colorText:
                                                            Color(0xffFFFFFF));
                                                  }
                                                  // Get.to(() => ContactView());

                                                  // r.r,egister();
                                                  // Get.toNamed(Routes.HOME_PAGE);
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(Color(
                                                                0xff4F25FF))),
                                                child: Center(
                                                  child: Text(
                                                    'Upload report',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffffffff),
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      isScrollControlled: true);
                                },
                                child: Container(
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
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(AlertCategoryPageView());
                                },
                                child: Container(
                                  height: 180.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
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
                ),
              )),
    );
  }
}
