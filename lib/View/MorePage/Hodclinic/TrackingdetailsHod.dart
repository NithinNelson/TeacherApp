import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slider_button/slider_button.dart';
import 'package:teacherapp/Models/api_models/HosStudentListModel.dart';
import 'package:vibration/vibration.dart';

import '../../../Controller/api_controllers/HosStudentUpdateController.dart';
import '../../../Controller/api_controllers/hosStudentListController.dart';
import '../../../Controller/api_controllers/studentModelController.dart';
import '../../../Controller/api_controllers/userAuthController.dart';
import '../../../Models/api_models/HosUpdateModel.dart';
import '../../../Utils/Colors.dart';
import '../tackingDetails.dart';
import '../trackingPage.dart';
import 'TrackingPageHod.dart';

class Trackingdetailshod extends StatefulWidget {
  final SendData sendStudentList;
  final DateTime starttime;

  const Trackingdetailshod(
      {super.key, required this.sendStudentList, required this.starttime});



  @override
  State<Trackingdetailshod> createState() => _TrackingdetailshodState();
}


class _TrackingdetailshodState extends State<Trackingdetailshod> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  bool ontap = false;

  @override
  Widget build(BuildContext context) {
    controller1 = TextEditingController(text:"SENDER REMARK : ${widget.sendStudentList.status?[0].remark}" );
    controller2 = TextEditingController(text:"UPDATED REMARK : ${widget.sendStudentList.remarks}" );
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TrackingpageHod()))
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: GetBuilder<UpdateController>(
          builder: (_) {

            return Column(
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 12, top: 8, bottom: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // CircleAvatar(
                              //   radius: 20,
                              //   backgroundColor:
                              //       Colorutils.chatcolor.withOpacity(0.2),
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: SvgPicture.asset(
                              //         "assets/images/profileOne.svg"),
                              //   ),
                              // ),
                              CircleAvatar(
                                radius: 25.r,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(90.h),
                                  child: CachedNetworkImage(
                                    imageUrl: "${widget.sendStudentList.profilePic}",
                                    placeholder: (context, url) => CircleAvatar(
                                      radius: 25.r,
                                      backgroundColor: Colorutils.chatcolor.withOpacity(0.1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset("assets/images/profileOne.svg"),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => CircleAvatar(
                                      radius: 25.r,
                                      backgroundColor: Colorutils.chatcolor.withOpacity(0.2),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset("assets/images/profileOne.svg"),
                                      ),
                                    ),
                                  ),
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
                                      child: Text(
                                          "${widget.sendStudentList.studentName}",
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
                                        color: Colorutils.clinicHOd,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 10.w),
                                        child: Text("Sent From Teacher",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                              fontSize: 13.sp,
                                              color: Colors.blue,
                                            ))),
                                      )),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Sent :",

                                        // "Sent : ${widget.sendStudentList.visitDate}",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        " ${widget.sendStudentList.visitDate}",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Container(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "From : ",

                                        // "Sent : ${widget.sendStudentList.visitDate}",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                          "Grade "
                                          "${widget.sendStudentList.classs}"
                                          " "
                                          "${widget.sendStudentList.batch}",
                                          style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold))),
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55, bottom: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.blue,
                                size: 8,
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                      "${widget.sendStudentList.status?.first.sentBy?.toUpperCase()}",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.blue,
                                      ))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    if (widget.sendStudentList.status?.length == 1)
                      Container1(
                        sendDetails1: widget.sendStudentList,
                        startTime1: widget.starttime,
                      ),
                    if (widget.sendStudentList.status?.length == 2)
                      Container2(
                        sendDetails2: widget.sendStudentList,
                        startTime2: widget.starttime,
                      ),
                    if (widget.sendStudentList.status?.length == 3)
                      Container3(
                        sendDetails3: widget.sendStudentList,
                        startTime3: widget.starttime,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            ontap = !ontap;
                          });
                        },
                        child: Container(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Remarks",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colorutils.userdetailcolor,
                                    fontStyle: FontStyle.italic),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  ontap == true
                                      ? Icons.arrow_drop_down
                                      : Icons.arrow_drop_up,
                                  // Change icon based on ontap value
                                  color: Colorutils.userdetailcolor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    ontap == true
                        ? Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Container(
                                    child: TextFormField(
                                      controller: controller1,
                                      style: TextStyle(
                                          fontSize: 12,),
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(color: Colors.black26),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colorutils.chatcolor,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(15)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colorutils.chatcolor,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(15.0)),
                                          ),
                                          fillColor:
                                              Colorutils.chatcolor.withOpacity(0.2),
                                          filled: true),
                                      maxLines: 5,
                                    ),
                                    height: 80,
                                  ),
                                ),
                              ),
                            (widget.sendStudentList.status!.length ==2||widget.sendStudentList.status!.length ==3||widget.sendStudentList.status!.length ==4)?
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 10, right: 10),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Container(
                                  child: TextFormField(

                                    controller: controller2,
                                    style: TextStyle(
                                        fontSize: 12,
                                       ),
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        hintStyle:
                                        TextStyle(color: Colors.black26),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 10.0),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15.0),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colorutils.chatcolor,
                                              width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colorutils.chatcolor,
                                              width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                        ),
                                        fillColor: Colorutils.chatcolor
                                            .withOpacity(0.2),
                                        filled: true),
                                    maxLines: 5,
                                  ),
                                  height: 80,
                                ),
                              ),
                            ):SizedBox()
                          ],
                        )
                        : SizedBox()
                  ],
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

