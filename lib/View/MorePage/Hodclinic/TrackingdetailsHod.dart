import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slider_button/slider_button.dart';
import 'package:teacherapp/Models/api_models/HosStudentListModel.dart';

import '../../../Utils/Colors.dart';
import '../trackingPage.dart';

class Trackingdetailshod extends StatelessWidget {
  final SendData sendStudentList;

  const Trackingdetailshod({super.key, required this.sendStudentList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 18),
                      child: GestureDetector(
                        onTap: () {
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
                  const Text(
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
              padding:
                  const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 4),
              child: Container(
                // height: 70.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 12, top: 8, bottom: 8),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              Colorutils.chatcolor.withOpacity(0.2),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                                "assets/images/profileOne.svg"),
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
                                child: Text("${sendStudentList.studentName}",
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
                                  color: Colorutils.grey,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 10.w),
                                  child: Text("Sent From Class",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colorutils.white,
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
                                "Sent : ${sendStudentList.visitDate}",
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
                                      " From : Grade"
                                      " "
                                      "${sendStudentList.classs}"
                                      " "
                                      "${sendStudentList.batch}",
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
            Column(
              children: [
              if(sendStudentList.status?.length == 1)
                Container1()
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class Container1 extends StatelessWidget {
  const Container1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              padding: EdgeInsets.only(left: 60, right: 65),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("2727",
                      // DateFormat('HH : mm').format(DateTime.parse(
                      //     widget.inProgressData.status?[0].addedOn ??
                      //         '--')
                      //     .toLocal()),
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text("-- : --",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
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
                          height: 18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colorutils.userdetailcolor),
                              )),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              )),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 18,
                            margin: EdgeInsets.only(left: 70, right: 70),
                            color: Colors.white,
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 18,
                            margin: EdgeInsets.only(left: 80, right: 80),
                            child: Positioned(
                              left: 60,
                              child: CustomLinearProgressIndicator(
                                value: 0.5,
                                backgroundColor: Colors.grey.withOpacity(0.3),
                                textColor: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                text: "ben",
                                // remainingTime > 0
                                //     ? "${formatTime(remainingTime)}"" Min Left"
                                //     : "Not Yet Reached",
                                gradient: const LinearGradient(
                                  colors: [
                                    Colorutils.userdetailcolor,
                                    Colorutils.userdetailcolor
                                  ],
                                ),
                              ),
                            ),
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
                        Positioned(
                          right: 60,
                          child: CircleAvatar(
                            radius: 16.1,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 16.0,
                              backgroundColor: Colors.grey.withOpacity(0.3),
                              child: const CircleAvatar(
                                radius: 14.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 11.0,
                                  backgroundColor: Colors.yellow,
                                  child: Icon(Icons.more_horiz_sharp,
                                      size: 16.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ben",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Reached ",
                    // "${Reachedstatus("${widget.inProgressData.status?[0].visitStatus}")}",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: SliderButton(
                        height: 50,
                        backgroundColor: Colorutils.userdetailcolor,
                        radius: 50,
                        buttonSize: 50,
                        action: () async {
                          // StudentUpdateModel updateData = StudentUpdateModel(
                          //     user: Get.find<UserAuthController>()
                          //         .userData
                          //         .value
                          //         .name ??
                          //         '',
                          //     userId: Get.find<UserAuthController>()
                          //         .userData
                          //         .value
                          //         .userId ??
                          //         '',
                          //     userToken: "",
                          //     visitId: widget.inProgressData.id);
                          // await Get.find<Studentupdatecontroller>()
                          //     .sendStudentDatas(data: updateData);
                          // await Get.find<RecentListApiController>()
                          //     .fetchRecentList();
                        },
                        label: const Text(
                          "Slide to Confirm Arrival",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        icon: const Center(
                            child: Icon(
                          CupertinoIcons.forward,
                          color: Colorutils.userdetailcolor,
                          size: 25.0,
                        )),
                        boxShadow: BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 4,
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Container2 extends StatelessWidget {
  const Container2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Container(
            height: 40,
            child: Row(
              children: [
                Text(
                  "Sent to home",
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      child: Image.asset("assets/images/icons8-walking-64.png"),
                    ),
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
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("10:10"),
                      Text("10:10"),
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
                            const Positioned(
                              child: Text("Reached",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
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
                      Text(
                        "Sent to class",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Reached Class",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
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
                  padding: EdgeInsets.only(left: 60, right: 65),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("2727",
                          // DateFormat('HH : mm').format(DateTime.parse(
                          //     widget.inProgressData.status?[0].addedOn ??
                          //         '--')
                          //     .toLocal()),
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text("-- : --",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
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
                              height: 18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colorutils.userdetailcolor),
                                  )),
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.withOpacity(0.3),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 18,
                                margin: EdgeInsets.only(left: 70, right: 70),
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 18,
                                margin: EdgeInsets.only(left: 80, right: 80),
                                child: Positioned(
                                  left: 60,
                                  child: CustomLinearProgressIndicator(
                                    value: 0.5,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.3),
                                    textColor: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    text: "ben",
                                    // remainingTime > 0
                                    //     ? "${formatTime(remainingTime)}"" Min Left"
                                    //     : "Not Yet Reached",
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colorutils.userdetailcolor,
                                        Colorutils.userdetailcolor
                                      ],
                                    ),
                                  ),
                                ),
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
                            Positioned(
                              right: 60,
                              child: CircleAvatar(
                                radius: 16.1,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 16.0,
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  child: const CircleAvatar(
                                    radius: 14.0,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 11.0,
                                      backgroundColor: Colors.yellow,
                                      child: Icon(Icons.more_horiz_sharp,
                                          size: 16.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ben",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Reached ",
                        // "${Reachedstatus("${widget.inProgressData.status?[0].visitStatus}")}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                              child: SliderButton(
                            height: 50,
                            backgroundColor: Colorutils.userdetailcolor,
                            radius: 50,
                            buttonSize: 50,
                            action: () async {
                              // StudentUpdateModel updateData = StudentUpdateModel(
                              //     user: Get.find<UserAuthController>()
                              //         .userData
                              //         .value
                              //         .name ??
                              //         '',
                              //     userId: Get.find<UserAuthController>()
                              //         .userData
                              //         .value
                              //         .userId ??
                              //         '',
                              //     userToken: "",
                              //     visitId: widget.inProgressData.id);
                              // await Get.find<Studentupdatecontroller>()
                              //     .sendStudentDatas(data: updateData);
                              // await Get.find<RecentListApiController>()
                              //     .fetchRecentList();
                            },
                            label: const Text(
                              "Slide to Confirm Arrival",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            icon: const Center(
                                child: Icon(
                              CupertinoIcons.forward,
                              color: Colorutils.userdetailcolor,
                              size: 25.0,
                            )),
                            boxShadow: BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 4,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
