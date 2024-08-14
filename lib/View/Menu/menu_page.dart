import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/timeTableController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Controller/ui_controllers/page_controller.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../Models/api_models/time_table_api_model.dart';
import '../My_Class/Myclass.dart';
import '../OldScreens/teaching_students.dart';

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
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF118376),
                Color(0xFF067B6D),
                Color(0xFF138376),
              ],
            ),
          ),
          child: Stack(
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
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  'assets/images/pencil3.svg',
                  color: Colorutils.Whitecolor.withOpacity(0.06),
                  width: 130.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                bottom: 25.h,
                left: 20.h,
                child: Container(
                  color: Colors.transparent,
                  alignment: Alignment.centerLeft,
                  width: 190.w,
                  // height: 50.h,
                  child: CachedNetworkImage(
                      imageUrl:
                      'https://alpha.docme.cloud/schooldiary-logo/${Get.find<UserAuthController>().userData.value.schoolId?? '--'}.png',
                      placeholder: (context, url) => const SizedBox(),
                      errorWidget: (context, url, error) => const SizedBox()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, top: 50).h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 35.w,
                          // backgroundImage:
                          //     AssetImage('assets/images/profile2.png'),
                          child: CachedNetworkImage(
                              imageUrl: Get.find<UserAuthController>().userData.value.image ?? '--',
                              placeholder: (context, url) => Icon(Icons.person, color: Colors.grey, size: 40,),
                              errorWidget: (context, url, error) => Icon(Icons.person, color: Colors.grey, size: 40,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: GetX<TimeTableController>(
                            builder: (TimeTableController controller) {
                              List<TimeTable> todaySubjects = controller.teacherTimeTableToday.value;
                              return SizedBox(width: 120,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      for (int i=0;i<todaySubjects.length;i++ )

                                        Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: ClassIndicator(
                                              className:"${todaySubjects[i].batchName}" , isActive: true),
                                        ),



                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.w),
                    GetX<UserAuthController>(
                      builder: (UserAuthController controller) {
                        return SizedBox(
                          width: 180.w,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: TextScroll(
                                  controller.userData.value.name ?? '--',
                                  velocity:
                                      Velocity(pixelsPerSecond: Offset(50, 0)),
                                  delayBefore: Duration(seconds: 1),
                                  pauseBetween: Duration(seconds: 2),
                                  style:
                                      TeacherAppFonts.interW600_18sp_textWhite,
                                  textAlign: TextAlign.center,
                                  selectable: true,
                                ),
                              ),
                              Container(
                                child: TextScroll(
                                  controller.userData.value.username ?? '--',
                                  mode: TextScrollMode.bouncing,
                                  velocity:
                                      Velocity(pixelsPerSecond: Offset(50, 0)),
                                  delayBefore: Duration(seconds: 1),
                                  pauseBetween: Duration(seconds: 2),
                                  style: TeacherAppFonts
                                      .interW400_14sp_textWhiteOp60,
                                  textAlign: TextAlign.center,
                                  selectable: true,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.w),
                    for (int i = pageIndexController.navLength.value;
                        i < pageIndexController.menuItemsPerRole.length;
                        i++)
                      InkWell(
                        onTap: () {
                          pageIndexController.changePage(
                              currentPage: pageIndexController
                                  .menuItemsPerRole[i].index);
                          ZoomDrawer.of(context)?.toggle();
                        },
                        child: MenuItem(
                          icon: pageIndexController.menuItemsPerRole[i].svg,
                          title: pageIndexController.menuItemsPerRole[i].title,
                        ),
                      ),
                    // InkWell(
                    //   onTap: () {
                    //     ZoomDrawer.of(context)?.toggle();
                    //     pageIndexController.changePage(currentPage: 6);
                    //   },
                    //   child: const MenuItem(icon: "assets/images/classes.svg", title: 'Classes'),
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     ZoomDrawer.of(context)?.toggle();
                    //     pageIndexController.changePage(currentPage: 7);
                    //   },
                    //   child: const MenuItem(icon: "assets/images/timetable.svg", title: 'Timetable'),
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     ZoomDrawer.of(context)?.toggle();
                    //     pageIndexController.changePage(currentPage: 1);
                    //   },
                    //   child: const MenuItem(icon: "assets/images/clock-three 1.svg", title: 'Leave'),
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     ZoomDrawer.of(context)?.toggle();
                    //     pageIndexController.changePage(currentPage: 3);
                    //   },
                    //   child: const MenuItem(icon: "assets/images/chart-pie-alt.svg", title: 'OBS Result'),
                    // ),
                    Divider(
                      color: Colorutils.Whitecolor.withOpacity(0.15),
                      endIndent: 225.w,
                      height: 20.w,
                    ),
                    InkWell(
                      onTap: () {
                        TeacherAppPopUps.logOutPopUp(context: context);
                      },
                      child: const MenuItem(
                          icon: "assets/images/logout.svg", title: 'Logout'),
                    ),
                    SizedBox(height: 20.w),
                    InkWell(
                      onTap: () {
                        ZoomDrawer.of(context)?.toggle();
                        pageIndexController.changePage(currentPage: 2);
                      },
                      child: Container(
                        width: 180.w,
                        height: 45.w,
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
                                width: 30.w,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(width: 10.w),
                              SizedBox(
                                width: 110.w,
                                height: 40.w,
                                child: FittedBox(
                                  child: Text(
                                    'Chat with Parents',
                                    style:
                                        TeacherAppFonts.interW600_14sp_letters1,
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
          style: TeacherAppFonts.interW500_20sp_textWhiteOp60,
        ),
      ),
    );
  }
}

class ClassIndicator extends StatelessWidget {
  final String className;
  final bool isActive;

  const ClassIndicator(
      {super.key, required this.className, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentListView()));
      },
      child: CircleAvatar(
        radius: 24,
        backgroundColor: isActive ? Colorutils.Whitecolor : Colorutils.Whitecolor,
        child: Center(
          child: Text(
            className.replaceAll(" ", ''),
            style: const TextStyle(
              color: Colorutils.userdetailcolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
