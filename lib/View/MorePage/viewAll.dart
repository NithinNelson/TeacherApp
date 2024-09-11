
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:teacherapp/View/MorePage/trackingDetails3.dart';
import '../../Controller/api_controllers/recentDateListApiController.dart';
import '../../Models/api_models/recent_date_model.dart';
import '../../Utils/Colors.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class Viewall extends StatefulWidget {
  const Viewall({super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {
  DateTime initDate = DateTime.now();
  String? currentMonth;

  @override
  void initState() {
    Get.find<RecentDateListApiController>().fetchRecentDateList();
    setState(() {
      currentMonth = DateFormat('MMMM yyyy').format(initDate);
    });
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Container(
          child: GetX<RecentDateListApiController>(
            builder: (RecentDateListApiController controller) {
              List<ListItem> ProgressCompletedList =
                  controller.progressCompletedData.value;

              return Column(
                children: [
                   SizedBox(
                    height: 35,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.arrow_back_outlined,
                                size: 30,
                              )),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          "All List",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left arrow button
                            InkWell(
                              onTap: () {
                                setState(() {
                                  initDate = subtractOneMonth(initDate);
                                  currentMonth = DateFormat('MMMM yyyy').format(initDate);
                                  print("---------initDate--------$initDate");
                                });
                              },
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 0.2),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          // Adjust shadow color and opacity
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(
                                              0, 1), // changes position of shadow
                                        ),
                                      ]),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 15,
                                  )),
                            ),

                            // Month text in the center
                            Text(
                              "$currentMonth".toUpperCase(),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Right arrow button

                            InkWell(
                              onTap: () {
                                setState(() {
                                  initDate = addOneMonth(initDate);
                                  currentMonth = DateFormat('MMMM yyyy').format(initDate);
                                  print("---------initDate--------$initDate");
                                });
                              },
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey, width: 0.2),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          // Adjust shadow color and opacity
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: const Offset(
                                              0, 1), // changes position of shadow
                                        ),
                                      ]),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      EasyDateTimeLine(
                        key: ValueKey(initDate),
                        initialDate: initDate,
                        onDateChange: (selectedDate) async {
                          //`selectedDate` the new date selected.
                          await Get.find<RecentDateListApiController>()
                              .fetchRecentDateList(date: selectedDate);
                        },
                        activeColor: Colorutils.userdetailcolor,
                        headerProps: const EasyHeaderProps(
                            showSelectedDate: false,
                            monthStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            showHeader: false),
                        dayProps: const EasyDayProps(
                          height: 60.0,
                          width: 60.0,
                          activeDayStyle: DayStyle(
                            dayNumStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          inactiveDayStyle: DayStyle(
                            borderRadius: 48.0,
                            dayNumStyle: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          dayStructure: DayStructure.dayNumDayStr,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child:  ProgressCompletedList.isNotEmpty?Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Text(
                            'Listing All Students',
                            style: TextStyle(
                                fontSize: 18.w, fontWeight: FontWeight.bold),
                          )                        ],
                      ),
                    ):Container(height:400,child: const Expanded(child: Center(child: Text("Oops! No Data Found",style: TextStyle(color: Colors.red,fontStyle: FontStyle.italic),)))),
                  ),
                  Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async =>
                        await Get.find<
                            RecentDateListApiController>().fetchRecentDateList(),
                        color: Colorutils.userdetailcolor,
                        backgroundColor: Colors.white,

                        child: ListView.builder(
                            itemCount: ProgressCompletedList.length,
                            itemBuilder: (context, index) => listcontainer(
                                  progressCompletedList:
                                      controller.progressCompletedData[index],
                                )),
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  DateTime subtractOneMonth(DateTime date) {
    int year = date.year;
    int month = date.month - 1;

    if (month == 0) {
      month = 12;
      year--;
    }

    return DateTime(year, month, date.day);
  }

  DateTime addOneMonth(DateTime date) {
    int year = date.year;
    int month = date.month + 1;

    if (month == 13) {
      month = 1;
      year++;
    }

    // Handle cases where the added month might not have the same day count (like February 30)
    int day = date.day;
    int daysInNewMonth = DateTime(year, month + 1, 0).day;
    if (day > daysInNewMonth) {
      day = daysInNewMonth;
    }

    return DateTime(year, month, day);
  }
}

class listcontainer extends StatelessWidget {
  final ListItem progressCompletedList;

  const listcontainer({super.key, required this.progressCompletedList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => trackingDetails3(
                        progressCompletedList: progressCompletedList,
                      )));
        },
        child: Container(
          // height: 70.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 5, top: 8, bottom: 8, right: 12),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colorutils.chatcolor.withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset("assets/images/profileOne.svg"),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200.w,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text("${progressCompletedList.studentName}",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                          // width: 130.w,
                          // height: 18.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: progressCompletedList.visitStatus == "Sent to Clinic"|| progressCompletedList.visitStatus == "Reached Clinic"
                                ? Colors.red.withOpacity(0.2)
                                : progressCompletedList.visitStatus == "Sent to Washroom"|| progressCompletedList.visitStatus == "Reached Washroom"
                                ? Colorutils.washroomcolor2
                                : progressCompletedList.visitStatus == "Sent to Counsellor"|| progressCompletedList.visitStatus == "Reached Counsellor"
                                ? Colorutils.councellorcolor2
                                : progressCompletedList.visitStatus == "Back to Class"|| progressCompletedList.visitStatus == "Reached Class"
                                ? Colors.green.withOpacity(0.3)
                                :  Colorutils.grey,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 10.w),
                            child: Text("${progressCompletedList.status?[0].visitStatus}",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                  fontSize: 13.sp,
                                      color: progressCompletedList.visitStatus == "Sent to Clinic"|| progressCompletedList.visitStatus == "Reached Clinic"
                                          ? Colors.red
                                          : progressCompletedList.visitStatus == "Sent to Washroom"|| progressCompletedList.visitStatus == "Reached Washroom"
                                          ? Colorutils.washroomcolor
                                          : progressCompletedList.visitStatus == "Sent to Counsellor"|| progressCompletedList.visitStatus == "Reached Counsellor"
                                          ? Colorutils.councellorcolor
                                          : progressCompletedList.visitStatus == "Back to Class"|| progressCompletedList.visitStatus == "Reached Class"
                                          ? Colorutils.userdetailcolor
                                          :  Colorutils.white,
                                ))),
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          Converteddate("${progressCompletedList.visitDate}"),
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                            child: Text(
                                "Grade"
                                " "
                                "${progressCompletedList.classs}"
                                " "
                                "${progressCompletedList.batch}",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String Converteddate(String Date) {
  List<String> parts = Date.split('-');
  if (parts.length == 3) {
    return '${parts[2]}-${parts[1]}-${parts[0]}';
  }
  return Date;
}
