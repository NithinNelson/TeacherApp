import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:teacherapp/View/Learning_Walk/Learning_walk.dart';
import 'package:teacherapp/View/Lesson_Observation/Learning_Observation.dart';

import '../../Utils/Colors.dart';
import '../../Utils/font_util.dart';
import '../Home_Page/Home_Widjets/user_details.dart';

class leader extends StatefulWidget {

  const leader({super.key, });

  @override
  State<leader> createState() => _leaderState();
}

class _leaderState extends State<leader> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.93,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 180.w,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.w),
                            bottomRight: Radius.circular(12.w)),
                        color: Colorutils.userdetailcolor,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 0,
                    top: 40,
                    child: SvgPicture.asset(
                      'assets/images/pencil2.svg',
                      width: 100.w,
                      color: Colorutils.Whitecolor.withOpacity(0.1),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 240,
                    top: 25,
                    child: Transform.rotate(
                      angle: 0.5,
                      child: SvgPicture.asset(
                        'assets/images/stars1.svg',
                        width: 20.w,
                        color: Colorutils.Whitecolor.withOpacity(0.5),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    top: 65,
                    child: SvgPicture.asset(
                      'assets/images/graduation-cap-icon.svg',
                      width: 30.w,
                      color: Colorutils.Whitecolor.withOpacity(0.07),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 140,
                    top: 10,
                    child: SvgPicture.asset(
                      'assets/images/read-book-icon.svg',
                      width: 30.w,
                      color: Colorutils.Whitecolor.withOpacity(0.07),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 115,
                    top: 65,
                    child: SvgPicture.asset(
                      'assets/images/stars1.svg',
                      width: 20.w,
                      color: Colorutils.Whitecolor.withOpacity(0.5),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 10,
                    child: SvgPicture.asset(
                      'assets/images/stars1.svg',
                      width: 20.w,
                      color: Colorutils.Whitecolor.withOpacity(0.5),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 140,
                    child: SvgPicture.asset(
                      'assets/images/stars1.svg',
                      color: Colorutils.Whitecolor.withOpacity(0.9),
                      width: 25.w,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: -90,
                    child: SvgPicture.asset(
                      'assets/images/pencil3.svg',
                      color: Colorutils.Whitecolor.withOpacity(0.2),
                      height: 180.w,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Padding(
                        padding: const EdgeInsets.only( left: 7, right: 10, bottom: 3),
                        child: Container(
                          height: 80.w,
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 12.w),
                              GestureDetector(
                                onTap: () {
                                  ZoomDrawer.of(context)?.toggle();
                                },
                                child: Container(
                                  height: 45.w,
                                  width: 45.w,
                                  padding: const EdgeInsets.symmetric(horizontal: 9).w,
                                  decoration: BoxDecoration(
                                    color: Colorutils.Whitecolor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8).r,
                                  ),
                                  child: SvgPicture.asset(
                                    width: 45.w,
                                    "assets/images/menu_icon.svg",
                                    fit: BoxFit.fitWidth,
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
                                      'Welcome',
                                      style: TeacherAppFonts.interW400_14sp_textWhiteOp60,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Fathima Nourin',
                                            style: TeacherAppFonts.interW600_18sp_textWhite,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5, top: 5).w,
                                    child: SvgPicture.asset(
                                      'assets/images/bell 1.svg',
                                      width: 30.w,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 18.w,
                                      height: 18.w,
                                      padding: const EdgeInsets.all(2).w,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colorutils.Whitecolor,
                                      ),
                                      child: FittedBox(
                                        child: Text(
                                          "4",
                                          style: TeacherAppFonts.interW500_11sp_userdetailcolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 12.w),
                              CircleAvatar(
                                radius: 25.r,
                                backgroundColor: Colorutils.Whitecolor,
                                child: CircleAvatar(
                                  radius: 24.r,
                                  backgroundImage:
                                  AssetImage('assets/images/profile image.png'),
                                ),
                              ),
                              SizedBox(width: 12.w),
                            ],
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, top: 85.h, right: 20.w),
                    // width: 550.w,
                    height: 545.h,
                    decoration: BoxDecoration(
                      color: Colorutils.Whitecolor,
                      // Container color
                      borderRadius: BorderRadius.circular(20.r),
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Leadership',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Hos: Abitha',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueAccent),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.w, right: 15.w, top: 20.h),
                            child: GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Cannot fetch teacher data')));
                              },
                              child: GestureDetector(
                                onTap: (){

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => lessonobs()));
                                },
                                child: Container(
                                  height: 120.h,


                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromRGBO(101, 63, 244, 8),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60.h,
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.transparent),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 25.w),
                                          child: Image(
                                              image: AssetImage(
                                                  'assets/images/notebook 1.png')),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.w),
                                        child: Container(
                                            // height:0.h,
                                            child: const Text(
                                              "Lesson  \nObservation ",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromRGBO(
                                                      240, 236, 254, 8)),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, right: 10.w, top: 35.h),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => lessonwalk()));
                              },
                              child: Container(
                                height: 120.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff14C6C6),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 60.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.transparent),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 25.w),
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/journalist 1.png' )),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.w),
                                      child: Container(
                                          // height: 50.h,
                                          child: Text(
                                            "Learning  \nWalk",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color.fromRGBO(
                                                    240, 236, 254, 8)),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color.fromRGBO(0, 136, 170, 8),
                                  ),
                                  height: 28,
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/Synclesson.png",
                                        height: 20,
                                        // width: 20,
                                      ),
                                      Text(
                                        "Sync Lesson",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color.fromRGBO(0, 136, 170, 8),
                                  ),
                                  height: 28,
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/Synclearning.png",
                                        height: 20,
                                        // width: 20,
                                      ),
                                      Center(
                                          child: Text(
                                        "Sync Learning",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
