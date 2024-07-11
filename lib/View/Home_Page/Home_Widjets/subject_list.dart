import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';

class subjectlist extends StatelessWidget {
  const subjectlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.w,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
              height: 75.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 58.w,
                    width: 163.w,
                    decoration: BoxDecoration(
                      color: Colorutils.Subjectcolor1,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Container(
                            height: 45.w,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: Colorutils.Subjectcolor11,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                '4A',
                                style: GoogleFonts.inter(
                                  fontSize: 16.0,
                                  color: Colorutils.letters1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            'Mathematics',
                            style: GoogleFonts.inter(
                              fontSize: 16.0,
                              color: Colorutils.letters1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 58.w,
                    width: 163.w,
                    decoration: BoxDecoration(
                      color: Colorutils.Subjectcolor2,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Container(
                            height: 45.w,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: Colorutils.Subjectcolor22,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                '6A',
                                style: GoogleFonts.inter(
                                  fontSize: 16.0,
                                  color: Colorutils.letters2,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            'Mathematics',
                            style: GoogleFonts.inter(
                              fontSize: 16.0,
                              color: Colorutils.letters2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
              height: 75.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 58.w,
                    width: 163.w,
                    decoration: BoxDecoration(
                      color: Colorutils.Subjectcolor3,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Container(
                            height: 45.w,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: Colorutils.Subjectcolor33,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                '7A',
                                style: GoogleFonts.inter(
                                  fontSize: 16.0,
                                  color: Colorutils.letters3,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            'Mathematics',
                            style: GoogleFonts.inter(
                              fontSize: 16.0,
                              color: Colorutils.letters3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 58.w,
                    width: 162.w,
                    decoration: BoxDecoration(
                      color: Colorutils.Subjectcolor4,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Container(
                            height: 45.w,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: Colorutils.Subjectcolor44,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                '4A',
                                style: GoogleFonts.inter(
                                  fontSize: 16.0,
                                  color: Colorutils.letters4,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            'Mathematics',
                            style: GoogleFonts.inter(
                              fontSize: 16.0,
                              color: Colorutils.letters4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ),
        ],
      ),
    );
  }
}
