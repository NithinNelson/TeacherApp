import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:vibration/vibration.dart';

import '../../../Controller/api_controllers/hosAllStudentsListController.dart';
import '../../../Controller/api_controllers/hosStudentListController.dart';
import '../../../Models/api_models/HosStudentListModel.dart';
import '../../../Models/api_models/hosFullListModel.dart';
import '../../../Utils/Colors.dart';
import 'TrackingdetailsHod.dart';
import 'overAllList.dart';

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
    Get.find<Hosallstudentslistcontroller>().fetchAllStudentDateList();
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: GetX<Hosstudentlistcontroller>(
            builder: (Hosstudentlistcontroller controller) {
          List<SendData> sendStudentsData = controller.sentStudentData.value;
          List<SendData> recivedStudentsData =
              controller.recivedStudentData.value;
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Live Tracking',
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500))),
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
                    borderRadius: BorderRadius.circular(30),
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
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelColor: Colorutils.userdetailcolor,
                    unselectedLabelColor: Colors.grey[700],
                    tabs: [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('MY LIST', style: TextStyle(fontSize: 13)),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: tabValue == 0
                                    ? Colorutils.userdetailcolor
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text("${recivedStudentsData.length}",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('ALL LIST', style: TextStyle(fontSize: 13)),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: tabValue == 1
                                    ? Colorutils.userdetailcolor
                                    : Colors.grey,
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
                    RefreshIndicator(
                        onRefresh: () async =>
                            await Get.find<Hosstudentlistcontroller>()
                                .fetchHosStudentList(DateTime.now()),
                        color: Colorutils.userdetailcolor,
                        backgroundColor: Colors.white,
                        child: sendStudentsData.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(bottom: 30),
                                itemCount: sendStudentsData.length,
                                itemBuilder: (context, index) => trackingcontainer(
                                    sendStudentList: sendStudentsData[index],
                                    startTime: DateTime.parse(
                                            "${sendStudentsData[index].status?.last.addedOn}")
                                        .toLocal()))
                            : Center(
                                child: Text(
                                  "Oops..No Data Found",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.red),
                                ),
                              )),
                    GetX<Hosallstudentslistcontroller>(
                      builder: (Hosallstudentslistcontroller controller) {
                        List<Datas> sendStudentsData =
                            controller.recentData.value;

                        return Overalllist(
                          sendStudentsData: sendStudentsData,
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class trackingcontainer extends StatefulWidget {
  final SendData sendStudentList;
  final DateTime startTime;

  const trackingcontainer(
      {super.key, required this.sendStudentList, required this.startTime});

  @override
  State<trackingcontainer> createState() => _trackingcontainerState();
}

class _trackingcontainerState extends State<trackingcontainer> {
  static const int countdownDuration = 1 * 60; // 5 minutes in seconds

  late DateTime endTime; // The end time for the countdown
  late Timer timer;

  @override
  @override
  void initState() {
    super.initState();
    endTime = widget.startTime.add(Duration(seconds: countdownDuration));
    if (widget.sendStudentList.status?.length == 1 ||
        widget.sendStudentList.status?.length == 3) {
      startTimer();
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   startTimer();      });
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
            _playAlertSoundAndVibrate();
            TeacherAppPopUps.Trackingpop(
                title: "Coming!",
                message:
                    "${widget.sendStudentList.studentName} ,from ${" From : Grade"
                        " "
                        "${widget.sendStudentList.classs}"
                        " "
                        "${widget.sendStudentList.batch}"} on way!, Sent By ${widget.sendStudentList.teacherId}",
                actionName: "Track",
                iconColor: Colors.green,
                timeText: '4.00');
            print("..........................bellssls");
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
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Trackingdetailshod(
                    sendStudentList: widget.sendStudentList,
                    starttime: DateTime.parse(
                            "${widget.sendStudentList.status?.last.addedOn}")
                        .toLocal(),
                  )));
        },
        child: Container(
          height: 110.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
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
                                  color: Colorutils.clinicHOd),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 10.w),
                                child: Text("Sent From Teacher",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.blue))),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Sent : ",

                                  // "Sent : ${widget.sendStudentList.visitDate}",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "${DateFormat('hh : mm a').format(DateTime.parse(widget.sendStudentList.status?[0].addedOn ?? '--').toLocal())}",

                                  // "Sent : ${widget.sendStudentList.visitDate}",
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  height: 18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomLinearProgressIndicator(
                          value: widget.sendStudentList.status!.length == 1 ||
                                  widget.sendStudentList.status!.length == 3
                              ? progress
                              : 10,
                          backgroundColor: Colors.white,
                          textColor: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          text: widget.sendStudentList.status?.length == 2
                              ? "Reached"
                              : (widget.sendStudentList.status?.length == 3 &&
                                      widget.sendStudentList.status?[2]
                                              .visitStatus ==
                                          "Sent to Isolation Room")
                                  ? " Sent to Isolation Room from Clinic"
                                  : remainingTime > 0
                                      ? "On Way"
                                      : "Not Yet Reached",
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
                          onTap: () {},
                          child: widget.sendStudentList.status?.length == 2
                              ? Text(
                                  "Reached",
                                  style: TextStyle(color: Colors.orange),
                                )
                              : remainingTime > 0
                                  ? Text(
                                      "${formatTime(remainingTime)}" "Left",
                                      style: TextStyle(color: Colors.orange),
                                    )
                                  : Text(
                                      "00:00 Left",
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
  final Datas sendStudentsData;

  const TrackingContainer({
    super.key,
    required this.sendStudentsData,
  });

  @override
  State<TrackingContainer> createState() => _TrackingContainerState();
}

class _TrackingContainerState extends State<TrackingContainer> {
  static const int countdownDuration = 1 * 60; // 5 minutes in seconds

  @override
  Widget build(BuildContext context) {
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
                                "${widget.sendStudentsData.studentName}",
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
                            "Sent : ${widget.sendStudentsData.visitDate}",
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
                                  "${widget.sendStudentsData.classs}"
                                  " "
                                  "${widget.sendStudentsData.batch}",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 12.sp,
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
                          TeacherAppPopUps.Trackingpop(
                              title: "Coming!",
                              message:
                                  "Lucas ,from Grade 6D on way!, Sent By Emma Taylor",
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

String formatTime(int seconds) {
  int minutes = seconds ~/ 60; // Calculate minutes
  int remainingSeconds = seconds % 60; // Calculate remaining seconds
  return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}'; // Format as mm:ss
}
