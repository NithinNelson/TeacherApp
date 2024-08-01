import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Controller/api_controllers/notificationController.dart';
import '../../Models/api_models/chat_group_api_model.dart';
import '../../Models/api_models/notification_api_model.dart';
import '../../Utils/Colors.dart';
import '../../Utils/constants.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key});

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  get questionData => null;

  get isChecked => null;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleLight,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Stack(
              children: [
                AppBarBackground(),
                Positioned(
                  left: 0,
                  top: -10,
                  child: Container(
                    // height: 100.w,
                    width: ScreenUtil().screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    child: const UserDetails(
                        shoBackgroundColor: false, isWelcome: false),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10.w,
                    top: 130.h,
                    right: 10.w,
                  ),
                  width: double.infinity,
                  height: 700,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r),
                    ),

                    // Border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colorutils.userdetailcolor.withOpacity(0.3),
                        // Shadow color
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.notifications_none_sharp,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Notifications",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                 GetX<NotificationController>(
                                  builder: (NotificationController controller) {
                                     List<RecentNotifications> messagelist = controller.Recentnotification.value;
                                     return Column(
                                       mainAxisSize: MainAxisSize.min,
                                       children: [
                                         for(int i=0; i < messagelist.length; i++)
                                           _notifyme(context)
                                       ],
                                     );
                                  },


                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
            ,
          )
      )
      ,
    );
  }

  rubrics({required rubricslessonob}) {}
}

Widget _notifyme(BuildContext context) =>
    Container(
      margin: EdgeInsets.all(8.0),
      width: MediaQuery
          .of(context)
          .size
          .width,
      //margin: EdgeInsets.only(left: 20.w, right: 20.w),
      decoration: BoxDecoration(
          color: Colorutils.chatcolor.withOpacity(0.2),
          border: Border.all(color: Colorutils.chatcolor),
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "",
              style: TextStyle(color: Colors.blueGrey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //   margin:  EdgeInsets.all(4),
                //   child: Text(notificationResult!["data"]["details"]["recentNotifications"][index]["status"],
                //     style: TextStyle(color: ColorUtils.SEARCH_TEXT_COLOR),
                //   ),
                // ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    "30-08-1999",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () async {
                      SharedPreferences preference =
                      await SharedPreferences.getInstance();
                      var count = preference.getInt("count");
                      var newResult = count! - 1;
                      preference.setInt("count", newResult);
                      print(newResult);
                    },
                    child: Text(
                      "Mark as Read",
                      style: TextStyle(color: Colors.red),
                    ))

                //
                // notificationResult!["data"][
                // "details"]
                // [
                // "recentNotifications"][index]
                // [
                // "status"] ==
                //     "active"
                //     ? ElevatedButton(
                //     style: ElevatedButton
                //         .styleFrom(
                //         primary:
                //         Color(
                //             0xFFECF1FF)),
                //     onPressed:
                //         () async {
                //       setState(() {
                //         isLoading =
                //         true;
                //         notificationResult!["data"]["details"]["recentNotifications"][index]
                //         [
                //         "status"] =
                //         'inactive';
                //       });
                //       print(
                //           'is Active--->${notificationResult!["data"]["details"]["recentNotifications"][index]["status"]}');
                //       markAsReadNotification(notificationResult!["data"]
                //       [
                //       "details"]
                //       [
                //       "recentNotifications"]
                //       [
                //       index]["_id"]);
                //       SharedPreferences
                //       preference =
                //       await SharedPreferences
                //           .getInstance();
                //       var count =
                //       preference
                //           .getInt(
                //           "count");
                //       var newResult =
                //           count! -
                //               1;
                //       preference.setInt(
                //           "count",
                //           newResult);
                //       print(
                //           newResult);
                //     },
                //     child: Text(
                //       "Mark as Read",
                //       style: TextStyle(
                //           color: ColorUtils
                //               .RED),
                //     ))
                //     : Text("")
              ],
            ),
          ],
        ),
      ),
    );

mixin context {}
