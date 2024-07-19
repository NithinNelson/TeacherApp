import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({super.key});


  @override
  Widget build(BuildContext context) {
    int itemLength = 4;
    return Container(
      height: 70.w * (itemLength % 2 == 1 ? ((itemLength - 1)/2) : (itemLength/2)) + (itemLength % 2 == 1 ? 70.w : 0.w),
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8).w,
      child: GridView.builder(

        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemLength,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.w,
          // childAspectRatio: 2.8.w,
          mainAxisExtent: 55.w,
        ),
        itemBuilder: (context, index) {
          List<Color> colors = [
            Colorutils.Subjectcolor1,
            Colorutils.Subjectcolor2,
            Colorutils.Subjectcolor3,
            Colorutils.Subjectcolor4,
          ];
          Color color = colors[index % colors.length];
          List<Color> colors1 = [
            Colorutils.Subjectcolor11,
            Colorutils.Subjectcolor22,
            Colorutils.Subjectcolor33,
            Colorutils.Subjectcolor44,
          ];
          Color color1 = colors1[index % colors.length];
          return Container(
            // height: 50.w,
            padding: const EdgeInsets.symmetric(horizontal: 5).w,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(13.0).r,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 45.w,
                  width: 45.w,
                  decoration: BoxDecoration(
                    color:color1,
                    borderRadius: BorderRadius.circular(8.0).r,
                  ),
                  child: Center(
                    child: Text(
                      '4A',
                      style: TeacherAppFonts.interW600_16sp_letters1,
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'Mathematics',
                          style: TeacherAppFonts.interW500_16sp_letters1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
