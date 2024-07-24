import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import '../../Utils/font_util.dart';
import 'monday.dart';

class MyTimeTable extends StatefulWidget {
  const MyTimeTable({super.key});

  @override
  State<MyTimeTable> createState() => _MyTimeTableState();


}

class _MyTimeTableState extends State<MyTimeTable> with SingleTickerProviderStateMixin {

  late TabController tabController;
  int _currentIndex = 0;

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
        selectedBgColor: Colors.blue,
        noSelectedBgColor: Colors.white,
        noSelectedIconTextColor: Colors.black

      ),
      IconTitleCardItem(
        text: "TUE",
        selectedBgColor: Colorutils.chatcolor,
        noSelectedBgColor: Colors.white,
        noSelectedIconTextColor: Colors.black

      ),
      IconTitleCardItem(
        text: "WED",
        selectedBgColor: Colorutils.chatcolor,
        noSelectedBgColor: Colors.white,
        noSelectedIconTextColor: Colors.black

      ),
      IconTitleCardItem(
        text: "THU",
        selectedBgColor: Colorutils.chatcolor,
        noSelectedBgColor: Colors.white,
        noSelectedIconTextColor: Colors.black
      ),
      IconTitleCardItem(
        text: "FRI",
        selectedBgColor: Colorutils.chatcolor,
        noSelectedBgColor: Colors.white,
        noSelectedIconTextColor: Colors.black

      ),
      IconTitleCardItem(
        text: "SAT",
        selectedBgColor: Colorutils.chatcolor,
        noSelectedBgColor: Colors.white,
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

    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 180.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.w),
                        bottomRight: Radius.circular(12.w)),
                    color: Colorutils.userdetailcolor,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 40,
                child: SvgPicture.asset(
                  'assets/images/pencil2.svg',
                  width: 100.w,
                  color: Colorutils.Whitecolor.withOpacity(0.1),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                left: 240,
                top: 25,
                child: Transform.rotate(
                  angle: 0.5,
                  child: SvgPicture.asset(
                    'assets/images/stars1.svg',
                    width: 20.w,
                    color: Colorutils.Whitecolor.withOpacity(0.5),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                left: 220,
                top: 65,
                child: SvgPicture.asset(
                  'assets/images/graduation-cap-icon.svg',
                  width: 30.w,
                  color: Colorutils.Whitecolor.withOpacity(0.07),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                left: 140,
                top: 10,
                child: SvgPicture.asset(
                  'assets/images/read-book-icon.svg',
                  width: 30.w,
                  color: Colorutils.Whitecolor.withOpacity(0.07),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                left: 115,
                top: 65,
                child: SvgPicture.asset(
                  'assets/images/stars1.svg',
                  width: 20.w,
                  color: Colorutils.Whitecolor.withOpacity(0.5),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                left: 5,
                top: 10,
                child: SvgPicture.asset(
                  'assets/images/stars1.svg',
                  width: 20.w,
                  color: Colorutils.Whitecolor.withOpacity(0.5),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                right: 10,
                top: 140,
                child: SvgPicture.asset(
                  'assets/images/stars1.svg',
                  color: Colorutils.Whitecolor.withOpacity(0.9),
                  width: 25.w,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                right: 0,
                top: -90,
                child: SvgPicture.asset(
                  'assets/images/pencil3.svg',
                  color: Colorutils.Whitecolor.withOpacity(0.2),
                  height: 180.w,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 7, right: 10, bottom: 3),
                    child: Container(
                      height: 80.w,
                      width: 330,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 12.w),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 45.w,
                              width: 45.w,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9).w,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
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
                                  'Hello!',
                                  style: TeacherAppFonts
                                      .interW400_14sp_textWhiteOp60,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Fathima Nourin',
                                        style: TeacherAppFonts
                                            .interW600_18sp_textWhite,
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
                                padding:
                                    const EdgeInsets.only(right: 5, top: 5).w,
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
                              backgroundImage:
                                  AssetImage('assets/images/profile image.png'),
                            ),
                          ),
                          SizedBox(width: 12.w),
                        ],
                      ),
                    )),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(
                      left: 10.w,
                      top: 85.h,
                      right: 10.w,
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
                                    SizedBox(
                                      height: 100.0,
                                      child: Center(
                                          child: Center(
                                              child: HorizontalCardPager(
                                                initialPage: _currentIndex,
                                                onPageChanged: (page) {

                                                  setState(() {  _currentIndex = page.toInt();
                                                    tabController.index = page.toInt();
                                                  });

                                                  DefaultTabController.of(context)?.animateTo(page as int);
                                                },
                                                onSelectedItem: (page) {

                                                  setState(() {  _currentIndex = page.toInt();
                                                  tabController.index = page.toInt();
                                                  });

                                                  DefaultTabController.of(context)?.animateTo(page as int);
                                                },
                                        items: items,
                                      ))

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
