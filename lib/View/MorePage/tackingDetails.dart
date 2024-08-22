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
    return  Scaffold(
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
                child: Icon(
                  Icons.arrow_back_outlined,
                  size: 30,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Text(
                "Tracking",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,bottom: 8,top: 4),
        child: Container(
          // height: 70.h,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 2.0,
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
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
                            color: Colors.red.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 10.w),
                            child: Text("Sent to Clinic",
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
              ),
              SizedBox(width: 10,),
              Container(
                child: SvgPicture.asset("assets/images/Notebook.svg"),
              )
            ],
          ),
        ),
      ),
  Padding(
    padding: const EdgeInsets.only(left: 10 , right: 10),
    child: Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
       border: Border.all(
         color: Colors.grey.withOpacity(0.2)
       )
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
            padding: const EdgeInsets.only(left: 50,right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("10:25 AM", style: TextStyle(color: Colors.grey)),
                Text("10:35 AM", style: TextStyle(color: Colors.grey)),
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
                      Positioned(
                        left: 60,

                        child: CircleAvatar(
                          radius: 16.0,
                          backgroundColor: Colorutils.userdetailcolor,
                          child: CircleAvatar(
                            radius: 14.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 12.0,
                              backgroundColor:Colorutils.userdetailcolor,
                              child: Icon(Icons.check, size: 16.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 60,

                        child: CircleAvatar(
                          radius: 16.0,
                          backgroundColor: Colorutils.userdetailcolor,
                          child: CircleAvatar(
                            radius: 14.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 12.0,
                              backgroundColor:Colorutils.userdetailcolor,
                              child: Icon(Icons.check, size: 16.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Text("00:00", style: TextStyle(color: Colors.white)),
                      ),
                    ],

                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(left: 40,right: 30),          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sent to Clinic"),
                Text("Reached Clinic"),
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
              SizedBox(width: 10,),
              Container(
                child: SvgPicture.asset("assets/images/Frame 849.svg"),
              )
            ],
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 10 , right: 10),
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                  color: Colors.grey.withOpacity(0.2)
              )
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
                padding: const EdgeInsets.only(left: 50,right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("10:25 AM", style: TextStyle(color: Colors.grey)),
                    Text("10:35 AM", style: TextStyle(color: Colors.grey)),
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
                                color:Colorutils.userdetailcolor,
                                borderRadius: BorderRadius.circular(10.0),

                              ),
                            ),

                          ),
                          Positioned(
                            left: 60,

                            child: CircleAvatar(
                              radius: 16.0,
                              backgroundColor: Colorutils.userdetailcolor,
                              child: CircleAvatar(
                                radius: 14.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 12.0,
                                  backgroundColor:Colorutils.userdetailcolor,
                                  child: Icon(Icons.check, size: 16.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 60,

                            child: CircleAvatar(
                              radius: 16.0,
                              backgroundColor: Colors.grey.withOpacity(0.3),
                              child: CircleAvatar(
                                radius: 14.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 12.0,
                                  backgroundColor:Colors.yellow,
                                  child: Icon(Icons.more_horiz_sharp, size: 16.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Text("00:00", style: TextStyle(color: Colors.white)),
                          ),
                        ],

                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 30),          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sent to Clinic"),
                  Text("Reached Clinic"),
                ],
              ),
              ),
              SizedBox(height: 12,),
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
                                fontSize: 17),
                          ),
                          icon: Center(
                              child: Icon(
                                CupertinoIcons.forward,
                                color: Colorutils.userdetailcolor,
                                size: 25.0,
                                semanticLabel: 'Text to announce in accessibility modes',
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
