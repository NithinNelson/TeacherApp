import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
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

  static submitFailedTwoBack({
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
  static Trackingpop({
    String? title,
    required String message,
    required String actionName,
    required Color iconColor,
    required String timeText,
  }) {
    return Get.dialog(
      AlertDialog(

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),

        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                   Get.back();
                  },
                  child: Container(
                    child: Icon(Icons.clear),
                  ),
                ),
              ],
            ),
           Container(
               height:30,width:30,child: Image.asset("assets/images/Vector.png")),
            if(title != null)
              SizedBox(height: 10.w),
            if(title != null)
              Text(
                title,
                style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.bold),

              ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: TeacherAppFonts.interW600_18sp_textWhite.copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left Avatar (Lucas)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colorutils.chatcolor.withOpacity(0.3),
                        radius: 18,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("assets/images/profileOne.svg"),
                        ),
                      ),


                    ],
                  ),
                ),

                // Dashed Line with Time Text in the Middle
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(10, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          width: 8,
                          height: 8,

                        );
                      }),
                    ),
                    Stack(

                      children: [

                        Container(
                          width: 170.w,
                          height: 8,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colorutils.track1,Colorutils.track2], // Define your gradient colors here
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,

                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(11, (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: 3,
                              height: 10,
                              color: Colors.white,

                            );
                          }),
                        ),

                      ],
                    ),

                    SizedBox(height: 4),
                    Text(
                      timeText,
                      style: TextStyle(color: Colors.orange, fontSize: 14),
                    ),
                  ],
                ),

                // Right Avatar (You)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colorutils.chatcolor.withOpacity(0.3),
                        radius: 18,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("assets/images/profileOne.svg"),
                        ),
                      ),


                    ],
                  ),
                ),

              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("brinesh ben",

                      style: TextStyle(color: Colors.grey,fontSize: 12)),
                  Text("You",
                      style: TextStyle(color: Colors.grey,fontSize: 12)),
                ],
              ),
            ),

          ],
        ),

        actionsAlignment: MainAxisAlignment.center,
        actions: [

          Container(
            
            height: 40,
            width:250 ,
            decoration: BoxDecoration(
                color: Colorutils.userdetailcolor,
              borderRadius: BorderRadius.circular(10)
            ),
            
            child: Center(
              child: Text(
                  actionName, style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          )
          // FilledButton(
          //   onPressed: () {
          //     Get.back();
          //
          //   },
          //   style: ButtonStyle(
          //
          //     backgroundColor: WidgetStateProperty.all(Colorutils.letters1),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         actionName,
          //         style: TextStyle(color: Colors.white, fontSize: 16.sp),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
  static submitFailedThreeBack({
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
    ).then((value) {
      Get.back();
      Get.back();
    },);
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
          Padding(
            padding: const EdgeInsets.only(left: 18,right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100.w,
                  child: FittedBox(
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
                    child: Text(
                      "Ok",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2


      ..style = PaintingStyle.stroke;

    double dashWidth = 6;
    double dashSpace = 4;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}