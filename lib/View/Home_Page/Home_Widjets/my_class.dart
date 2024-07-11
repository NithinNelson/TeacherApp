import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';

class Myclass extends StatelessWidget {
  const Myclass({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 8,top: 2,bottom: 2),
      child: Container(
        height: 50.w,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                'My Class',
                style: GoogleFonts.inter(
                  fontSize: 25.0,
fontWeight: FontWeight.bold,

                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colorutils.threedotcolor,
              radius: 23.0,
              child: SvgPicture.asset(
                'assets/images/DotsThreeOutline.svg',
               fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
