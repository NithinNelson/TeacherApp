

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacherapp/Utils/Colors.dart';

class TeacherAppFonts {
  static final TeacherAppFonts _instance = TeacherAppFonts._internal();

  TeacherAppFonts._internal();

  factory TeacherAppFonts() {
    return _instance;
  }

  static const _interFont = 'Inter';

  static final TextStyle interW600_20sp_textWhite = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    color: Colorutils.Whitecolor,
  );

  static final TextStyle interW600_18sp_textWhite = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    color: Colorutils.Whitecolor,
  );

  static final TextStyle interW600_14sp_letters1 = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    color: Colorutils.letters1,
  );

  static final TextStyle interW600_16sp_letters1 = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: Colorutils.letters1,
  );

  static final TextStyle interW500_16sp_letters1 = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: Colorutils.letters1,
  );

  static final TextStyle interW700_16sp_letters1 = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    color: Colorutils.letters1,
  );

  static final TextStyle interW400_16sp_letters1 = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: Colorutils.letters1,
  );

  static final TextStyle interW500_11sp_userdetailcolor = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w500,
    fontSize: 11.sp,
    color: Colorutils.userdetailcolor,
  );

  static final TextStyle interW500_16sp_textWhiteOp60 = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: Colorutils.Whitecolor.withOpacity(0.6),
  );

  static final TextStyle interW500_18sp_black = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    color: Colors.black,
  );

  static final TextStyle interW400_14sp_textWhiteOp60 = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: Colorutils.Whitecolor.withOpacity(0.6),
  );

  static final TextStyle interW500_32sp_textWhite = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w500,
    fontSize: 32.sp,
    color: Colorutils.Whitecolor,
  );

  static final TextStyle interW400_18sp_textWhite = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
    color: Colorutils.Whitecolor,
  );

  static final TextStyle interW400_14sp_textWhiteOp75 = TextStyle(
    fontFamily: _interFont,
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: Colorutils.Whitecolor.withOpacity(0.75),
  );
}