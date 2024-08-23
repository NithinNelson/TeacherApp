import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';
import 'package:timelines/timelines.dart';

import '../../Utils/Colors.dart';

class trackingDetails extends StatelessWidget {
  const trackingDetails({super.key});

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
              padding:
                  const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 4),
              child: Container(
                height: 70.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 3, top:8, bottom: 8, right: 3),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 25,
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
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 1,bottom: 1
                          ),
                          child: Row(
                            children: [ Column(
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

                                Container(
                                    child: Text("Grade 2-B",
                                        style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)))),
                              ],
                            ),
                              SizedBox(
                                width: 1,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(
                                      "10:00 AM",
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),

                                  Container
                                    (
                                   width: 100.w,
                                    // height: 18.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.red.withOpacity(0.3),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 10.w),
                                        child: Text("Sent to Washroom",
                                            overflow: TextOverflow.ellipsis,

                                            style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: Colors.red,
                                                ))),
                                      )),
                                ],
                              ),],
                          ),
                        )

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
                      'Send From Class',
                      style: TextStyle(
                          fontSize: 18.w, fontWeight: FontWeight.bold),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("10:25 AM",
                              style: TextStyle(color: Colors.grey,fontSize: 12)),
                          Text("10:35 AM",
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
                                      style: TextStyle(color: Colors.white,fontSize: 10)),
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
                          Text("Sent to Clinic",style: TextStyle(fontSize: 12),),
                          Text("Reached Clinic",style: TextStyle(fontSize: 12),),
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
                      style: TextStyle(
                          fontSize: 18.w, fontWeight: FontWeight.bold),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("10:25 AM",
                              style: TextStyle(color: Colors.grey,fontSize: 12)),
                          Text("10:35 AM",
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
                                  alignment: Alignment.centerLeft,
                                  height: 15.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    height: 15.0,
                                    width: 190,
                                    decoration: BoxDecoration(
                                      color: Colorutils.userdetailcolor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
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
                                Positioned(
                                  right: 60,
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
                                const Positioned(
                                  child: Text("00:00",
                                      style: TextStyle(color: Colors.white,fontSize: 10)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sent to Clinic",style: TextStyle(fontSize: 12),),
                          Text("Reached Clinic",style: TextStyle(fontSize: 12),),
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
                              // return false;
                            },
                            label: Text(
                              "Slide to Confirm Arrival",
                              style: TextStyle(

                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            icon: Center(
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
        ),
      ),
    );
  }
}
