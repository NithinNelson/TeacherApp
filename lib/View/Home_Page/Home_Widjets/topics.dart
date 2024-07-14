import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';

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
        ),
        width: double.infinity,
        height: 180,
        child: Column(
          children: [
            Container(
              height: 160,
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
                children: [
                  Container(
                    height: 160,
                    width: 200,
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.only(left: 16).w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70.w,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/calculator 1.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Container(
                                  height: 70.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mathematics',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                      Text(
                                        '4A',
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text('Linear Algebra Equations'),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50.w,
                                width: 100.w,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      left: 0,
                                      child: CircleAvatar(
                                        child: SvgPicture.asset(
                                          'assets/images/profile image.png',
                                          fit: BoxFit.contain,
                                        ),
                                        radius: 15,
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      child: CircleAvatar(
                                        child: SvgPicture.asset(
                                          'assets/images/profile image.png',
                                          fit: BoxFit.contain,
                                        ),
                                        radius: 15,
                                      ),
                                    ),
                                    Positioned(
                                      left: 40,
                                      child: CircleAvatar(
                                        child: SvgPicture.asset(
                                          'assets/images/profile image.png',
                                          fit: BoxFit.contain,
                                        ),
                                        radius: 15,
                                      ),
                                    ),
                                    Positioned(
                                      left: 60,
                                      child: CircleAvatar(
                                        child: SvgPicture.asset(
                                          'assets/images/profile image.png',
                                          fit: BoxFit.contain,
                                        ),
                                        radius: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Students',
                                style: GoogleFonts.inter(
                                    fontSize: 14.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      "assets/images/book2.png",
                      fit: BoxFit.fitWidth,
                    ),
                  )
                ],
              ),
            ),
            Text(
              '8.0AM - 12.0PM',
              style: GoogleFonts.inter(
                  fontSize: 12.0,
                  color: Colorutils.timecolortopics,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
