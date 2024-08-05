import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Models/api_models/login_api_model.dart';
import 'package:teacherapp/Services/shared_preferences.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';
import 'package:teacherapp/View/Login_page/login.dart';

import '../../Services/controller_handling.dart';

class TeacherAppPopUps {
  static final TeacherAppPopUps _instance = TeacherAppPopUps._internal();

  TeacherAppPopUps._internal();

  factory TeacherAppPopUps() {
    return _instance;
  }

  static submitFailed({
    required String title,
    required String message,
    required String actionName,
    required IconData iconData,
    required Color iconColor,
  }) {
    return Get.dialog(
      AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Column(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 50.w,
            ),
            SizedBox(height: 10.w),
            Text(
              title,
              style: TeacherAppFonts.interW600_18sp_textWhite.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.sp),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
            onPressed: () {
              Get.back();
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colorutils.letters1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  actionName,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static logOutPopUp({required BuildContext context}) {
    return Get.dialog(
      AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Column(
          children: [
            SizedBox(height: 10.w),
            Text(
              "Logout",
              style: TeacherAppFonts.interW600_18sp_textWhite.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
        content: Text(
          "Are you sure you want to Logout?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.sp),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
            onPressed: () async {
              await SharedPrefs().removeLoginData();
              HandleControllers.deleteAllGetControllers();
              HandleControllers.createGetControllers();
              Get.offAll(const LoginPage());
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colorutils.letters1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
