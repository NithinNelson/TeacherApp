import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:teacherapp/View/Home_Page/Home_Widgets/bottom_navigationbar.dart';

import '../../Utils/Colors.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class Viewall extends StatefulWidget {
  const Viewall({super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {
  // CalendarFormat _calendarFormat = CalendarFormat.week;
  // DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
            EasyDateTimeLine(

              initialDate:  DateTime(1900, 1, 1),


              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
              },
              activeColor: Colorutils.userdetailcolor,
              headerProps: const EasyHeaderProps(


                showSelectedDate: false,
       monthStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),
                monthPickerType: MonthPickerType.switcher,
                centerHeader: true,
                dateFormatter: DateFormatter.fullDateDMY(),
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
                dayStructure: DayStructure.dayStrDayNum,


              ),
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
                    itemCount: 10,
                    itemBuilder: (context, index) => listcontainer()))
          ],
        ),
      ),
    );
  }
}

class listcontainer extends StatelessWidget {
  const listcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 4),
      child: Container(
        // height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5,top: 8,bottom: 8,right: 5),
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
                        child: Text("Brinesh Elmore martin",
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
                          child: Text("Sent to Clinic ",
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "10-December-2024",
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
                        child: Text("Grade 2-B",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
