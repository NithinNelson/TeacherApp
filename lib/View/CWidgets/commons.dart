import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/Colors.dart';

BoxDecoration themeCardDecoration = BoxDecoration(
  color: Colorutils.Whitecolor,
  borderRadius: BorderRadius.circular(20).r,
  boxShadow: [
    BoxShadow(
      color: Colors.teal.shade50,
      spreadRadius: 1,
      blurRadius: 0,
      offset: const Offset(0, 1),
    ),
  ],
);
