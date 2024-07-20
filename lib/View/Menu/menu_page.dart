
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/ui_controllers/page_controller.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageIndexController pageIndexController = Get.find<PageIndexController>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness: Brightness.light, // light icons
        statusBarBrightness: Brightness.light, // iOS
      ),
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: SvgPicture.asset(
                'assets/images/pencil1.svg',
                width: 400.w,
                color: Colorutils.Whitecolor,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: SvgPicture.asset(
                'assets/images/pencil2.svg',
                width: 170.w,
                color: Colorutils.Whitecolor.withOpacity(0.06),
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              right:0,
              bottom: 0,
              child: SvgPicture.asset(
                'assets/images/pencil3.svg',
                color: Colorutils.Whitecolor.withOpacity(0.06),
                width: 130.w,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, top: 45).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35.w,
                        backgroundImage: AssetImage('assets/images/profile2.png'),
                      ),
                      SizedBox(
                        width: 110.w,
                        child: Row(
                          children: [
                            const ClassIndicator(className: '4A', isActive: true),
                            SizedBox(width: 8.w),
                            const ClassIndicator(className: '4B', isActive: false),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.w),
                  Text(
                    'Fathima Nourin',
                    style: TeacherAppFonts.interW600_20sp_textWhite,
                  ),
                  Text(
                    'fathima@school.com',
                    style: TeacherAppFonts.interW400_14sp_textWhiteOp60,
                  ),

                  SizedBox(height: 20.w),
                  InkWell(
                    onTap: () {
                      ZoomDrawer.of(context)?.toggle();
                      pageIndexController.changePage(currentPage: 0);
                    },
                    child: const MenuItem(icon: "assets/images/house-bottom.svg", title: 'Home'),
                  ),
                  InkWell(
                    onTap: () {
                      ZoomDrawer.of(context)?.toggle();
                      pageIndexController.changePage(currentPage: 6);
                    },
                    child: const MenuItem(icon: "assets/images/classes.svg", title: 'Classes'),
                  ),
                  InkWell(
                    onTap: () {
                      ZoomDrawer.of(context)?.toggle();
                      pageIndexController.changePage(currentPage: 7);
                    },
                    child: const MenuItem(icon: "assets/images/timetable.svg", title: 'Timetable'),
                  ),
                  InkWell(
                    onTap: () {
                      ZoomDrawer.of(context)?.toggle();
                      pageIndexController.changePage(currentPage: 1);
                    },
                    child: const MenuItem(icon: "assets/images/clock-three 1.svg", title: 'Leave'),
                  ),
                  InkWell(
                    onTap: () {
                      ZoomDrawer.of(context)?.toggle();
                      pageIndexController.changePage(currentPage: 3);
                    },
                    child: const MenuItem(icon: "assets/images/chart-pie-alt.svg", title: 'OBS Result'),
                  ),
                  Divider(
                    color: Colorutils.Whitecolor.withOpacity(0.2),
                    endIndent: 180.w,
                    height: 20.w,
                  ),
                  const MenuItem(icon:"assets/images/logout.svg", title: 'Logout'),
                  SizedBox(height: 10.w),
                  InkWell(
                    onTap: () {
                      ZoomDrawer.of(context)?.toggle();
                      pageIndexController.changePage(currentPage: 2);
                    },
                    child: Container(
                      width: 160.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/newchat.png',
                              width: 22.w,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(width: 5.w),
                            SizedBox(
                              width: 110.w,
                              height: 40.w,
                              child: FittedBox(
                                child: Text(
                                  'Chat with Parents',
                                  style: TeacherAppFonts.interW600_14sp_letters1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              // ElevatedButton.icon(
              //   onPressed: () {},
              //   icon: Image.asset(
              //     'assets/images/newchat.png',
              //     width: 25.w,
              //     fit: BoxFit.fitWidth,
              //   ),
              //   label: Text(
              //       'Chat with Parents',
              //     style: TeacherAppFonts.interW600_14sp_letters1,
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     foregroundColor: Colors.teal,
              //     backgroundColor: Colors.white,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12), // set your desired border radius
              //     ),
              //   ),
              // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String icon;
  final String title;

  const MenuItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      dense: true,
      contentPadding: const EdgeInsets.all(0),
      minVerticalPadding: 0,
      horizontalTitleGap: 10.w,
      child: ListTile(
          leading: SvgPicture.asset(
            icon,
            width: 26.w,
            fit: BoxFit.fitWidth,
            color: Colorutils.Whitecolor.withOpacity(0.6),
            cacheColorFilter: true,
          ),
          title: Text(
            title,
            style: TeacherAppFonts.interW500_16sp_textWhiteOp60,

          ),
        ),
    );
  }
}

class ClassIndicator extends StatelessWidget {
  final String className;
  final bool isActive;

  const ClassIndicator({super.key, required this.className, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isActive ? Colorutils.Whitecolor: Colorutils.Whitecolor,

      child: Center(
        child: Text(
          className,
          style: const TextStyle(
            color: Colorutils.userdetailcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
