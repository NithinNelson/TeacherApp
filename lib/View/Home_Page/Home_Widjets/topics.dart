import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';

class Topic extends StatelessWidget {
  const Topic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: Colorutils.topicbackground2,
          border: Border.all(
              color: Colorutils.letters1.withOpacity(0.3),
            width: 1.w,
          ),
        ),
        width: double.infinity,
        height: 190.h,
        child: Column(
          children: [
            Container(
              height: 160.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Colorutils.topicbackground
                    .withOpacity(0.3), // You can change this color as needed
              ),
              // margin: EdgeInsets.only(
              //     bottom:
              //         23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            height: 55.h,
                            'assets/images/calculator 1.svg',
                            fit: BoxFit.fitHeight,
                          ),
                          SizedBox(width: 5.w),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mathematics',
                                style: TeacherAppFonts.interW400_18sp_timecolortopics,
                              ),
                              Text(
                                '4A',
                                style: TeacherAppFonts.interW500_24sp_timecolortopics,
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                          'Linear Algebra Equations',
                        style: TeacherAppFonts.interW400_14sp_timecolortopicsOp80,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 50.w,
                            width: 100.w,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 0,
                                  child: CircleAvatar(
                                    radius: 15,
                                    child: Image.asset('assets/images/profile2.png'),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  child: CircleAvatar(
                                    radius: 15,
                                    child: Image.asset('assets/images/profile2.png'),
                                  ),
                                ),
                                Positioned(
                                  left: 40,
                                  child: CircleAvatar(
                                    radius: 15,
                                    child: Image.asset('assets/images/profile2.png'),
                                  ),
                                ),
                                const Positioned(
                                  left: 60,
                                  child: CircleAvatar(
                                     backgroundColor:  Colorutils.userdetailcolor,
                                    radius: 15,
                                    child: Text('+23',style: TextStyle(
                                      color: Colorutils.Whitecolor,
                                      fontSize: 12,
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Students',
                            style: TeacherAppFonts.interW600_12sp_timecolortopicsOp80,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5).w,
                    child: Image.asset(
                      "assets/images/book2.png",
                      fit: BoxFit.fitWidth,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Text(
              '8.0AM - 12.0PM',
              style: TeacherAppFonts.interW600_14sp_timecolortopics,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
