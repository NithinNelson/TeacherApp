
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          SizedBox(
            height: 32.h,
            width: 32.h,
            child: SvgPicture.asset("assets/svg/Add.svg"),
          )
        ],
      ),
    );
  }
}
