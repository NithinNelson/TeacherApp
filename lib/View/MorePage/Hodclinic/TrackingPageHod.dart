import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:vibration/vibration.dart';

import '../../../Controller/api_controllers/hosStudentListController.dart';
import '../../../Models/api_models/HosStudentListModel.dart';
import '../../../Utils/Colors.dart';
import 'TrackingdetailsHod.dart';

class TrackingpageHod extends StatefulWidget {
  const TrackingpageHod({super.key});

  @override
  State<TrackingpageHod> createState() => _TrackingpageHodState();
}

class _TrackingpageHodState extends State<TrackingpageHod>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int tabValue = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      // Update the tabValue based on tab index when user scrolls
      if (_tabController.indexIsChanging) {
        setState(() {
          tabValue = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.find<Hosstudentlistcontroller>().fetchHosStudentList(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: GetX<Hosstudentlistcontroller>(
            builder: (Hosstudentlistcontroller controller) {
              List<SendData> sendStudentsData = controller.sentStudentData
                  .value;
              List<SendData> recivedStudentsData = controller.recivedStudentData
                  .value;
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 18,
                    ),
                    child: SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Live Tracking',
                            style: TextStyle(
                                fontSize: 16.w, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             Viewall()));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Icon(
                                    Icons.history_rounded,
                                    size: 20,
                                    color: Colorutils.userdetailcolor,
                                  ),
                                ),
                                Text(
                                  'History',
                                  style: TextStyle(
                                      fontSize: 16.w,
                                      fontWeight: FontWeight.bold,
                                      color: Colorutils.userdetailcolor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TabBar(
                        onTap: (value) {
                          setState(() {
                            tabValue = value;
                          });
                        },
                        dividerHeight: 0,
                        padding: EdgeInsets.all(5),
                        controller: _tabController,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        labelColor: Colorutils.userdetailcolor,
                        unselectedLabelColor: Colors.grey[700],
                        tabs: [
                          Tab(

                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('SENT', style: TextStyle(fontSize: 16)),
                                SizedBox(width: 5),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: tabValue == 0 ? Colorutils
                                        .userdetailcolor : Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text('6',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                          Tab(

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ARRIVAL', style: TextStyle(fontSize: 16)),
                                SizedBox(width: 5),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: tabValue == 1 ? Colorutils
                                        .userdetailcolor : Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text('6',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(bottom: 30),
                            itemCount: recivedStudentsData.length,
                            itemBuilder: (context, index) =>
                                TrackingContainer(
                                    recivedStudentsData: recivedStudentsData[index],
                                    startTime: DateTime.parse(
                                        "${recivedStudentsData[index].status?.last
                                            .addedOn}")
                                        .toLocal(), )),
                        ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(bottom: 30),
                            itemCount: sendStudentsData.length,
                            itemBuilder: (context, index) =>
                                trackingcontainer(
                                  sendStudentList: sendStudentsData[index],  startTime: DateTime.parse(
                                    "${sendStudentsData[index].status?.last
                                        .addedOn}"))),
                      ],
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}

class trackingcontainer extends StatefulWidget {
  final SendData sendStudentList;
  final DateTime startTime;

  const trackingcontainer({super.key, required this.sendStudentList,required this.startTime});

  @override
  State<trackingcontainer> createState() => _trackingcontainerState();
}

class _trackingcontainerState extends State<trackingcontainer> {
  static const int countdownDuration = 1 * 60; // 5 minutes in seconds

  late DateTime endTime; // The end time for the countdown
  late Timer timer;
  String? startTimer() {
    int remainingTime = endTime
        .difference(DateTime.now())
        .inSeconds;

    bool text = false;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // if (DateTime.now().isBefore(endTime)) {
        //   text = false;
        // } else {
        //   timer.cancel();
        //   text = true;
        // }

        if (DateTime.now().isBefore(endTime)) {
          text = false;
        } else {
          if (DateTime.now().isAfter(endTime) &&
              DateTime.now().isBefore(endTime.add(const Duration(seconds: 1)))) {
            _playAlertSoundAndVibrate();
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
    int remainingTime = endTime
        .difference(DateTime.now())
        .inSeconds;

    double progress = (countdownDuration - remainingTime) / countdownDuration;
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>
                  Trackingdetailshod(sendStudentList: widget.sendStudentList,)));
        },
        child: Container(
          height: 120.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, top: 8, bottom: 8, right: 12),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colorutils.chatcolor.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          SvgPicture.asset("assets/images/profileOne.svg"),
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
                              child: Text("${widget.sendStudentList.studentName}",
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
                                  color: Colors.deepOrange),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 10.w),
                                child: Text("Sent From Class",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.white))),
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
                              "Sent : ${widget.sendStudentList.visitDate}",
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
                                        "${widget.sendStudentList.classs}"
                                        " "
                                        "${widget.sendStudentList.batch}",
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  height: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomLinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.white,
                          textColor: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          text: "",
                          gradient: const LinearGradient(
                            colors: [
                              Colorutils.gradientColor1,
                              Colorutils.gradientColor2
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {

                          },
                          child: Text(
                            "${formatTime(remainingTime)}"" Left",
                            style: TextStyle(color: Colors.orange),
                          ))
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


class TrackingContainer extends StatefulWidget {
  final SendData recivedStudentsData;

  final DateTime startTime;

  const TrackingContainer({
    super.key, required this.recivedStudentsData, required this.startTime,
  });

  @override
  State<TrackingContainer> createState() => _TrackingContainerState();
}

class _TrackingContainerState extends State<TrackingContainer> {
  static const int countdownDuration = 1 * 60; // 5 minutes in seconds

  late DateTime endTime; // The end time for the countdown
  late Timer timer;
  String? startTimer() {
    int remainingTime = endTime
        .difference(DateTime.now())
        .inSeconds;

    bool text = false;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // if (DateTime.now().isBefore(endTime)) {
        //   text = false;
        // } else {
        //   timer.cancel();
        //   text = true;
        // }

        if (DateTime.now().isBefore(endTime)) {
          text = false;
        } else {
          if (DateTime.now().isAfter(endTime) &&
              DateTime.now().isBefore(endTime.add(const Duration(seconds: 1)))) {
            _playAlertSoundAndVibrate();
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
    int remainingTime = endTime
        .difference(DateTime.now())
        .inSeconds;

    double progress = (countdownDuration - remainingTime) / countdownDuration;
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 4),
      child: Container(
        height: 130.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
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
                            child: Text(
                                "${widget.recivedStudentsData.studentName}",
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
                              color: Colors.grey,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 10.w),
                              child: Text("Sent Back to Class",
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
                      width: 1,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Sent : ${widget.recivedStudentsData.visitDate}",
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
                              child: Text(" From : Grade"
                                  " "
                                  "${widget.recivedStudentsData.classs}"
                                  " "
                                  "${widget.recivedStudentsData.batch}",
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: double.infinity,
                height: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomLinearProgressIndicator(
                        value: 5,
                        backgroundColor: Colors.white,
                        textColor: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        text: "Not Yet Reached",
                        gradient: const LinearGradient(
                          colors: [
                            Colorutils.gradientColor1,
                            Colorutils.gradientColor2
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          TeacherAppPopUps.Trackingpop(title: "Coming!",
                              message: "Lucas ,from Grade 6D on way!, Sent By Emma Taylor",
                              actionName: "Track",
                              iconColor: Colors.green,
                              timeText: '4.00');
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colorutils.userdetailcolor,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: SvgPicture.asset("assets/images/arrow.svg"),
                          ),
                        ))
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
void _playAlertSoundAndVibrate() async {
  if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate(duration: 10000);
  }

  final player = AudioPlayer();

  try {
    await player.play(
        AssetSource('images/vintage_alarm_clock-[AudioTrimmer.com].mp3'));
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
              shaderCallback: (bounds) =>
                  gradient.createShader(
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
String formatTime(int seconds) {
  int minutes = seconds ~/ 60; // Calculate minutes
  int remainingSeconds = seconds % 60; // Calculate remaining seconds
  return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString()
      .padLeft(2, '0')}'; // Format as mm:ss
}
