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
    String? title,
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
            if(title != null)
              SizedBox(height: 10.w),
            if(title != null)
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.w,
                child: FilledButton(

                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  child: Row(
                    children: [
                      Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 100.w,
                child: FilledButton(
                  onPressed: () async {
                    HandleControllers.deleteAllGetControllers();
                    await SharedPrefs().removeLoginData();
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginPage()), (_) => false);
                    HandleControllers.createGetControllers();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colorutils.letters1),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Row(
                        children: [
                          Text(
                            "Ok",
                            style: TextStyle(color: Colors.white, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
