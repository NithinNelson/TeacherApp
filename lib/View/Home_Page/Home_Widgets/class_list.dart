import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';
import '../../../Models/api_models/time_table_api_model.dart';

class ClassList extends StatelessWidget {
  final List<TimeTable> todaySubjects;
  const ClassList({super.key, required this.todaySubjects});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(todaySubjects.length, (index) {
          List<Color> colors = [
            Colorutils.Classcolour1,
            Colorutils.Classcolour2,
            Colorutils.Classcolour3,
          ];
          Color color = colors[index % colors.length];

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25).r,
              color: color,
            ),
            margin: const EdgeInsets.only(top: 3, bottom: 4, left: 4, right: 4),
            width: 160.w,
            height: 130.w,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 13, left: 13, bottom: 13, right: 6).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todaySubjects[index].batchName?.replaceAll(" ", "") ?? '--',
                        style: TeacherAppFonts.interW500_32sp_textWhite,
                      ),
                      const Spacer(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(
                              todaySubjects[index].subject ?? '--',
                              style: TeacherAppFonts.interW400_18sp_textWhite,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '24 Students',
                        style: TeacherAppFonts.interW400_14sp_textWhiteOp75,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(25)).r,
                    child: SvgPicture.asset(
                      index % 2 == 0
                          ? 'assets/images/svggui.svg'
                          : "assets/images/svgui2.svg",
                      // width: 95.w,
                      height: 50.w,
                      color: index % 2 == 0
                          ? Colorutils.svguicolour
                          : Colorutils.svguicolour2,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