class Container1 extends StatefulWidget {
  final SendData sendDetails1;
  final DateTime startTime1;

  const Container1(
      {super.key, required this.sendDetails1, required this.startTime1});

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
    endTime = widget.startTime1.add(Duration(seconds: countdownDuration));
    if (widget.sendDetails1.status?.length == 1) {
      startTimer(); // Start the timer when the screen is initialized
    }
  }

  String? startTimer() {
    int remainingTime = endTime.difference(DateTime.now()).inSeconds;

    bool text = false;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print("rebuild...brbggh.....$timer.............");
      setState(() {
        if (DateTime.now().isBefore(endTime)) {
          text = false;
        } else {
          timer.cancel();
          text = true;
        }

        if (DateTime.now().isBefore(endTime)) {
          text = false;
        } else {
          if (DateTime.now().isAfter(endTime) &&
              DateTime.now()
                  .isBefore(endTime.add(const Duration(seconds: 1)))) {
            // _playAlertSoundAndVibrate();
            // _playAlertSoundAndVibrate();
          }
          timer.cancel();
          text = true;
        }
      });
    });

    // Return status based on the timer status
    if (!text) {
      return "Not Yet Reached";
    } else {
      return "Timer Reached";
    }
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int remainingTime = endTime.difference(DateTime.now()).inSeconds;

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
                  "${widget.sendDetails1.status![0].visitStatus}",
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: SvgPicture.asset("assets/images/Notebook1.svg"),
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
                                  widget.sendDetails1.status?[0].addedOn ??
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
                                child: CustomLinearProgressIndicator(
                                  value: progress,
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  textColor: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  text: remainingTime > 0
                                      ? "${formatTime(remainingTime)}"
                                          " Min Left"
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
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.sendDetails1.status![0].visitStatus ?? "--"}",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Reached ${Reachedstatus("${widget.sendDetails1.status?[0].visitStatus}")}",
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
                        child: SliderButton(
                      height: 50,
                      width: ScreenUtil().screenWidth * 0.9,
                      backgroundColor: Colorutils.userdetailcolor,
                      radius: 50,
                      buttonSize: 50,
                      action: () async {
                        HosUpdateModel updateData = HosUpdateModel(
                          id: widget.sendDetails1.id,
                          sentBy: Get.find<UserAuthController>()
                                  .userData
                                  .value
                                  .name ??
                              '',
                          sentById: Get.find<UserAuthController>()
                                  .userData
                                  .value
                                  .userId ??
                              '',
                          visitStatus:
                              "Reached ${Reachedstatus("${widget.sendDetails1.status?[0].visitStatus}")}",
                        );
                        await Get.find<Hosstudentupdatecontroller>()
                            .sendHOSStudentDatas(data: updateData);
                        await Get.find<Hosstudentlistcontroller>()
                            .fetchHosStudentList(DateTime.now());

                        // await Get.find<RecentListApiController>()
                        //     .fetchRecentList();

                      },
                      label: Center(
                        child: const Text(
                          "Slide to Confirm Arrival",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colorutils.userdetailcolor,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colorutils.white,
                          child: const Center(
                              child: Icon(
                            CupertinoIcons.checkmark_alt,
                            color: Colorutils.userdetailcolor,
                            size: 25.0,
                          )),
                        ),
                      ),
                      boxShadow: BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4,
                      ),
                    )),
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

class Container2 extends StatefulWidget {
  final SendData sendDetails2;
  final DateTime startTime2;

  const Container2(
      {super.key, required this.sendDetails2, required this.startTime2});

  @override
  State<Container2> createState() => _Container2State();
}

