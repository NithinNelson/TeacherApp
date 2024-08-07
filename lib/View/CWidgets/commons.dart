import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/Colors.dart';

BoxDecoration themeCardDecoration = BoxDecoration(
  color: Colorutils.Whitecolor,
  borderRadius: BorderRadius.circular(20).r,
  boxShadow: [
    BoxShadow(
      color: Colorutils.userdetailcolor.withOpacity(0.15),
      spreadRadius: 1,
      blurRadius: 1,
      offset: const Offset(0, 1),
    ),
  ],
);
