import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';

class Classlist extends StatelessWidget {
  const Classlist({super.key});



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) {

          List<Color> colors = [Colorutils.Classcolour1,Colorutils.Classcolour2, Colorutils.Classcolour3];

          Color color = colors[index % colors.length];
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                  color: color
            ),
            margin: EdgeInsets.only(top: 3,bottom: 3,left: 4,right: 4), // Adds space between containers
            width: 168.w,
            height: 130.w,
            child: Stack(
              children: [
                Positioned(

                  right:0,
                  top: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(30)),
                    child: Container(
                      height: 58.w,
                      width: 95.w,
                      child: SvgPicture.asset(
                       index%2==0? 'assets/images/svggui.svg':"assets/images/svgui2.svg",
                        color: index%2==0? Colorutils.svguicolour:Colorutils.svguicolour2,
                        fit: BoxFit
                            .fill, // Make sure the SVG file is located in the assets folder
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,left: 10),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '4A',
                        style: GoogleFonts.inter(
                          fontSize: 32.0,

                          color: Colors.white,

                        ),
                      ),
                      Text(
                        'Mathematics',
                        style: GoogleFonts.inter(
                          fontSize: 18.0,

                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '24 Students',
                        style: GoogleFonts.inter(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colorutils.Whitecolor.withOpacity(0.6),
                        ),
                      ),
                    ],
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
