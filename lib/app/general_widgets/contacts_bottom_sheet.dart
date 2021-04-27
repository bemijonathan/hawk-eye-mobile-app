// import 'package:contacts_service/contacts_service.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:pointtograph/add_place/category_list_model.dart';

// class UpdateCategoryBottomSheet extends StatelessWidget {
//   final List<Contact> contacts;

//   const UpdateCategoryBottomSheet({
//     Key key,
//     @required this.contacts,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 600.h,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             height: 19.h,
//             margin: EdgeInsets.symmetric(
//               horizontal: 18.w,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   height: 19.h,
//                   width: 19.h,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(
//                       Icons.cancel_outlined,
//                       color: Colors.white,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(height: 18.5.h),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(8), topRight: Radius.circular(8)),
//                 color: Colors.white,
//               ),
//               // height: 236.h,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Container(
//                       margin: EdgeInsets.symmetric(vertical: 32.h),
//                       height: 22.h,
//                       child: Text(
//                         'Add emergency contact',
//                         style: TextStyle(
//                           fontSize: 17.sp,
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xff170F3D),
//                         ),
//                         textAlign: TextAlign.center,
//                       )),
//                   SizedBox(
//                     height: 56.h,
//                   ),
//                   Expanded(
//                     child: ListView(
//                       children: [
//                         for (var item in contacts)
//                           GestureDetector(
//                             onTap: () {
//                               onChanged(categories[i]);
//                               Get.back();
//                             },
//                             child: ListTile(
//                               contentPadding: const EdgeInsets.symmetric(
//                                 vertical: 2,
//                               ),
//                               leading: (item.avatar != null &&
//                                       item.avatar.isNotEmpty)
//                                   ? CircleAvatar(
//                                       backgroundImage: MemoryImage(item.avatar),
//                                     )
//                                   : CircleAvatar(
//                                       child: Text(item.initials()),
//                                       backgroundColor:
//                                           Theme.of(context).primaryColor,
//                                     ),
//                               title: Text(item.displayName ?? ''),
//                               //This can be further expanded to showing contacts detail
//                               // onPressed().
//                             ),
//                           ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
