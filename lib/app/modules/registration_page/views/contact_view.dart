import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// class ContactView extends GetView {
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hawkeye/app/general_widgets/app_bar.dart';
import 'package:hawkeye/app/general_widgets/spinkit.dart';
import 'package:hawkeye/app/modules/registration_page/controllers/registration_page_controller.dart';
import 'package:hawkeye/app/routes/app_pages.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:fluttercontactpicker/fluttercontactpicker.dart';

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  void initState() {
    super.initState();
    _askPermissions(null).then((value) => setContact());
    // setContact();
  }

  Future<void> _askPermissions(String routeName) async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      // if (routeName != null) {
      //   Navigator.of(context).pushNamed(routeName);
      // }

    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      final snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      final snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Iterable<Contact> _contacts = [];

  List<Contact> contactList = [];

  void setContact() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  final RegistrationPageController _registrationPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    var getContactBottomSheet = Container(
      height: 700.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 19.h,
            margin: EdgeInsets.symmetric(
              horizontal: 18.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 19.h,
                  width: 19.h,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 18.5.h),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: Colors.white,
              ),
              // height: 236.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 32.h),
                      height: 22.h,
                      child: Text(
                        'Add emergency contact',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff170F3D),
                        ),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                    height: 24.h,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        for (var item in _contacts)
                          GestureDetector(
                            onTap: () {
                              if (contactList.length < 1) {
                                setState(() {
                                  contactList.add(item);
                                  Get.back();
                                });
                              } else if (contactList.length < 3) {
                                for (var itemt in contactList) {
                                  if (itemt == item) {
                                    Get.back();
                                    return;
                                  } else {
                                    setState(() {
                                      contactList.add(item);
                                      Get.back();
                                    });
                                  }
                                }
                              } else {
                                Get.back();
                                Get.snackbar(
                                  'Max contacts reached',
                                  'you have reached the maximum number of emergency contacts allowed',
                                  backgroundColor: Color(0xff4F25FF),
                                  colorText: Colors.white,
                                  duration: Duration(seconds: 3),
                                );
                                return;
                              }
                            },
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 2,
                              ),
                              leading: (item.avatar != null &&
                                      item.avatar.isNotEmpty)
                                  ? CircleAvatar(
                                      backgroundImage: MemoryImage(item.avatar),
                                    )
                                  : CircleAvatar(
                                      child: Text(item.initials()),
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                    ),
                              title: Text(item.displayName ?? ''),
                              //This can be further expanded to showing contacts detail
                              // onPressed().
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ModalProgressHUD(
            inAsyncCall: _registrationPageController.contactsLoader.value,
            color: Colors.white,
            progressIndicator: spinkit,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  PsuedoAppBar(
                    showBackButton: true,
                    showLogo: true,
                    title: 'Select contact',
                    subtitle: 'select at least two emergency contacts',
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var item in contactList)
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 2,
                            ),
                            leading: (item.avatar != null &&
                                    item.avatar.isNotEmpty)
                                ? CircleAvatar(
                                    backgroundImage: MemoryImage(item.avatar),
                                  )
                                : CircleAvatar(
                                    child: Text(item.initials()),
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  ),
                            trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  contactList.removeWhere(
                                      (element) => element == item);
                                });
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red[300],
                              ),
                            ),
                            title: Text(item.displayName ?? ''),
                            subtitle: item.emails.isNotEmpty
                                ? Text(item.emails.first.value)
                                : Text(''),
                            //This can be further expanded to showing contacts detail
                            // onPressed().
                          ),
                        Container(
                          height: 50,
                          child: TextButton.icon(
                              onPressed: () async {
                                Get.bottomSheet(getContactBottomSheet);
                              },
                              icon: Icon(
                                Icons.add,
                                color: Color(0xff4F25FF),
                              ),
                              label: Text(
                                'Add Contact',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff4F25FF),
                                    fontSize: 16.sp),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                        child: const Text('Next'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xff4F25FF),
                          ),
                        ),
                        onPressed: () async {
                          List _contacts = [];
                          if (contactList.length < 4 &&
                              contactList.length >= 1) {
                            for (var item in contactList) {
                              Map<String, dynamic> subBody = {
                                'name': item.displayName,
                                'phone': item.phones.first.value,
                                if (item.emails.isNotEmpty)
                                  'email': item.emails.first.value
                              };
                              _contacts.add(subBody);
                            }
                          }
                          for (var i = 0; i < _contacts.length; i++) {
                            print(_contacts[i]);
                          }
                          _registrationPageController
                              .addGroupContacts(_contacts);
                          // Get.toNamed(Routes.HOME_PAGE);
                        }),
                  ),
                  SizedBox(
                    height: 24,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
