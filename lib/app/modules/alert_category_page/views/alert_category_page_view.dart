import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hawkeye/app/general_widgets/spinkit.dart';
import 'package:hawkeye/colors.dart';
import 'package:hawkeye/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../controllers/alert_category_page_controller.dart';

class AlertCategoryPageView extends StatelessWidget {
  getback() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlertCategoryPageController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: nimbusBlue,
            ),
          ),
          backgroundColor: white,
          elevation: 0,
          title: Text(
            'Select Alert category',
            style: TextStyle(color: nimbusBlue, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => ModalProgressHUD(
            inAsyncCall: _.getCategoryLoader.value,
            color: white,
            progressIndicator: spinkit,
            child: Container(
              height: Get.height,
              width: Get.width,
              color: Color(0xfff1f6fa),
              child: ListView.builder(
                  itemCount: _.alertCategories.length,
                  itemBuilder: (context, index) => Container(
                        child: GestureDetector(
                          onTap: () => Get.dialog(
                            Center(
                              child: Container(
                                height: Get.width * .6,
                                width: Get.width * .9,
                                padding: EdgeInsets.all(8),
                                child: Card(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Note that you are solely responsible for alerts sent to security agents and do affirm that you are to be held responsible according to the law if this alert is false',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.sp),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'Go back',
                                                  style: TextStyle(
                                                      color: nimbusBlue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                  _.postAlertNotifs(
                                                      notifID: _
                                                          .alertCategories[
                                                              index]
                                                          .sId);
                                                },
                                                child: Text(
                                                  'Proceed',
                                                  style: TextStyle(
                                                      color: nimbusBlue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          child: Card(
                              color: Colors.amber[50],
                              margin: EdgeInsets.all(8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(_.alertCategories[index].title),
                              )),
                        ),
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
