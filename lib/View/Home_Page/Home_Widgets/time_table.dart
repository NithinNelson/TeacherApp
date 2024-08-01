
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Models/api_models/time_table_api_model.dart';
import 'package:teacherapp/Utils/font_util.dart';
import '../../../Utils/Colors.dart';
class AllTimeTable extends StatelessWidget {
  final List<TimeTable> todaySubjects;
  const AllTimeTable({super.key, required this.todaySubjects});

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
            style: const ButtonStyle(
              splashFactory: NoSplash.splashFactory,
            ),
            child: Row(
              children: [
                Text(
                  '${todaySubjects.length} ',
                  style: TeacherAppFonts.interW700_16sp_letters1,
                ),
                Text(
                  todaySubjects.length == 1 || todaySubjects.isEmpty ? 'Class Today' : 'Classes Today',
                  style: TeacherAppFonts.interW400_16sp_letters1,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
