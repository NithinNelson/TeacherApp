
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacherapp/View/Leave_Page/Approve_Rejected.dart';

import '../../Utils/Colors.dart';
import '../../Utils/constants.dart';
import '../../Utils/font_util.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';
import 'All_leave.dart';
import 'Approved_leave.dart';

class LeaveApply extends StatefulWidget {
  const LeaveApply({super.key});

  @override
  State<LeaveApply> createState() => _LeaveApplyState();
}

class _LeaveApplyState extends State<LeaveApply> with SingleTickerProviderStateMixin  {
  late TabController _tabController1;

  get questionData => null;

  get isSpinner => null;
  get isChecked => null;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController1 = TabController(length: 3, vsync: this);
    _tabController1.addListener(() {
      setState(() {
        _selectedIndex = _tabController1.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController1.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleLight,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height * 0.98,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                AppBarBackground(),
                Positioned(
                  left: 0,
                  top: -10,
                  child: Container(
                    // height: 100.w,
                    width: ScreenUtil().screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    child: const UserDetails(
                        shoBackgroundColor: false, isWelcome: true),
                  ),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   height: 180.w,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //           bottomLeft: Radius.circular(12.w),
                //           bottomRight: Radius.circular(12.w)),
                //       color: Colorutils.userdetailcolor,
                //     ),
                //   ),
                // ),
                // Positioned(
                //   left: 0,
                //   top: 40,
                //   child: SvgPicture.asset(
                //     'assets/images/pencil2.svg',
                //     width: 100.w,
                //     color: Colorutils.Whitecolor.withOpacity(0.1),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                // Positioned(
                //   left: 240,
                //   top: 25,
                //   child: Transform.rotate(
                //     angle: 0.5,
                //     child: SvgPicture.asset(
                //       'assets/images/stars1.svg',
                //       width: 20.w,
                //       color: Colorutils.Whitecolor.withOpacity(0.5),
                //       fit: BoxFit.fitWidth,
                //     ),
                //   ),
                // ),
                // Positioned(
                //   left: 220,
                //   top: 65,
                //   child: SvgPicture.asset(
                //     'assets/images/graduation-cap-icon.svg',
                //     width: 30.w,
                //     color: Colorutils.Whitecolor.withOpacity(0.07),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                // Positioned(
                //   left: 140,
                //   top: 10,
                //   child: SvgPicture.asset(
                //     'assets/images/read-book-icon.svg',
                //     width: 30.w,
                //     color: Colorutils.Whitecolor.withOpacity(0.07),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                // Positioned(
                //   left: 115,
                //   top: 65,
                //   child: SvgPicture.asset(
                //     'assets/images/stars1.svg',
                //     width: 20.w,
                //     color: Colorutils.Whitecolor.withOpacity(0.5),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                // Positioned(
                //   left: 5,
                //   top: 10,
                //   child: SvgPicture.asset(
                //     'assets/images/stars1.svg',
                //     width: 20.w,
                //     color: Colorutils.Whitecolor.withOpacity(0.5),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                // Positioned(
                //   right: 10,
                //   top: 140,
                //   child: SvgPicture.asset(
                //     'assets/images/stars1.svg',
                //     color: Colorutils.Whitecolor.withOpacity(0.9),
                //     width: 25.w,
                //     fit: BoxFit.fitHeight,
                //   ),
                // ),
                // Positioned(
                //   right: 0,
                //   top: -90,
                //   child: SvgPicture.asset(
                //     'assets/images/pencil3.svg',
                //     color: Colorutils.Whitecolor.withOpacity(0.2),
                //     height: 180.w,
                //     fit: BoxFit.fitHeight,
                //   ),
                // ),
                // Positioned(
                //   left: 0,
                //   top: 0,
                //   child: Padding(
                //       padding: const EdgeInsets.only(
                //           left: 7, right: 10, bottom: 3),
                //       child: Container(
                //         height: 80.w,
                //         width: 330,
                //         decoration: BoxDecoration(
                //           color: Colors.transparent,
                //           borderRadius: BorderRadius.circular(17.0),
                //         ),
                //         child: Row(
                //           children: [
                //             SizedBox(width: 12.w),
                //             Container(
                //               height: 45.w,
                //               width: 45.w,
                //               padding:
                //               const EdgeInsets.symmetric(horizontal: 9)
                //                   .w,
                //               child: Icon(
                //                 Icons.arrow_back_ios,
                //                 color: Colors.white,
                //               ),
                //             ),
                //             SizedBox(width: 12.w),
                //             Expanded(
                //               child: Column(
                //                 mainAxisSize: MainAxisSize.min,
                //                 crossAxisAlignment:
                //                 CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Hello!',
                //                     style: TeacherAppFonts
                //                         .interW400_14sp_textWhiteOp60,
                //                   ),
                //                   SingleChildScrollView(
                //                     scrollDirection: Axis.horizontal,
                //                     child: Row(
                //                       children: [
                //                         Text(
                //                           'Fathima Nourin',
                //                           style: TeacherAppFonts
                //                               .interW600_18sp_textWhite,
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             SizedBox(width: 12.w),
                //             Stack(
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       right: 5, top: 5)
                //                       .w,
                //                   child: SvgPicture.asset(
                //                     'assets/images/bell 1.svg',
                //                     width: 30.w,
                //                     fit: BoxFit.fitWidth,
                //                   ),
                //                 ),
                //                 Positioned(
                //                   top: 0,
                //                   right: 0,
                //                   child: Container(
                //                     width: 18.w,
                //                     height: 18.w,
                //                     padding: const EdgeInsets.all(2).w,
                //                     decoration: const BoxDecoration(
                //                       shape: BoxShape.circle,
                //                       color: Colorutils.Whitecolor,
                //                     ),
                //                     child: FittedBox(
                //                       child: Text(
                //                         "4",
                //                         style: TeacherAppFonts
                //                             .interW500_11sp_userdetailcolor,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             SizedBox(width: 12.w),
                //             CircleAvatar(
                //               radius: 25.r,
                //               backgroundColor: Colorutils.Whitecolor,
                //               child: CircleAvatar(
                //                 radius: 24.r,
                //                 backgroundImage: AssetImage(
                //                     'assets/images/profile image.png'),
                //               ),
                //             ),
                //             SizedBox(width: 12.w),
                //           ],
                //         ),
                //       )),
                // ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, top: 120.h, right: 10.w),
                  width: 500.w,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r) ),
                    boxShadow: [
                      BoxShadow(
                        color: Colorutils.userdetailcolor.withOpacity(0.3),
                        // Shadow color
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        TabBar(padding: EdgeInsets.zero,
                          indicator: BoxDecoration(),dividerHeight: 0,
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,indicatorPadding: EdgeInsets.zero,
                          // indicator: BoxDecoration(),
                          controller: _tabController1,
                          labelPadding: EdgeInsets.symmetric(horizontal: 5),
                          tabs: [
                            Tab(
                              child: Container(
                                height: 40.h,
                                width: (ScreenUtil().screenWidth-66)*2/6,
                                decoration: BoxDecoration(
                                  color: _selectedIndex == 0 ? Colors.red[500] : Colors.grey[500],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Approval',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                height: 40.h,
                                width: (ScreenUtil().screenWidth-66)*3/6,
                                decoration: BoxDecoration(
                                  color: _selectedIndex == 1 ? Colors.red[500] : Colors.grey[500],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Approved/Rejected",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                height: 40.h,
                                width: (ScreenUtil().screenWidth-66)*1/6,
                                decoration: BoxDecoration(
                                  color: _selectedIndex == 2 ? Colors.red[500] : Colors.grey[500],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "All",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),


                        SizedBox(
                          height: 10.h,
                        ),

                        Expanded(
                          child: TabBarView(
                            controller: _tabController1,
                            children: [
                              Container(
                                  color: Colors.white,
                                  child: SingleChildScrollView(
                                      child: ApprovedLeave())
                              ),

                              Container(
                                  color: Colors.white,
                                  child: SingleChildScrollView(
                                      child: ApproveRejected())
                              ),
                              Container(
                                  color: Colors.white,
                                  child: SingleChildScrollView(
                                      child: allleave())
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          )),
    );
  }

}

class _selectedIndex {
}



