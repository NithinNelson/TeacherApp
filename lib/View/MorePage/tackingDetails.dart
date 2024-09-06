import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slider_button/slider_button.dart';
import 'package:teacherapp/View/MorePage/tackingDetails.dart';
import 'package:teacherapp/View/MorePage/trackingPage.dart';
import 'package:timelines/timelines.dart';

import '../../Controller/api_controllers/recentListApiController.dart';
import '../../Controller/api_controllers/studentUpdateController.dart';
import '../../Controller/api_controllers/userAuthController.dart';
import '../../Models/api_models/recentlist_model.dart';
import '../../Models/api_models/student_updateModel.dart';
import '../../Utils/Colors.dart';

class trackingDetails extends StatelessWidget {
  final DateTime starttime;
  final RecentData inProgressList;

  const trackingDetails(
      {super.key, required this.inProgressList, required this.starttime});

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
                                child: Text("${inProgressList.studentName}",
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
                                  child: Text("${inProgressList.visitStatus}",
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
                                Converteddate("${inProgressList.visitDate}"),
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
                                      "${inProgressList.classs}"
                                      " "
                                      "${inProgressList.batch}",
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
            GetX<RecentListApiController>(
              builder: (RecentListApiController controller) {
                RecentData data = inProgressList;
                for (var progressData in controller.inProgressData.value) {
                  if (progressData.id == inProgressList.id) {
                    print("....datazzzzzz ....${progressData.status?.length}");
                    data = progressData;
                  }
                }
                print("....datazzzzzz222 ....${data.status?.length}");
                print("....datazzzzzz222 ....${data.id}");
                print("....datazzzzzz222 ....${data.studentName}");
                return Column(
                  children: [
                    if (data.status?.length == 1)
                      Container1(inProgressData: data, starttime: starttime),
                    if (data.status?.length == 2)
                      Container2(
                        starttime: starttime,
                        inProgressData: data,
                      ),
                    if (data.status?.length == 3)
                      Container3(
                        starttime: starttime,
                        inProgressData: data,
                      ),
                    if (data.status?.length == 4) Container4(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Container1 extends StatefulWidget {
  final DateTime starttime;
  final RecentData inProgressData;

  const Container1({
    super.key,
    required this.inProgressData,
    required this.starttime,
  });

  @override
  State<Container1> createState() => _Container1State();
}

class _Container1State extends State<Container1> {
  static const int countdownDuration = 1 * 60; // 5 minutes in seconds

  late DateTime endTime; // The end time for the countdown
  late Timer timer;

  @override
  void initState() {
    super.initState();
    endTime = widget.starttime.add(Duration(
        seconds:
            countdownDuration)); // Calculate the end time based on the start time
    startTimer(); // Start the timer when the screen is initialized
  }

  String? startTimer() {
    bool text = false;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (DateTime.now().isBefore(endTime)) {
          // Countdown is still in progress
        } else {
          timer.cancel();

          text =
              true; // Stop the timer when the current time reaches or exceeds the end time
        }
      });
    });
    if (text = true) {
      return "Not Yet Reached";
    }
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int remainingTime = endTime.difference(DateTime.now()).inSeconds;
    // remainingTime = remainingTime > 0
    //     ? remainingTime
    //     : 0;

    double progress = (countdownDuration - remainingTime) / countdownDuration;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Container(
            height: 40,
            child: Row(
              children: [
                Text(
                  widget.inProgressData.status?[0].visitStatus ?? '--',
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: SvgPicture.asset("assets/images/Notebook.svg"),
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
                  padding: EdgeInsets.only(left: 60, right: 65),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          DateFormat('HH : mm').format(DateTime.parse(
                                  widget.inProgressData.status?[0].addedOn ??
                                      '--')
                              .toLocal()),
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
                                    decoration:BoxDecoration(


                                        borderRadius: BorderRadius.circular(10),
                                    color: Colorutils.userdetailcolor),

                                  )),
                                  Expanded(
                                      child: Container(
                                        decoration:BoxDecoration(


                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey.withOpacity(0.3),),

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
                                    value: progress,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.3),
                                    textColor: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    text: remainingTime > 0
                                        ? formatTime(remainingTime)
                                        : "Not Yet Reached",
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
                        "${widget.inProgressData.status?[0].visitStatus}",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Reached "
                        "${Reachedstatus("${widget.inProgressData.status?[0].visitStatus}")}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Container2 extends StatelessWidget {
  final DateTime starttime;
  final RecentData inProgressData;

  const Container2(
      {super.key, required this.starttime, required this.inProgressData});

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
                  inProgressData.status?[1].visitStatus ?? '--',
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: SvgPicture.asset("assets/images/Notebook.svg"),
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
                      Text(
                          DateFormat('HH : mm').format(DateTime.parse(
                                  inProgressData.status?[1].addedOn ?? '--')
                              .toLocal()),
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text(
                          DateFormat('HH : mm').format(DateTime.parse(
                                  inProgressData.status?[1].addedOn ?? '--')
                              .toLocal()),
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
                        "${inProgressData.status?[1].visitStatus}",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "${Reachedstatus("${inProgressData.status?[1].visitStatus}")}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Container3 extends StatefulWidget {
  final DateTime starttime;
  final RecentData inProgressData;

  const Container3(
      {super.key, required this.starttime, required this.inProgressData});

  @override
  State<Container3> createState() => _Container3State();
}

class _Container3State extends State<Container3> {
  static const int countdownDuration = 1 * 60; // 5 minutes in seconds

  late DateTime endTime; // The end time for the countdown
  late Timer timer;

  @override
  void initState() {
    super.initState();
    endTime = widget.starttime.add(Duration(
        seconds:
            countdownDuration)); // Calculate the end time based on the start time
    startTimer(); // Start the timer when the screen is initialized
  }

  String? startTimer() {
    bool text = false;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (DateTime.now().isBefore(endTime)) {
          // Countdown is still in progress
        } else {
          timer.cancel();

          text =
              true; // Stop the timer when the current time reaches or exceeds the end time
        }
      });
    });
    if (text = true) {
      return "Not Yet Reached";
    }
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int remainingTime = endTime.difference(DateTime.now()).inSeconds;
    // remainingTime = remainingTime > 0
    //     ? remainingTime
    //     : 0;

    double progress = (countdownDuration - remainingTime) / countdownDuration;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Container(
            height: 40,
            child: Row(
              children: [
                Text(
                  widget.inProgressData.status?[0].visitStatus ?? '--',
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: SvgPicture.asset("assets/images/Frame 849.svg"),
                  // child: SvgPicture.asset("assets/images/Notebook.svg"),
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
                      Text(
                          DateFormat('HH : mm').format(DateTime.parse(
                                  widget.inProgressData.status?[1].addedOn ??
                                      '--')
                              .toLocal()),
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text(
                          DateFormat('HH : mm').format(DateTime.parse(
                                  widget.inProgressData.status?[1].addedOn ??
                                      '--')
                              .toLocal()),
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
                                backgroundColor: Colorutils.userdetailcolor,
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
                        "${widget.inProgressData.status?[1].visitStatus}",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "${Reachedstatus("${widget.inProgressData.status?[1].visitStatus}")}",
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
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Container(
            height: 40,
            child: Row(
              children: [
                Text(
                  widget.inProgressData.status?[2].visitStatus ?? '--',
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: SvgPicture.asset("assets/images/Notebook.svg"),
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
                      Text(
                          DateFormat('HH : mm').format(DateTime.parse(
                                  widget.inProgressData.status?[1].addedOn ??
                                      '--')
                              .toLocal()),
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 12)),
                      const Text("-- : -- ",
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
                                        decoration:BoxDecoration(


                                            borderRadius: BorderRadius.circular(10),
                                            color: Colorutils.userdetailcolor),

                                      )),
                                  Expanded(
                                      child: Container(
                                        decoration:BoxDecoration(


                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey.withOpacity(0.3),),

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
                                    value: progress,
                                    backgroundColor:
                                    Colors.grey.withOpacity(0.3),
                                    textColor: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    text: remainingTime > 0
                                        ? formatTime(remainingTime)
                                        : "Not Yet Reached",
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
                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         height: 50.0,
                //         child: Stack(
                //           alignment: Alignment.center,
                //           children: [
                //             Container(
                //               height: 20,
                //               child: Positioned(
                //                 child: CustomLinearProgressIndicator(
                //                   value: progress,
                //                   backgroundColor: Colors.grey.withOpacity(0.3),
                //                   textColor: Colors.white,
                //                   borderRadius: BorderRadius.circular(15),
                //                   text: remainingTime > 0
                //                       ? formatTime(remainingTime)
                //                       : "Not Yet Reached",
                //                   gradient: const LinearGradient(
                //                     colors: [
                //                       Colorutils.userdetailcolor,
                //                       Colorutils.userdetailcolor
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             const Positioned(
                //               left: 60,
                //               child: CircleAvatar(
                //                 radius: 16.0,
                //                 backgroundColor: Colors.white,
                //                 child: CircleAvatar(
                //                   radius: 16.0,
                //                   backgroundColor: Colorutils.userdetailcolor,
                //                   child: CircleAvatar(
                //                     radius: 14.0,
                //                     backgroundColor: Colors.white,
                //                     child: CircleAvatar(
                //                       radius: 11.0,
                //                       backgroundColor: Colors.green,
                //                       child: Icon(Icons.check,
                //                           size: 16.0, color: Colors.white),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Positioned(
                //               right: 60,
                //               child: CircleAvatar(
                //                 radius: 16.0,
                //                 backgroundColor: Colors.white,
                //                 child: CircleAvatar(
                //                   radius: 16.0,
                //                   backgroundColor: Colors.grey.withOpacity(0.3),
                //                   child: const CircleAvatar(
                //                     radius: 14.0,
                //                     backgroundColor: Colors.white,
                //                     child: CircleAvatar(
                //                       radius: 11.0,
                //                       backgroundColor: Colors.yellow,
                //                       child: Icon(Icons.more_horiz_sharp,
                //                           size: 16.0, color: Colors.white),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.inProgressData.status?[1].visitStatus}",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "${Reachedstatus("${widget.inProgressData.status?[1].visitStatus}")}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
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
                          StudentUpdateModel updateData = StudentUpdateModel(
                              user: Get.find<UserAuthController>()
                                      .userData
                                      .value
                                      .name ??
                                  '',
                              userId: Get.find<UserAuthController>()
                                      .userData
                                      .value
                                      .userId ??
                                  '',
                              userToken: "",
                              visitId: widget.inProgressData.id);
                          await Get.find<Studentupdatecontroller>()
                              .sendStudentDatas(data: updateData);
                          await Get.find<RecentListApiController>()
                              .fetchRecentList();
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
            ),
          ),
        ),
      ],
    );
  }
}

class Container4 extends StatelessWidget {
  const Container4({super.key});

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
                  'Send From Class',
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: SvgPicture.asset("assets/images/Notebook.svg"),
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
                      Text("10:35 AM",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text("10:35 AM",
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
                              height: 15.0,
                              decoration: BoxDecoration(
                                color: Colorutils.userdetailcolor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            const Positioned(
                              left: 60,
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
                            const Positioned(
                              right: 60,
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
                            Positioned(
                              child: Text("00:00",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                const Padding(
                  padding: EdgeInsets.only(left: 40, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sent to Clinic",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Reached Clinic",
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
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Container(
            height: 40,
            child: Row(
              children: [
                Text(
                  'Send From Clinic',
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: SvgPicture.asset("assets/images/Frame 849.svg"),
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
                      Text("10:35 AM",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text("10:35 AM",
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
                              height: 15.0,
                              decoration: BoxDecoration(
                                color: Colorutils.userdetailcolor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            const Positioned(
                              left: 60,
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
                            const Positioned(
                              right: 60,
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
                            Positioned(
                              child: Text("00:00",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                const Padding(
                  padding: EdgeInsets.only(left: 40, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sent to Clinic",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Reached Clinic",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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

String Reachedstatus(String status) {
  List<String> parts = status.split(' ');
  if (parts.length == 3) {
    return parts[2];
  }
  return status;
}

String formatTime(int seconds) {
  int minutes = seconds ~/ 60; // Calculate minutes
  int remainingSeconds = seconds % 60; // Calculate remaining seconds
  return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}'; // Format as mm:ss
}
