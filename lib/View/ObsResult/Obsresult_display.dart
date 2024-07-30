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

class ObsResultdisplay extends StatefulWidget {
  const ObsResultdisplay({super.key});

  @override
  State<ObsResultdisplay> createState() => _ObsResultdisplayState();
}

class _ObsResultdisplayState extends State<ObsResultdisplay> {
  get isSpinner => null;

  get topic_lesson => null;

  get isjoin => null;



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
                  top: 15,
                  child: Container(
                    // height: 100.w,
                    width: ScreenUtil().screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    child: const UserDetails(
                        shoBackgroundColor: false, isWelcome: false),
                  ),
                ),
                Container(
                  margin:
                  EdgeInsets.only(left: 10.w, top: 120.h, right: 10.w,),
                  width: double.infinity,
                  height:700,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r)),

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
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child:SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5, 0, 15, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Mathematics',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blue[800]),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '-  5B',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blue[800]),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(

                                              width: 230.w,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 60.w,
                                                    child: Text(
                                                      'NAME',
                                                      // 'Observer Name',
                                                      style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 10.w,
                                                    child: Text(
                                                      ':',
                                                      // 'Observer',
                                                      style: TextStyle(fontSize: 14.sp,),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 160.w,
                                                    child: Text(
                                                      'Mohhamad Noufal Azad',
                                                      // 'Observer',
                                                      style: TextStyle(fontSize: 14.sp,),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          // SizedBox(
                                          //   width: 150.w,
                                          // ),

                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(

                                          width: 230.w,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 60.w,
                                                child: Text(
                                                  'DATE',
                                                  // 'Observer Name',
                                                  style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                width: 10.w,
                                                child: Text(
                                                  ':',
                                                  // 'Observer',
                                                  style: TextStyle(fontSize: 14.sp,),
                                                ),
                                              ),
                                              Container(
                                                width: 160.w,
                                                child: Text(
                                                  '30-08-1998',
                                                  // 'Observer',
                                                  style: TextStyle(fontSize: 14.sp,),
                                                ),
                                              ),
                                            ],
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
                                                width: 60.w,
                                                child: Text(
                                                  'TOPIC',
                                                  // 'Observer Name',
                                                  style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                width: 10.w,
                                                child: Text(
                                                  ':',
                                                  // 'Observer',
                                                  style: TextStyle(fontSize: 14.sp,),
                                                ),
                                              ),
                                              Container(
                                                width: 160.w,
                                                child: Text(
                                                  'Arts and Science Eductaion',
                                                  // 'Observer',
                                                  style: TextStyle(fontSize: 14.sp,),
                                                ),
                                              ),
                                            ],
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
                                                width: 60.w,
                                                child: Text(
                                                  'JOINED',
                                                  // 'Observer Name',
                                                  style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.blue),
                                                ),
                                              ),
                                              Container(
                                                width: 10.w,
                                                child: Text(
                                                  ':',
                                                  // 'Observer',
                                                  style: TextStyle(fontSize: 14.sp,color: Colors.blue),
                                                ),
                                              ),
                                              Container(
                                                width: 150.w,
                                                child: Text(
                                                  'NO',
                                                  // 'Observer',
                                                  style: TextStyle(fontSize: 14.sp,color: Colors.blue),
                                                ),
                                              ),
                                            ],
                                          )),



                                      //     ? Row(
                                      //   mainAxisAlignment:
                                      //   MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Type == 'lesson_observation'
                                      //         ? Container(
                                      //       width: 200.w,
                                      //       child: Text(
                                      //         'Topic:${topic_lesson.toString()[0].toUpperCase()}${topic_lesson.toString().substring(1, topic_lesson.toString().length)}',
                                      //         style: TextStyle(
                                      //             fontSize: 16,
                                      //             fontWeight: FontWeight.w600,
                                      //             color: Colors.blueAccent),
                                      //       ),
                                      //     )
                                      //         : Text(''),
                                      //     isjoin != null
                                      //         ? Text(
                                      //       'Joined:${isjoin.toString()[0].toUpperCase()}${isjoin.toString().substring(1, isjoin.toString().length)}',
                                      //       style: TextStyle(
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.w600,
                                      //           color: Colors.blueAccent),
                                      //     )
                                      //         : Text('')
                                      //   ],
                                      // )
                                      //     : Row(
                                      //   mainAxisAlignment: MainAxisAlignment.start,
                                      //   children: [
                                      //     Text(
                                      //       'Joined:${isjoin.toString()[0].toUpperCase()}${isjoin.toString().substring(1, isjoin.toString().length)}',
                                      //       style: TextStyle(
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.w600,
                                      //           color: Colors.blueAccent),
                                      //     )
                                      //   ],
                                      // ),
                                      SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // height: ObservationResultList.length * 110.h,
                                              child: ListView.builder(
                                                physics: NeverScrollableScrollPhysics(),
                                                itemCount: 10,
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (BuildContext context, int index) {
                                                  return _resultlist(index);
                                                },
                                              ),
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border: Border.all(
                                                            color: Colors.grey,width: 0.3),
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(10),
                                                        )),child: Center(child: Text('Score %',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),))),
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border: Border.all(
                                                            color: Colors.grey,width: 0.3),
                                                        borderRadius: BorderRadius.only(
                                                          topRight: Radius.circular(10),
                                                        )),child: Center(child: Text('Rating',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),))),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,

                                              children: [
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border: Border.all(
                                                            color: Colors.grey,width: 0.1)),child: Center(child: Text('100-95',style: TextStyle(fontSize: 12)))),
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border:
                                                        Border.all(color: Colors.grey,width: 0.1)),child: Center(child: Text('Outstanding',style: TextStyle(fontSize: 12)))
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,

                                              children: [
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border: Border.all(
                                                            color: Colors.grey,width: 0.1)),child: Center(child: Text('94-85',style: TextStyle(fontSize: 12)))),
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border:
                                                        Border.all(color: Colors.grey,width: 0.1)),child: Center(child: Text('Very Good',style: TextStyle(fontSize: 12)))
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,

                                              children: [
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border: Border.all(
                                                            color: Colors.grey,width: 0.1)),child: Center(child: Text('84-66',style: TextStyle(fontSize: 12)))),
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border:
                                                        Border.all(color: Colors.grey,width: 0.1)),child: Center(child: Text('Good',style: TextStyle(fontSize: 12)))
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,

                                              children: [
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border: Border.all(
                                                            color: Colors.grey,width: 0.1)),child: Center(child: Text('65-41',style: TextStyle(fontSize: 12)))),
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border:
                                                        Border.all(color: Colors.grey,width: 0.1)),child: Center(child: Text('Acceptable',style: TextStyle(fontSize: 12)))
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,

                                              children: [
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border: Border.all(
                                                            color: Colors.grey,width: 0.1),
                                                        borderRadius: BorderRadius.only(
                                                          bottomLeft: Radius.circular(10),
                                                        )),child: Center(child: Text('40-0',style: TextStyle(fontSize: 12)))),
                                                Container(
                                                    height: 25.h,
                                                    width: 150.w,
                                                    decoration: BoxDecoration(color: Color.fromRGBO(230, 236, 254, 8),
                                                        border: Border.all(
                                                            color: Colors.grey,width: 0.1),
                                                        borderRadius: BorderRadius.only(
                                                          bottomRight:
                                                          Radius.circular(10),
                                                        )),child: Center(child: Text('Weak',style: TextStyle(fontSize: 12)))),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Summary',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                            TextFormField(

                                              readOnly: true,

                                              decoration: InputDecoration(
                                                  hintStyle:
                                                  TextStyle(color: Colors.black26),
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 10.0, horizontal: 20.0),

                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(15.0),
                                                    ),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color.fromRGBO(
                                                            230, 236, 254, 8),
                                                        width: 1.0),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(15)),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color.fromRGBO(
                                                            230, 236, 254, 8),
                                                        width: 1.0),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(15.0)),
                                                  ),
                                                  fillColor: Colorutils.chatcolor
                                                      .withOpacity(0.3),
                                                  filled: true),
                                              maxLines: 5,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text(
                                                'What Went Well',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                            TextFormField(

                                              readOnly: true,

                                              decoration: InputDecoration(
                                                  hintStyle:
                                                  TextStyle(color: Colors.black26),
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 10.0, horizontal: 20.0),

                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(15.0),
                                                    ),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color.fromRGBO(
                                                            230, 236, 254, 8),
                                                        width: 1.0),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(15)),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color.fromRGBO(
                                                            230, 236, 254, 8),
                                                        width: 1.0),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(15.0)),
                                                  ),
                                                  fillColor: Colorutils.chatcolor
                                                      .withOpacity(0.3),
                                                  filled: true),
                                              maxLines: 5,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Even Better If',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                            TextFormField(

                                              readOnly: true,

                                              decoration: InputDecoration(
                                                  hintStyle:
                                                  TextStyle(color: Colors.black26),
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 10.0, horizontal: 20.0),

                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(15.0),
                                                    ),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color.fromRGBO(
                                                            230, 236, 254, 8),
                                                        width: 1.0),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(15)),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color.fromRGBO(
                                                            230, 236, 254, 8),
                                                        width: 1.0),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(15.0)),
                                                  ),
                                                  fillColor: Colorutils.chatcolor
                                                      .withOpacity(0.3),
                                                  filled: true),
                                              maxLines: 5,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                              width: 350.w,
                                              height: 50.h,
                                              decoration: BoxDecoration(color: Colorutils.chatcolor.withOpacity(0.3),borderRadius: BorderRadius.circular(10)),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  Text('Grade : ',style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.bold),),
                                                  // SizedBox(
                                                  //   height: 5.h,
                                                  // ),
                                                  Text('Good 81%',style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w500),),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text(
                                                'Teacher Comment',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),

                                            TextFormField(

                                              maxLength: 1000,

                                              decoration: InputDecoration(
                                                  hintStyle:
                                                  TextStyle(color: Colors.black26),
                                                  contentPadding: EdgeInsets.symmetric(
                                                      vertical: 10.0, horizontal: 20.0),

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
                                                  fillColor: Colors.white,
                                                  filled: true),
                                              maxLines: 5,
                                            ),

