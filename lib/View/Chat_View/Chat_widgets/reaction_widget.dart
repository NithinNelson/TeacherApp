
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teacherapp/Utils/Colors.dart';

import '../../../Utils/font_util.dart';

class ReactionContainerWidget extends StatelessWidget {
  const ReactionContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.h),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("👍", style: TextStyle(fontSize: 30.h)),
          SizedBox(width: 5.h),
          Text("🥰", style: TextStyle(fontSize: 30.h)),
          SizedBox(width: 5.h),
          Text("😁", style: TextStyle(fontSize: 30.h)),
          SizedBox(width: 5.h),
          Text("😂", style: TextStyle(fontSize: 30.h)),
          SizedBox(width: 5.h),
          Text("🔥", style: TextStyle(fontSize: 30.h)),
          SizedBox(width: 5.h),
          Text("🙏", style: TextStyle(fontSize: 30.h)),
          SizedBox(width: 5.h),
          Container(
            height: 32.h,
            width: 32.h,
            padding: const EdgeInsets.all(6).w,
            decoration: const BoxDecoration(
              color: Color(0xFFE2E2E2),
              shape: BoxShape.circle,
            ),
            child: const FittedBox(child: Icon(Icons.add, color: Colorutils.reactionAddButton)),
          ),
        ],
      ),
    );
  }
}
