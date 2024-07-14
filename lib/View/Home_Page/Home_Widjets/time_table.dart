import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';

class TimeTable extends StatelessWidget {
  const TimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Timetable',
            style: TeacherAppFonts.interW500_18sp_black,
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  '5 ',
                  style: TeacherAppFonts.interW700_16sp_letters1,
                ),
                Text(
                  'Classes Today',
                  style: TeacherAppFonts.interW400_16sp_letters1,
                ),
                SizedBox(width: 5.w),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colorutils.letters1,
                  size: 15.w,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
