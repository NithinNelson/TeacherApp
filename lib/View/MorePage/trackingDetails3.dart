import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slider_button/slider_button.dart';
import 'package:timelines/timelines.dart';

import '../../Models/api_models/recent_date_model.dart';
import '../../Models/api_models/recentlist_model.dart';
import '../../Utils/Colors.dart';

class trackingDetails3 extends StatelessWidget {

  final ListItem progressCompletedList;
  const trackingDetails3({super.key, required this.progressCompletedList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Column(

          children: [
            Container(
              height: 60,
              child:  Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 18),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(

                          Icons.arrow_back_outlined,
                          size: 30,
                        ),
                      )),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Tracking",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 4),
              child: Container(
                // height: 70.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 12,top: 8,bottom: 8),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
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
                                  color: Colors.red.withOpacity(0.2),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 10.w),
                                  child: Text("Reached ""${progressCompletedList.visitStatus}",
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
                          width: 2,
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
                                  child: Text("Grade"" ""${progressCompletedList.classs}"" ""${progressCompletedList.batch}",
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
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Text(
                      '${progressCompletedList.status?[0].visitStatus}',
                      style: TextStyle(
                          fontSize: 18.w, fontWeight: FontWeight.bold),
                      maxLines: 3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      elevation: 0.7,
                      child: Container(
                        child: SvgPicture.asset("assets/images/Frame 849.svg"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey.withOpacity(0.2))
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey,
                  //     blurRadius: 0.4,
                  //     offset: Offset(0, 1),
                  //   ),
                  // ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 60, right: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(DateFormat("HH : mm").format(DateTime.parse(progressCompletedList.status?[0].addedOn  ?? '--').toLocal()),

                              style: TextStyle(color: Colors.grey,fontSize: 12)),
                          Text(DateFormat("HH : mm").format(DateTime.parse(progressCompletedList.status?[1].addedOn ?? '--').toLocal()),
                              style: TextStyle(color: Colors.grey,fontSize: 12)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50.0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 18.0,
                                  decoration: BoxDecoration(
                                    color: Colorutils.userdetailcolor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                const Positioned(
                                  left: 60,
                                  child: CircleAvatar(
                                    radius: 16.1,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 16.0,
                                      backgroundColor: Colorutils.userdetailcolor,
                                      child: CircleAvatar(
                                        radius: 14.0,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 11.0,
                                          backgroundColor: Colors.green,
                                          child: Icon(Icons.check,
                                              size: 16.0, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  right: 60,
                                  child: CircleAvatar(
                                    radius: 16.1,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 16.0,
                                      backgroundColor: Colorutils.userdetailcolor,
                                      child: CircleAvatar(
                                        radius: 14.0,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 11.0,
                                          backgroundColor: Colors.green,
                                          child: Icon(Icons.check,
                                              size: 16.0, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Text("Reached",
                                      style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${progressCompletedList.status?[0].visitStatus}",style: TextStyle(fontSize: 12),),
                          Text("${progressCompletedList.status?[1].visitStatus}",style: TextStyle(fontSize: 12),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Text(
                      "Sent ${progressCompletedList.status?[2].visitStatus}",
                      style: TextStyle(
                          fontSize: 18.w, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: SvgPicture.asset("assets/images/Notebook.svg"),
                      // child: SvgPicture.asset("assets/images/Frame 849.svg"),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey.withOpacity(0.2))
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey,
                  //     blurRadius: 0.4,
                  //     offset: Offset(0, 1),
                  //   ),
                  // ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 60, right: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(DateFormat("HH : mm").format(DateTime.parse(progressCompletedList.status?[2].addedOn  ?? '--').toLocal()),

                              style: TextStyle(color: Colors.grey,fontSize: 12)),
                          Text(DateFormat("HH : mm").format(DateTime.parse(progressCompletedList.status?[3].addedOn ?? '--').toLocal()),
                              style: TextStyle(color: Colors.grey,fontSize: 12)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50.0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 18.0,
                                  decoration: BoxDecoration(
                                    color: Colorutils.userdetailcolor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                const Positioned(
                                  left: 60,
                                  child: CircleAvatar(
                                    radius: 16.1,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 16.0,
                                      backgroundColor: Colorutils.userdetailcolor,
                                      child: CircleAvatar(
                                        radius: 14.0,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 11.0,
                                          backgroundColor: Colors.green,
                                          child: Icon(Icons.check,
                                              size: 16.0, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  right: 60,
                                  child: CircleAvatar(
                                    radius: 16.1,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 16.0,
                                      backgroundColor: Colorutils.userdetailcolor,
                                      child: CircleAvatar(
                                        radius: 14.0,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 11.0,
                                          backgroundColor: Colors.green,
                                          child: Icon(Icons.check,
                                              size: 16.0, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Text("Reached",
                                      style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sent ${progressCompletedList.status?[2].visitStatus}",style: TextStyle(fontSize: 12),),
                          Text("${progressCompletedList.status?[3].visitStatus}",style: TextStyle(fontSize: 12),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}










String Converteddate (String Date ){
  List<String> parts = Date.split('-');
  if (parts.length == 3) {
    return '${parts[2]}-${parts[1]}-${parts[0]}';
  }
  return Date;
}

String Reachedstatus (String status ){
  List<String> parts = status.split(' ');
  if (parts.length == 3) {
    return parts[2];
  }
  return status;
}