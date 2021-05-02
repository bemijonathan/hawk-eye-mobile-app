import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hawkeye/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:hawkeye/app/modules/police_numbers_page/models/police_number_model.dart';
import 'package:hawkeye/app/modules/police_numbers_page/police_json/police_numbers_json.dart';
import 'package:hawkeye/colors.dart';
import 'package:screen_utils/screen_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/police_numbers_page_controller.dart';

class PoliceNumbersPageView extends StatefulWidget {
  @override
  _PoliceNumbersPageViewState createState() => _PoliceNumbersPageViewState();
}

class _PoliceNumbersPageViewState extends State<PoliceNumbersPageView> {
  List<StatePolice> policeNumbers = [];
  // final _policeController = Get.put(PoliceNumbersPageController());

  @override
  void initState() {
    // TODO: implement initState
    // final popoNum = PoliceNumbers.fromJson(policeNumbersJson);
    // policeNumbers.addAll(popoNum.states);
    // for (var item in policeNumbers) {
    //   print(item.state);
    // }
    // _policeController.adjustPhoneNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Police Emergency Numbers'),
          centerTitle: true,
        ),
        body: GetBuilder<HomePageController>(
          builder: (_) => Container(
            color: Color(0xfff1f6fa),
            height: Get.height,
            width: Get.width,
            child: ListView(
              children: [
                for (var item in _.policeNumbers)
                  Container(
                      width: Get.width,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.only(
                        left: 8,
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                    // height: 35.h,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.amber[50],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(item.state))),
                          ),
                          for (var phone in item.phones)
                            GestureDetector(
                              onTap: () async {
                                await launch("tel://$phone");
                              },
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: Colors.green[300],
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(phone),
                                    ],
                                  )),
                            )
                        ],
                      ))
              ],
            ),
          ),
        ));
  }
}
