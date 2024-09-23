import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';

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

  int tabValue =0;
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
                  onTap: (value){
                    setState(() {
                      tabValue=value;
                    });
                  },
                  dividerHeight: 0,
                  padding: EdgeInsets.all(5),
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  labelColor:Colorutils.userdetailcolor,
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
                              color: tabValue==0?Colorutils.userdetailcolor:Colors.grey,
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
                              color:  tabValue==1?Colorutils.userdetailcolor:Colors.grey,
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
                      itemCount: 15,
                      itemBuilder: (context, index) => TrackingContainer()),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 30),
                      itemCount: 15,
                      itemBuilder: (context, index) => trackingcontainer()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class trackingcontainer extends StatelessWidget {
  const trackingcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Trackingdetailshod()));
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
                              child: Text("brinesh ben",
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
                                child: Text("Sent to HOD/HOS",
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
                              "Sent : 10.45",
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
                                child: Text("From : Grade 10 B",
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
                          value: 0.7,
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
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             trackingDetails(
                            //               inProgressList: widget.inProgressList,
                            //               starttime: DateTime.parse(
                            //                   "${widget.inProgressList.status
                            //                       ?.last.addedOn}")
                            //                   .toLocal(),
                            //             )));
                          },
                          child: Text(
                            "4.33 left",
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

class TrackingContainer extends StatefulWidget {
  const TrackingContainer({
    super.key,
  });

  @override
  State<TrackingContainer> createState() => _TrackingContainerState();
}

class _TrackingContainerState extends State<TrackingContainer> {
  @override
  void dispose() {}

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
                            child: Text("BrineshBen",
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
                            "Date :30-08-1998",
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
                              child: Text("Class :10-B",
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
                        TeacherAppPopUps.Trackingpop(title: "Coming!",message:  "Lucas ,from Grade 6D on way!, Sent By Emma Taylor", actionName: "Track", iconColor: Colors.green, timeText: '4.00');
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