class _Container2State extends State<Container2> {
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
                  "${widget.sendDetails2.status![0].visitStatus}",
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: SvgPicture.asset("assets/images/Notebook1.svg"),
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
                                  widget.sendDetails2.status?[0].addedOn ??
                                      '--')
                              .toLocal()),
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text(
                          DateFormat('HH : mm').format(DateTime.parse(
                                  widget.sendDetails2.status?[1].addedOn ??
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
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.sendDetails2.status?[0].visitStatus}",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Reached ${Reachedstatus("${widget.sendDetails2.status?[0].visitStatus}")}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Container(
            height: 40,
            child: Row(
              children: [
                Text(
                  "Sent to Class",
                  // "${widget.sendDetails2.status![1].visitStatus}",
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: SvgPicture.asset("assets/images/Notebook1.svg"),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
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
                            width: ScreenUtil().screenWidth * 0.9,
                            backgroundColor: Colorutils.userdetailcolor,
                            radius: 50,
                            buttonSize: 50,
                            action: () async {
                              HosUpdateModel updateData = HosUpdateModel(
                                id: widget.sendDetails2.id,
                                sentBy: Get.find<UserAuthController>()
                                        .userData
                                        .value
                                        .name ??
                                    '',
                                sentById: Get.find<UserAuthController>()
                                        .userData
                                        .value
                                        .userId ??
                                    '',
                                visitStatus: "Back to Class",
                              );
                              await Get.find<Hosstudentupdatecontroller>()
                                  .sendHOSStudentDatas(data: updateData);
                              await Get.find<Hosstudentlistcontroller>()
                                  .fetchHosStudentList(DateTime.now());

                              // await Get.find<RecentListApiController>()
                              //     .fetchRecentList();

                            },
                            label: Center(
                              child: const Text(
                                "Slide to Sent Student to the class",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ),
                            icon: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colorutils.userdetailcolor,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colorutils.white,
                                child: const Center(
                                    child: Icon(
                                  CupertinoIcons.checkmark_alt,
                                  color: Colorutils.userdetailcolor,
                                  size: 25.0,
                                )),
                              ),
                            ),
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

class Container3 extends StatefulWidget {
  final SendData sendDetails3;
  final DateTime startTime3;

  const Container3(
      {super.key, required this.sendDetails3, required this.startTime3});

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
    endTime = widget.startTime3.add(Duration(seconds: countdownDuration));
    if (widget.sendDetails3.status?.length == 3) {
      startTimer(); // Start the timer when the screen is initialized
    }
  }

  String? startTimer() {
    int remainingTime = endTime.difference(DateTime.now()).inSeconds;

    bool text = false;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print("rebuild...brbggh.....$timer.............");
      setState(() {
        if (DateTime.now().isBefore(endTime)) {
          text = false;
        } else {
          timer.cancel();
          text = true;
        }

        if (DateTime.now().isBefore(endTime)) {
          text = false;
        } else {
          if (DateTime.now().isAfter(endTime) &&
              DateTime.now()
                  .isBefore(endTime.add(const Duration(seconds: 1)))) {
            // _playAlertSoundAndVibrate();
            // _playAlertSoundAndVibrate();
          }
          timer.cancel();
          text = true;
        }
      });
    });

    // Return status based on the timer status
    if (!text) {
      return "Not Yet Reached";
    } else {
      return "Timer Reached";
    }
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int remainingTime = endTime.difference(DateTime.now()).inSeconds;

    double progress = (countdownDuration - remainingTime) / countdownDuration;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18, right: 18),
          child: Container(
            height: 40,
            child: Row(
              children: [
                Text(
                  "${widget.sendDetails3.status![0].visitStatus}",
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: SvgPicture.asset("assets/images/Notebook1.svg"),
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
                                  widget.sendDetails3.status?[0].addedOn ??
                                      '--')
                              .toLocal()),
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text(
                          DateFormat('HH : mm').format(DateTime.parse(
                                  widget.sendDetails3.status?[1].addedOn ??
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
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // "-- : --",
                        "${widget.sendDetails3.status?[0].visitStatus}",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Reached ${Reachedstatus("${widget.sendDetails3.status?[0].visitStatus}")}",
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
          padding: EdgeInsets.only(left: 18, right: 18),
          child: Container(
            height: 40,
            child: Row(
              children: [
                Text(
                  "${widget.sendDetails3.status![2].visitStatus}",
                  style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: SvgPicture.asset("assets/images/Notebook1.svg"),
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
                                    widget.sendDetails3.status?[2].addedOn ??
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
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                  child: CustomLinearProgressIndicator(
                                    value: progress,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.3),
                                    textColor: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    text: remainingTime > 0
                                        ? "${formatTime(remainingTime)}"
                                            " Min Left"
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
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.3),
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
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.sendDetails3.status![2].visitStatus ?? "--"}",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          // "-- : --",

                          "Reached "
                          "${Reachedstatus("${widget.sendDetails3.status?[2].visitStatus}")}",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}

String formatTime(int seconds) {
  int minutes = seconds ~/ 60; // Calculate minutes
  int remainingSeconds = seconds % 60; // Calculate remaining seconds
  return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}'; // Format as mm:ss
}

void _playAlertSoundAndVibrate() async {
  if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate(duration: 10000);
  }

  final player = AudioPlayer();

  try {
    await player
        .play(AssetSource('images/vintage_alarm_clock-[AudioTrimmer.com].mp3'));
  } catch (e) {
    print('Error playing audio: $e');
  }

  Future.delayed(Duration(seconds: 5), () {
    Vibration.cancel();
    player.stop();
  });
}

class CustomLinearProgressIndicator extends StatelessWidget {
  final double value;
  final Color backgroundColor;
  final Gradient gradient;
  final Color textColor;
  final BorderRadius borderRadius;
  final String text;

  CustomLinearProgressIndicator({
    required this.value,
    required this.backgroundColor,
    required this.gradient,
    required this.textColor,
    required this.borderRadius,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 25,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            border: Border.all(
              color: Colors.grey.withOpacity(0.4),
              width: 1.0,
            ),
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: ShaderMask(
              shaderCallback: (bounds) => gradient.createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              ),
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(15),
                value: value,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
