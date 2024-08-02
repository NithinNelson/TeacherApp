import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/Colors.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class LeaveRequest extends StatefulWidget {
  const LeaveRequest({super.key});

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height ,
            width: ScreenUtil().screenWidth,
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
                    child: const UserDetails(shoBackgroundColor: false, isWelcome: true, bellicon: true, notificationcount: true,),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20.w, top: 120.h, right: 20.w),
                  // width: 550.w,
                  height: ScreenUtil().screenHeight * 0.8,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.circular(20.r),
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(

                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 30),
                              child: Text(
                                "Leave Request",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),

                          ],
                        ),
                        TextFormField(
                          onChanged: (value) {},
                          validator: (val) => val!.isEmpty ? 'Enter the Topic' : null,
                          cursorColor: Colors.grey,
                          keyboardType: TextInputType.text,
                          decoration:InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "Search Here",
                              prefixIcon: Icon(
                                Icons.search,
                                color:Colors.grey,
                              ),
                              // suffixIcon: GestureDetector(
                              //   onTap: () => onListen(),
                              //   child: AvatarGlow(
                              //     animate: _isListening,
                              //     glowColor: Colors.blue,
                              //     endRadius: 20.0,
                              //     duration: Duration(milliseconds: 2000),
                              //     repeat: true,
                              //     showTwoGlows: true,
                              //     repeatPauseDuration:
                              //         Duration(milliseconds: 100),
                              //     child: Icon(
                              //       _isListening == false
                              //           ? Icons.keyboard_voice_outlined
                              //           : Icons.keyboard_voice_sharp,
                              //       color: ColorUtils.SEARCH_TEXT_COLOR,
                              //     ),
                              //   ),
                              // ),
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.all(

                                  Radius.circular(2.0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(230, 236, 254, 8), width: 1.0),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              fillColor: Colorutils.Whitecolor,
                              filled: true),
                        ),
                        for(int i=0;i<10;i++)
                          _resultlist(context)

                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}
Widget _resultlist(BuildContext context, {


  String? type,
}) =>
    InkWell(
      onTap: () {
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