//                                                  Focus(
//                                               autofocus: true,
//                                               child: Form(
//                                                 child: TextFormField(
//                                                   maxLength: 500,
//                                                   validator: (val) => val!.isEmpty
//                                                       ? '  *Enter the Reason'
//                                                       : null,
//
// \                                                  cursorColor: Colors.grey,
//                                                   decoration: InputDecoration(
//                                                     border: OutlineInputBorder(
//                                                       borderSide: BorderSide(
//                                                           width: 1,
//                                                           color: Colors.grey),
//                                                       borderRadius:
//                                                       BorderRadius.all(
//                                                         Radius.circular(20),
//                                                       ),
//                                                     ),
//                                                     enabledBorder:
//                                                     OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                             width: 1,
//                                                             color: Colors.grey),
//                                                         borderRadius:
//                                                         BorderRadius
//                                                             .circular(10)),
//                                                     focusedBorder:
//                                                     OutlineInputBorder(
//                                                         borderSide: BorderSide(
//                                                             width: 1,
//                                                             color: Colors.grey),
//                                                         borderRadius:
//                                                         BorderRadius
//                                                             .circular(10)),
//                                                   ),
//                                                   keyboardType: TextInputType.text,
//                                                   maxLines: 5,
//                                                 ),
//                                               ),
//                                             )

                                              SizedBox(
                                                height: 30,
                                              ),

                                                 GestureDetector(
                                              onTap: () {

                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      height: 40.h,
                                                      width: 100.w,
                                                      // width: 220.w,
                                                      decoration: BoxDecoration(
                                                        color: Colorutils.userdetailcolor,
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(10)),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Submit',
                                                          style: TextStyle(
                                                              color: Colors.white),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            )

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }


  Widget _resultlist(
      int index, {
        String? Observation,
        // int? index,
        String? Result,
      }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 100.h,
            width: 350.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Result == 'NA'
                  ? Colors.red[300]
                  : Result == 'Weak'
                  ? Colors.yellow[600]
                  : Result == 'Acceptable'
                  ? Colors.yellow[800]
                  : Result == 'Good'
                  ? Colors.green[300]
                  : Result == 'Very Good'
                  ? Colors.green
                  : Result == 'Outstanding'
                  ? Colors.green[700]
                  : Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // width: 300.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Observation:',
                                style:
                                TextStyle(fontSize: 15.sp, color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                              Container(
                                // width: 350.w,
                                child: Text(
                                  'y of exit or entrance : a road, path, channel, or course by which something passes. Special ships clear passages through the ice. nasal passages. b. : a corridor or lobby giving access to the different rooms or parts of a building or apartment.',
                                  // 'Observation:',
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                          width: 240.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Result:',
                                // 'Result:',
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.black,fontWeight:FontWeight.bold ),
                              ),
                              Text(
                                'Good',
                                // 'Result:',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  // color: Result == 'NA'
                                  //     ? Colors.red[300]
                                  //     : Result == 'Weak'
                                  //         ? Colors.yellow[700]
                                  //         : Result == 'Acceptable'
                                  //             ? Colors.yellow[400]
                                  //             : Result == 'Good'
                                  //                 ? Colors.green[200]
                                  //                 : Result == 'Very Good'
                                  //                     ? Colors.green[400]
                                  //                     : Result ==
                                  //                             'Outstanding'
                                  //                         ? Colors.green[600]
                                  //                         : Colors.blue[50]
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      );
  String _percentage(percent){
    if(percent.toString().contains('.')){
      if(percent.toString().length>5){
        return '${percent.toString().split('.').first}.${percent.toString().split('.').last.substring(0,2)}%';
      }else{
        return '${percent.toString()}%';
      }
    }else{
      return '${percent.toString()}%';
    }
  }
}