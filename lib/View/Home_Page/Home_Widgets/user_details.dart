import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Utils/font_util.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../../Controller/api_controllers/notificationController.dart';
import '../../../Models/api_models/notification_api_model.dart';
import '../../../Utils/Colors.dart';
import '../../Notification/Notification.dart';

class UserDetails extends StatelessWidget {
  final bool shoBackgroundColor;
  final bool isWelcome;
  final bool bellicon;
  final bool notificationcount;
  const UserDetails(
      {super.key,
      required this.shoBackgroundColor,
      required this.isWelcome,
      required this.bellicon,
      required this.notificationcount});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 3),
        child: GetX<UserAuthController>(
          builder: (UserAuthController controller) {
            return SafeArea(
              child: Container(
                height: 90.h,
                decoration: BoxDecoration(
                  color: shoBackgroundColor
                      ? Colorutils.userdetailcolor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(17.0),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 12.w),
                    if (isWelcome)
                      GestureDetector(
                        onTap: () {
                          ZoomDrawer.of(context)?.toggle();
                        },
                        child: Container(
                          height: 50.w,
                          width: 50.w,
                          padding: const EdgeInsets.symmetric(horizontal: 9).w,
                          decoration: BoxDecoration(
                            color: Colorutils.Whitecolor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: SvgPicture.asset(
                            width: 50.w,
                            "assets/images/menu_icon.svg",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )
                    else
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 50.w,
                          width: 50.w,
                          padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 5, right: 8)
                              .w,
                          decoration: BoxDecoration(
                            color: Colorutils.Whitecolor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: SvgPicture.asset(
                            height: 50.w,
                            "assets/images/back.svg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isWelcome ? 'Welcome' : 'Hello,',
                            style: TeacherAppFonts.interW400_14sp_textWhiteOp60,
                          ),
                          Container(
                            child: TextScroll(
                              controller.userData.value.name ?? "--",
                              mode: TextScrollMode.bouncing,
                              velocity:
                                  Velocity(pixelsPerSecond: Offset(50, 0)),
                              delayBefore: Duration(seconds: 1),
                              pauseBetween: Duration(seconds: 2),
                              style: TeacherAppFonts.interW600_18sp_textWhite,
                              textAlign: TextAlign.center,
                              selectable: true,
                            ),
                          ),
                          // TextScroll(
                          //   'This is the sample text for Flutter TextScroll widget. ',
                          //   mode: TextScrollMode.bouncing,
                          //   velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                          //   delayBefore: Duration(milliseconds: 500),
                          //   numberOfReps: 5,
                          //   pauseBetween: Duration(milliseconds: 50),
                          //   style: TextStyle(color: Colors.green),
                          //   textAlign: TextAlign.right,
                          //   selectable: true,
                          // )
                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         controller.userData.value.name ?? "--",
                          //         style: TeacherAppFonts.interW600_18sp_textWhite,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    if (bellicon)
                      GetX<NotificationController>(
                        builder: (NotificationController controller) {
                          int value = controller.notificationStatusCount.value;
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Notificationscreen()));
                            },
                            child: Stack(
                              children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.only(right: 5, top: 5)
                                            .w,
                                    child: bellicon
                                        ? SvgPicture.asset(
                                            'assets/images/bell 1.svg',
                                            width: 30.h,
                                            fit: BoxFit.fitWidth,
                                          )
                                        : Text("")),
                                controller.notificationStatusCount.value != 0
                                    ? Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          width: 20.w,
                                          height: 20.w,
                                          padding: const EdgeInsets.all(2).w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colorutils.Whitecolor,
                                          ),
                                          child: FittedBox(
                                            child: Text(
                                              "$value",
                                              style: TeacherAppFonts
                                                  .interW500_11sp_userdetailcolor,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Text("")
                              ],
                            ),
                          );
                        },
                      ),
                    SizedBox(width: 12.w),
                    CircleAvatar(
                      radius: 26.r,
                      backgroundColor: Colorutils.Whitecolor,
                      child: CircleAvatar(
                        radius: 24.r,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100).r,
                          child: CachedNetworkImage(
                            imageUrl: controller.userData.value.image ?? '--',
                            errorWidget: (context, url, error) {
                              return const Icon(Icons.person,
                                  color: Colors.grey, size: 30,);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
