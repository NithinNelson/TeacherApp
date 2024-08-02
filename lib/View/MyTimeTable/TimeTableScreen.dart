import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:teacherapp/View/MyTimeTable/Friday.dart';
import 'package:teacherapp/View/MyTimeTable/Saturday.dart';
import 'package:teacherapp/View/MyTimeTable/Thursday.dart';
import 'package:teacherapp/View/MyTimeTable/Tuesday.dart';
import 'package:teacherapp/View/MyTimeTable/Wednesday.dart';

import '../../Utils/Colors.dart';
import '../../Utils/constants.dart';
import '../../Utils/font_util.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';
import 'monday.dart';

class MyTimeTable extends StatefulWidget {
  const MyTimeTable({super.key});

  @override
  State<MyTimeTable> createState() => _MyTimeTableState();


}

class _MyTimeTableState extends State<MyTimeTable> with SingleTickerProviderStateMixin {

  late TabController tabController;
  int _currentIndex = 0;
  bool isCalenderSelectedOnMonday = false;
  bool isCalenderSelectedOnTuesday = false;
  bool isCalenderSelectedOnWednesday = false;
  bool isCalenderSelectedOnThursday = false;
  bool isCalenderSelectedOnFriday = false;
  bool isCalenderSelectedOnSaturday = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {
          _currentIndex = tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CardItem> items = [
      IconTitleCardItem(
          text: "MON",
          selectedBgColor: Colorutils.userdetailcolor,
          noSelectedBgColor: Colorutils.chatcolor,
          noSelectedIconTextColor: Colors.black

      ),
      IconTitleCardItem(
          text: "TUE",
          selectedBgColor: Colorutils.userdetailcolor,
          noSelectedBgColor: Colorutils.chatcolor,
          noSelectedIconTextColor: Colors.black

      ),
      IconTitleCardItem(
          text: "WED",
          selectedBgColor: Colorutils.userdetailcolor,
          noSelectedBgColor: Colorutils.chatcolor,
          noSelectedIconTextColor: Colors.black

      ),
      IconTitleCardItem(
          text: "THU",
          selectedBgColor: Colorutils.userdetailcolor,
          noSelectedBgColor: Colorutils.chatcolor,
          noSelectedIconTextColor: Colors.black
      ),
      IconTitleCardItem(
          text: "FRI",
          selectedBgColor: Colorutils.userdetailcolor,
          noSelectedBgColor: Colorutils.chatcolor,
          noSelectedIconTextColor: Colors.black

      ),
      IconTitleCardItem(
          text: "SAT",
          selectedBgColor: Colorutils.userdetailcolor,
          noSelectedBgColor: Colorutils.chatcolor,
          noSelectedIconTextColor: Colors.black

      ),
    ];
    final List<Widget> tabViews = [
      monday(),
      Tuesday(),
      Wednesday(),
      Thursday(),
      Friday(),
      Saturday()

    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleLight,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
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
                  child: const UserDetails(shoBackgroundColor: false, isWelcome: false),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 10.w, top: 120.h, right: 10.w
                ),
                // width: 550.w,
                // height: 600.h,
                decoration: BoxDecoration(
                  color: Colorutils.Whitecolor,
                  // Container color
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r)),
                  // Border radius
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
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 15),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "My Timetable",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Container(
                                  height: 40.w,
                                  width: 120.w,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5)
                                      .w,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                    BorderRadius.circular(12.0).r,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: SingleChildScrollView(
                                          scrollDirection:
                                          Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Text('Maths',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                        height: 35.w,
                                        width: 35.w,
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                          BorderRadius.circular(12.0)
                                              .r,
                                        ),
                                        child: Center(
                                          child: Text("7J",
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            // SizedBox(
                            //   height: 100.0,
                            //   child: Center(
                            //       child: Center(
                            //           child: HorizontalCardPager(
                            //             initialPage: _currentIndex,
                            //             onPageChanged: (page) {
                            //
                            //               setState(() {  _currentIndex = page.toInt();
                            //               tabController.index = page.toInt();
                            //               });
                            //
                            //               DefaultTabController.of(context)?.animateTo(page as int);
                            //             },
                            //             onSelectedItem: (page) {
                            //
                            //               setState(() {  _currentIndex = page.toInt();
                            //               tabController.index = page.toInt();
                            //               });
                            //
                            //               DefaultTabController.of(context)?.animateTo(page as int);
                            //             },
                            //             items: items,
                            //           ))
                            //
                            //   ),
                            //
                            // ),
                            Container(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12,right: 12,top: 8),
                                  child: Row(
                                    children: [

                                      SizedBox(
                                        width: 60.w,
                                        height: 70.h,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                              ), backgroundColor: isCalenderSelectedOnMonday == false
                                                  ? Colors.blue
                                                  : Colors.white,

                                              side: BorderSide(
                                                width: 1.w,
                                                color: isCalenderSelectedOnMonday == false
                                                    ? Colors.black
                                                    : Colors.blue,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {

                                              });
                                            },child: Row(
                                              children: [
                                                Text('MON'),
                                              ],
                                            ),
                                            // child: Text(
                                            //   "Mon",
                                            //   style: TextStyle(
                                            //       color: isCalenderSelectedOnMonday == false
                                            //           ? Colors.black
                                            //           : Colors.white,
                                            //       fontSize: 11.sp),
                                            // )
                                           ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      SizedBox(
                                        width: 60.w,
                                        height: 70.h,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                              ), backgroundColor: isCalenderSelectedOnTuesday == false
                                                  ? Colors.white
                                                  : Colors.blue,
                                              elevation: isCalenderSelectedOnTuesday == false ? 0 : 8,
                                              side: BorderSide(
                                                width: 1.w,
                                                color: isCalenderSelectedOnTuesday == false
                                                    ? Colors.black
                                                    : Colors.blue,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {

                                              });
                                            },
                                            child: Text(
                                              "Tue",
                                              style: TextStyle(
                                                  color: isCalenderSelectedOnTuesday == false
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 11.sp),
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      SizedBox(
                                        width: 60.w,
                                        height: 70.h,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                              ), backgroundColor: isCalenderSelectedOnWednesday == false
                                                  ? Colors.white
                                                  : Colors.black,
                                              elevation:
                                              isCalenderSelectedOnWednesday == false ? 0 : 8,
                                              side: BorderSide(
                                                width: 1.w,
                                                color: isCalenderSelectedOnWednesday == false
                                                    ? Colors.black
                                                    :Colors.blue,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {

                                              });
                                            },
                                            child: Text(
                                              "Wed",
                                              style: TextStyle(
                                                  color: isCalenderSelectedOnWednesday == false
                                                      ? Colors.black
                                                      : Colors.blue,
                                                  fontSize: 11.sp),
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      SizedBox(
                                        width: 60.w,
                                        height: 70.h,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                              ), backgroundColor: isCalenderSelectedOnThursday == false
                                                  ? Colors.white
                                                  : Colors.blue,
                                              elevation:
                                              isCalenderSelectedOnThursday == false ? 0 : 8,
                                              side: BorderSide(
                                                width: 1.w,
                                                color: isCalenderSelectedOnThursday == false
                                                    ? Colors.black
                                                    :Colors.blue,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {

                                              });
                                            },
                                            child: Text(
                                              "Thu",
                                              style: TextStyle(
                                                  color: isCalenderSelectedOnThursday == false
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 11.sp),
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      SizedBox(
                                        width: 60.w,
                                        height: 70.h,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                              ), backgroundColor: isCalenderSelectedOnFriday == false
                                                  ? Colors.white
                                                  : Colors.black,
                                              elevation: isCalenderSelectedOnFriday == false ? 0 : 8,
                                              side: BorderSide(
                                                width: 1.w,
                                                color: isCalenderSelectedOnFriday == false
                                                    ? Colors.black
                                                    : Colors.blue,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {

                                              });
                                            },
                                            child: Text(
                                              "Fri",
                                              style: TextStyle(
                                                  color: isCalenderSelectedOnFriday == false
                                                      ? Colors.blue
                                                      : Colors.white,
                                                  fontSize: 11.sp),
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      SizedBox(
                                        width: 60.w,
                                        height: 70.h,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                              ), backgroundColor: isCalenderSelectedOnSaturday == false
                                                  ? Colors.white
                                                  : Colors.black,
                                              elevation:
                                              isCalenderSelectedOnSaturday == false ? 0 : 8,
                                              side: BorderSide(
                                                width: 1.w,
                                                color: isCalenderSelectedOnSaturday == false
                                                    ? Colors.black
                                                    : Colors.blue,
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {

                                              });
                                            },
                                            child: Text(
                                              "Sat",
                                              style: TextStyle(
                                                  color: isCalenderSelectedOnSaturday == false
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 11.sp),
                                            )),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // height: ScreenUtil().screenHeight-40.w-100-85.h-103,
                              child: Expanded(
                                child: TabBarView(

                                  physics:NeverScrollableScrollPhysics() ,
                                  controller: tabController,
                                  children: tabViews,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],),
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
