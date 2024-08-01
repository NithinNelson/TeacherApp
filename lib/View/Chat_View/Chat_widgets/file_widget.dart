
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../Utils/font_util.dart';

class FileWidget1 extends StatelessWidget {
  const FileWidget1({
    super.key,
    required this.fileName,
    required this.fileType,
    required this.fileLink,
  });

  final String fileName;
  final String fileType;
  final String fileLink;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          await launchUrlString(fileLink);
        },
        child: IntrinsicHeight(
          child: Container(
            width: 230.w,
            // height: 50,
            decoration: BoxDecoration(
              color: Colorutils.userdetailcolor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.h),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    width: 35.w,
                    height: 35.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/new-document.png"),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      fileType,
                      style: TeacherAppFonts.interW500_12sp_textWhite.copyWith(
                        fontSize: 10.sp,
                        color: Colors.black,
                      ),
                    )),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                      child: Text(
                    fileName,
                    style: TeacherAppFonts
                        .interW400_16sp_letters1
                        .copyWith(color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FileWidget2 extends StatelessWidget {
  const FileWidget2({
    super.key,
    required this.fileName,
    required this.fileType,
    required this.fileLink,
  });

  final String fileName;
  final String fileType;
  final String fileLink;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          await launchUrlString(fileLink);
        },
        child: Container(
          width: 230.w,
          // height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.h),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  width: 35.w,
                  height: 35.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/new-document.png"),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    fileType,
                    style: TeacherAppFonts.interW500_12sp_textWhite.copyWith(
                      fontSize: 10.sp,
                      color: Colors.black,
                    ),
                  )),
                ),
                SizedBox(width: 5.w),
                Expanded(
                    child: Text(
                  fileName,
                  style: TeacherAppFonts
                      .interW400_16sp_letters1
                      .copyWith(color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
