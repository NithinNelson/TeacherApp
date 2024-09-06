import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:teacherapp/View/Home_Page/Home_Widgets/bottom_navigationbar.dart';
import 'package:teacherapp/View/MorePage/trackingDetails3.dart';
import 'package:teacherapp/View/MorePage/trackingdetails2.dart';

import '../../Controller/api_controllers/recentDateListApiController.dart';
import '../../Models/api_models/recent_date_model.dart';
import '../../Models/api_models/recentlist_model.dart';
import '../../Utils/Colors.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

import 'all_Students.dart';

class Viewall extends StatefulWidget {
  const Viewall({super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {

  @override
  void initState() {
    Get.find<RecentDateListApiController>().fetchRecentDateList();
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
              List<ListItem> ProgressCompletedList = controller
                  .progressCompletedData.value;

              return Column(
                children: [
                Container(
                height: 30,
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          size: 30,
                        )),
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      "All List",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
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
              padding: EdgeInsets.symmetric(horizontal: 8.0,),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              // Left arrow button
              Container(
                height: 20,width: 20,
                 color: Colors.red,
                child: Icon(Icons.arrow_back_ios,size: 15,)
              ),

              // Month text in the center
              Text(
              "AUGUST",
              style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              ),
              ),

              // Right arrow button
              Card(
                child: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                // Add functionality for going to the next month
                },
                ),
              ),
              ],
              ),
              ),
              EasyDateTimeLine(

              initialDate: DateTime.now(),

              onDateChange: (selectedDate) async {
              //`selectedDate` the new date selected.
              await Get.find<RecentDateListApiController>().fetchRecentDateList(date: selectedDate);
              },
              activeColor: Colorutils.userdetailcolor,
              headerProps: const EasyHeaderProps(


              showSelectedDate: false,
              monthStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),
              showHeader: false
              ),

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
              child: Container(
              height: 50,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
              'Listing All Students',
              style: TextStyle(
              fontSize: 18.w, fontWeight: FontWeight.bold),
              ),
              ],
              ),
              ),
              ),
              Expanded(
              child: ListView.builder(
              itemCount: ProgressCompletedList.length,
              itemBuilder: (context, index) => listcontainer(progressCompletedList: controller.progressCompletedData[index],)))
              ],
              );
            },

          ),
        ),
      ),
    );
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
                  builder: (context) =>
                      trackingDetails3(
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
                            color: Colors.red.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 10.w),
                            child: Text("${progressCompletedList.visitStatus}",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.red,
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