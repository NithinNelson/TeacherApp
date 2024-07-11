import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/Colors.dart';

class UserDetails extends StatelessWidget {
  final ZoomDrawerController   zoomDrawerController;
  const UserDetails({super.key, required this.zoomDrawerController});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top:5,left: 10,right: 10,bottom: 3),
        child: Container(
          height: 90.w,
          decoration: BoxDecoration(
            color: Colorutils.userdetailcolor,
            borderRadius: BorderRadius.circular(17.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: GestureDetector(
                  onTap: (){ ZoomDrawer.of(context)?.toggle();},
                  child: Container(
                    height: 45.w,
                    width: 45.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/menu.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50.w,
                width: 155.w,
                margin: EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',

                      style: GoogleFonts.inter(
                        color: Colorutils.Whitecolor.withOpacity(0.6),
                        fontSize: 15.0,


                      ),
                    ),

                    Text(
                      'Fathima Nourin',
                      style: GoogleFonts.inter(
                        color: Colorutils.Whitecolor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    padding: const EdgeInsets.all(7).w,
                    decoration: const BoxDecoration(

                      //
                      // image: DecorationImage(
                      //   image: AssetImage('assets/images/bell 1.png'),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/bell 1.svg',
                      width: 200,
                      height: 200,
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
                          style: const TextStyle(
                            color: Colorutils.userdetailcolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10,),
              CircleAvatar(
                radius: 25.0,
                backgroundColor: Colorutils.Whitecolor,
                child: CircleAvatar(
                  radius: 24.0,
                  backgroundImage:
                      AssetImage('assets/images/profile image.png'),
                ),
              ),
            ],
          ),
        ));
  }
}
