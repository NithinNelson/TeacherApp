import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacherapp/Utils/Colors.dart';

class TimeTable extends StatelessWidget {
  const TimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        height: 38.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                'Timetable',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            SizedBox(width: 70,),
            TextButton(onPressed: () {}, child: Row(

              children: [
                Text(
                  '5 Classes Today',
                  style: TextStyle(
                    fontSize: 15.0,

                    color: Colorutils.letters1,
                    fontFamily: 'Roboto',
                  ),
                ),
               SizedBox(width: 5,),
               Icon(Icons.arrow_forward_ios_outlined, color: Colorutils.letters1,size: 15,)

              ],
            ))
          ],
        ),
      ),
    );
  }
}
