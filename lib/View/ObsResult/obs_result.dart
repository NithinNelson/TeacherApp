import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../Utils/Colors.dart';
import '../../Utils/constants.dart';
import '../../Utils/font_util.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';
import 'Obsresult_display.dart';

class ObsResult extends StatefulWidget {
  const ObsResult({super.key});

  @override
  State<ObsResult> createState() => _ObsResultState();
}

class _ObsResultState extends State<ObsResult> {
  get isSpinner => null;



  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(

      value: systemUiOverlayStyleLight,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.98,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Stack(
              children: [
                AppBarBackground(),
                Positioned(
                  left: 0,
                  top: -10,
                  child: Container(
                    // height: 100.w,
                    width: ScreenUtil().screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    child: const UserDetails(
                        shoBackgroundColor: false, isWelcome: true),
                  ),
                ),
                Container(
                  margin:
                  EdgeInsets.only(left: 10.w, top: 120.h, right: 10.w,),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r)),
                    // Border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colorutils.userdetailcolor.withOpacity(0.3),
                        // Shadow color
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),


                  child: SingleChildScrollView(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 10),
                          child: Row(
                            children: [
                              Text(
                                'Observation Result',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        for(int i=0;i<10;i++)
                          _resultlist(context)
                        // ListView.builder(
                        //   itemCount:10,
                        //   shrinkWrap: true,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return _resultlist();
                        //   },
                        //
                        // ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  rubrics({required rubricslessonob}) {}
}
Widget _resultlist(BuildContext context, {
  String? observer_name,

  String? date_of_observation,
  String? subject_name,

  String? type,
}) =>
    InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ObsResultdisplay() ));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 5),
        child: Container(
          height: 160.h,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:Colorutils.chatcolor.withOpacity(0.05) ,
              border: Border.all(color: Colorutils.chatcolor)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8,top:2),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text("Lesson Observation",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w900),),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colorutils.chatcolor),

                      ),
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl:
                          "sjjhsjh",
                          placeholder: (context, url) => Text(
                            "ben",
                            style: TextStyle(
                                color: Color(0xFFB1BFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          errorWidget: (context, url, error) => Text(
                            "B",
                            style: TextStyle(
                                color: Color(0xFFB1BFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                              width: 200.w,
                              child: Text(
                                "Mathematics",
                                // 'Subject',
                                style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),
                              )),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(

                              width: 230.w,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 70.w,
                                    child: Text(
                                      'Done By',
                                      // 'Observer Name',
                                      style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    width: 10.w,
                                    child: Text(
                                      ':',
                                      // 'Observer',
                                      style: TextStyle(fontSize: 15.sp,),
                                    ),
                                  ),
                                  Container(
                                    width: 140.w,
                                    child: Text(
                                      'Nithin Nelson',
                                      // 'Observer',
                                      style: TextStyle(fontSize: 15.sp,),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 70.w,
                                child: Text(
                                  'On',
                                  // 'Observer Name',
                                  style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),
                                ),
                              ), Container(
                                width: 10.w,
                                child: Text(
                                  ':',
                                  // 'Observer',
                                  style: TextStyle(fontSize: 15.sp,),
                                ),
                              ),
                              Container(
                                width: 140.w,
                                child: Text(
                                  '30-08-1998',
                                  // 'Observer',
                                  style: TextStyle(fontSize: 15.sp,),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );