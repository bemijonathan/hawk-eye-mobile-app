import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hawkeye/app/modules/home_page/views/home_view.dart';
import 'package:hawkeye/app/modules/myreports_page/views/myreports_page_view.dart';
import 'package:hawkeye/app/modules/user_profile_page/views/user_profile_page_view.dart';

import '../controllers/home_page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    MyreportsPageView(),
    UserProfilePageView()
  ];

  Widget build(BuildContext context) {
    print(Get.width);
    print(Get.height);
    return Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.white,
        //   title: Text(
        //     'Welcome back',
        //     style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //         color: Theme.of(context).primaryColor),
        //   ),
        //   elevation: 0,
        //   // centerTitle: true,
        // ),
        body: Container(
          decoration: BoxDecoration(color: Color(0xfff1f6fa)
              // gradient: LinearGradient(
              //   colors: [
              //     Color(0xff281380).withOpacity(.40),
              //     Color(0xff4F25FF).withOpacity(.8)
              //   ],
              // ),
              ),
          child: _widgetOptions.elementAt(_selectedIndex),
          //  Center(
          //     child: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Container(
          //       height: 150.h,
          //       width: 250.w,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(8),
          //           gradient: LinearGradient(
          //               colors: [Color(0xff4F25FF), Color(0xff281380)])),
          //       child: Center(
          //         child: Text(
          //           'Report',
          //           style: TextStyle(
          //             color: Color(0xFFFFFFFF),
          //             fontSize: 26.sp,
          //             fontWeight: FontWeight.w700,
          //           ),
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 24.h,
          //     ),
          //     Container(
          //       height: 150.h,
          //       width: 250.w,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8),
          //         gradient: LinearGradient(
          //           colors: [Color(0xff281380), Color(0xff4F25FF)],
          //         ),
          //       ),
          //       child: Center(
          //         child: Text(
          //           'Alerts',
          //           style: TextStyle(
          //             color: Color(0xFFFFFFFF),
          //             fontSize: 26.sp,
          //             fontWeight: FontWeight.w700,
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // )),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.grey,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.home_outlined,
                color: Color(0xff281380),
                size: 24,
              ),
              label: '____',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt_outlined,
                color: Colors.grey,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.receipt_outlined,
                color: Color(0xff281380),
                size: 24,
              ),
              label: '____',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Colors.grey,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.person_outline,
                color: Color(0xff281380),
                size: 24,
              ),
              label: '____',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xff281380),
          backgroundColor: Colors.white,
          elevation: 0,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(color: Colors.red),

          // iconSize: 20,
          onTap: _onItemTapped,
        ));
  }
}
