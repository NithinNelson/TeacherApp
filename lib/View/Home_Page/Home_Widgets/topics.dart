import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';

import '../../../Models/api_models/time_table_api_model.dart';

class Topic extends StatelessWidget {
  final List<TimeTable> todaySubjects;
  const Topic({super.key, required this.todaySubjects});

  @override
  Widget build(BuildContext context) {
    TimeTable? timeTable;
    if(todaySubjects.isNotEmpty) {
      timeTable = findUpcomingTime(todaySubjects);
      timeTable ??= todaySubjects.first;
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
                                Container(
                                  width:100,
                                  child: Text(

                                    timeTable.subject ?? '--',
                                    style: TeacherAppFonts.interW400_18sp_timecolortopics,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  timeTable.batchName ?? '--',
                                  style: TeacherAppFonts.interW500_24sp_timecolortopics,
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 150,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  "Linear Algebra Equations dsfsdg werfahgbfg",
                                  style: TeacherAppFonts.interW400_14sp_timecolortopicsOp80,                              ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 50.w,
                              width: 110.w,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    left: 0,
                                    child: CircleAvatar(
                                      radius: 12,
                                      child: Image.asset('assets/images/profile2.png'),
                                    ),
                                  ),
                                  Positioned(
                                    left: 15,
                                    child: CircleAvatar(
                                      radius: 12,
                                      child: Image.asset('assets/images/profile2.png'),
                                    ),
                                  ),
                                  Positioned(
                                    left: 30,
                                    child: CircleAvatar(
                                      radius: 12,
                                      child: Image.asset('assets/images/profile2.png'),
                                    ),
                                  ),
                                  Positioned(
                                    left: 45,
                                    child: CircleAvatar(
                                      radius: 12,
                                      child: Image.asset('assets/images/profile2.png'),
                                    ),
                                  ),
                                  const Positioned(
                                    left: 60,
                                    child: CircleAvatar(
                                      backgroundColor:  Colorutils.userdetailcolor,
                                      radius: 12,
                                      child: Text('23',style: TextStyle(
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
                    SizedBox(width: 10,),
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
                 timeTable.timeString?.replaceAll("[", "").replaceAll("]", "").replaceAll("-", " - ") ?? '--',
                style: TeacherAppFonts.interW600_14sp_timecolortopics,
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  TimeTable? findUpcomingTime(List<TimeTable> timeTable) {
    final now = DateTime.now();
    List<TimeTable> upcomingEntries = [];

    for (var entry in timeTable) {
      final startTime = entry.startTime;
      if (startTime != null && startTime.isAfter(now)) {
        upcomingEntries.add(entry);
      }
    }

    if (upcomingEntries.isNotEmpty) {
      upcomingEntries.sort((a, b) => a.startTime!.compareTo(b.startTime!));
      return upcomingEntries.first; // Return the earliest upcoming entry
    }

    return null; // No upcoming entries found
  }
}
