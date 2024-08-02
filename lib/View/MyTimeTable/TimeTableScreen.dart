import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:intl/intl.dart';
import 'package:teacherapp/Controller/api_controllers/timeTableController.dart';
import 'package:teacherapp/Models/api_models/time_table_api_model.dart';
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

class _MyTimeTableState extends State<MyTimeTable>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int _currentIndex = 0;
  bool isCalenderSelectedOnMonday = false;
  bool isCalenderSelectedOnTuesday = false;
  bool isCalenderSelectedOnWednesday = false;
  bool isCalenderSelectedOnThursday = false;
  bool isCalenderSelectedOnFriday = false;
  bool isCalenderSelectedOnSaturday = false;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
    _pageController = PageController();
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
          noSelectedIconTextColor: Colors.black),
      IconTitleCardItem(
          text: "TUE",
          selectedBgColor: Colorutils.userdetailcolor,
          noSelectedBgColor: Colorutils.chatcolor,
          noSelectedIconTextColor: Colors.black),
      IconTitleCardItem(
          text: "WED",
          selectedBgColor: Colorutils.userdetailcolor,
          noSelectedBgColor: Colorutils.chatcolor,
          noSelectedIconTextColor: Colors.black),
      IconTitleCardItem(
          text: "THU",
          selectedBgColor: Colorutils.userdetailcolor,
          noSelectedBgColor: Colorutils.chatcolor,
          noSelectedIconTextColor: Colors.black),
      IconTitleCardItem(
          text: "FRI",
          selectedBgColor: Colorutils.userdetailcolor,
          noSelectedBgColor: Colorutils.chatcolor,
          noSelectedIconTextColor: Colors.black),
      IconTitleCardItem(
          text: "SAT",
          selectedBgColor: Colorutils.userdetailcolor,
          noSelectedBgColor: Colorutils.chatcolor,
          noSelectedIconTextColor: Colors.black),
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
                  child: const UserDetails(
                    shoBackgroundColor: false,
                    isWelcome: false,
                    bellicon: true,
                    notificationcount: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w, top: 120.h, right: 10.w),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  height: 45.w,
                                  width: 140.w,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5)
                                          .w,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12.0).r,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 35.w,
                                        width: 35.w,
                                        decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(12.0).r,
                                        ),
                                        child: Center(
                                          child: Text("7J",
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                      SizedBox(width: 3.w),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 3, left: 3),
                                                child: Text('Maths ',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15)),
                                              ),
                                            ],
                                          ),
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
                        child: GetX<TimeTableController>(
                          builder: (TimeTableController controller) {
                            List<ResultArray> timeTableList =
                                controller.teacherTimeTable.value;
                            return Column(
                              children: [
                                Container(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 10,
                                          bottom: 3),
                                      child: Row(
                                        children: [
                                          for (int i = 0;
                                              i < timeTableList.length;
                                              i++)
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                GestureDetector(
                                                  child: Container(
                                                    width: 75.w,
                                                    height: 75.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: isCalenderSelectedOnMonday ==
                                                              false
                                                          ? Colorutils
                                                              .Whitecolor
                                                          : Colorutils
                                                              .bottomnaviconcolor,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.3),
                                                          // Shadow color
                                                          spreadRadius: 1,
                                                          blurRadius: 2,
                                                          offset: Offset(0,
                                                              1), // Shadow position
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "${timeTableList[i].dayName?.substring(0, 3).toUpperCase()}",
                                                        style: TextStyle(
                                                            color: isCalenderSelectedOnMonday ==
                                                                    false
                                                                ? Colors.black
                                                                : Colorutils
                                                                    .Whitecolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      controller
                                                          .setSelectedTimetable(
                                                              result:
                                                                  timeTableList[
                                                                          i]
                                                                      .timeTable);
                                                      //
                                                      // isCalenderSelectedOnTuesday = false;
                                                      // isCalenderSelectedOnWednesday =
                                                      // false;
                                                      // isCalenderSelectedOnThursday =
                                                      // false;
                                                      // isCalenderSelectedOnFriday = false;
                                                      // isCalenderSelectedOnSaturday =
                                                      // false;
                                                      // if (isCalenderSelectedOnMonday ==
                                                      //     false) {
                                                      //   isCalenderSelectedOnMonday = true;
                                                      //   tabController.index = 0;
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // height: ScreenUtil().screenHeight-40.w-100-85.h-103,
                                  child: Expanded(
                                    child: ListView.builder(
                                      itemCount:
                                          controller.selectedTimetable.length,
                                      itemBuilder: (context, index) {
                                        List<TimeTable> data =
                                            controller.selectedTimetable.value;
                                        List<Color> colors = [
                                          Colorutils.userdetailcolor
                                              .withOpacity(0.9),
                                          Colorutils.Classcolour1.withOpacity(
                                              0.9),
                                          Colorutils.Classcolour3.withOpacity(
                                              0.9),
                                          Colorutils.svguicolour2
                                              .withOpacity(0.9),
                                        ];
                                        Color color =
                                            colors[index % colors.length];
                                        List<Color> colors1 = [
                                          Colorutils.userdetailcolor
                                              .withOpacity(0.8),
                                          Colorutils.Classcolour1.withOpacity(
                                              0.6),
                                          Colorutils.Classcolour3.withOpacity(
                                              0.8),
                                          Colorutils.svguicolour2
                                              .withOpacity(0.8),
                                        ];
                                        Color color1 =
                                            colors1[index % colors.length];

                                        return ListTile(
                                            title: Container(
                                                height: 60,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        height: 50,
                                                        width: 150,
                                                        child: Container(
                                                          height: 40.w,
                                                          width: 120.w,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          5)
                                                                  .w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: color,
                                                            borderRadius:
                                                                BorderRadius
                                                                        .circular(
                                                                            12.0)
                                                                    .r,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 16,
                                                                backgroundColor:
                                                                    color1,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          3),
                                                                  child: Text(
                                                                      data[index]
                                                                              .batchName ??
                                                                          '--',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              12)),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 5.w),
                                                              Expanded(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          'Maths',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 15)),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                    Container(
                                                      height: 50,
                                                      width: 150,
                                                      child: Center(
                                                        child: Text(
                                                            " ${DateFormat('HH:mm a').format(DateTime.parse(data[index].startTime.toString()).toLocal())} -"
                                                            "${DateFormat('HH:mm a').format(DateTime.parse(data[index].startTime.toString()).toLocal())}",
                                                            style: TextStyle(
                                                                color: color,
                                                                fontSize: 12)),
                                                      ),
                                                    ),
                                                  ],
                                                )));
                                      },
                                    ),
                                    // child: TabBarView(
                                    //
                                    //
                                    //   physics: NeverScrollableScrollPhysics(),
                                    //   controller: tabController,
                                    //   children:       monday(),
                                    //
                                    // ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
