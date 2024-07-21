import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Utils/font_util.dart';
import '../../../Utils/Colors.dart';

class UserDetails extends StatelessWidget {
  final bool isLeaderHome;
  const UserDetails({super.key, required this.isLeaderHome});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 3),
        child: GetX<UserAuthController>(
          builder: (UserAuthController controller) {
            return Container(
              height: 90.w,
              decoration: BoxDecoration(
                color: isLeaderHome
                    ? Colorutils.userdetailcolor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(17.0),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12.w),
                  GestureDetector(
                    onTap: () {
                      ZoomDrawer.of(context)?.toggle();
                    },
                    child: Container(
                      height: 45.w,
                      width: 45.w,
                      padding: const EdgeInsets.symmetric(horizontal: 9).w,
                      decoration: BoxDecoration(
                        color: Colorutils.Whitecolor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      child: SvgPicture.asset(
                        width: 45.w,
                        "assets/images/menu_icon.svg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TeacherAppFonts.interW400_14sp_textWhiteOp60,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                controller.userData.value.name ?? "--",
                                style: TeacherAppFonts.interW600_18sp_textWhite,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5, top: 5).w,
                        child: SvgPicture.asset(
                          'assets/images/bell 1.svg',
                          width: 30.w,
                          fit: BoxFit.fitWidth,
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
                              style: TeacherAppFonts
                                  .interW500_11sp_userdetailcolor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 12.w),
                  CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colorutils.Whitecolor,
                    child: CircleAvatar(
                      radius: 24.r,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100).r,
                        child: CachedNetworkImage(
                          imageUrl: controller.userData.value.image == null ||
                                  controller.userData.value.image == ""
                              ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                              : controller.userData.value.image ?? '',
                          errorWidget: (context, url, error) {
                            return const Icon(Icons.person, color: Colors.grey);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                ],
              ),
            );
          },
        ));
  }
}
