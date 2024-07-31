
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/Colors.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class LessonObservingScreen extends StatefulWidget {
  const LessonObservingScreen({super.key});

  @override
  State<LessonObservingScreen> createState() => _LessonObservingScreenState();
}

class _LessonObservingScreenState extends State<LessonObservingScreen> {
  get questionData => null;

  get isChecked => null;

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
                    child: const UserDetails(shoBackgroundColor: false, isWelcome: false),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 20.w, top: 120.h, right: 20.w),
                  // width: 550.w,
                  // height: 600.h,
                  // height: ScreenUtil().screenHeight * 0.8,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r), ),
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
                  child: ListView(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.fromLTRB(30, 20, 0, 0),
                          child: Text(
                            'Lesson Observation',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //     left: 35.w,
                        //     top: 20.h,
                        //     right: 35.w,
                        //   ),
                        //   child: Container(
                        //     padding: EdgeInsets.only(bottom: 20),
                        //     // height: 131.h,
                        //     width: 280.w,
                        //     decoration: BoxDecoration(
                        //         color: Color(0xff18C7C7),
                        //         borderRadius: BorderRadius.circular(20)),
                        //     child: Column(
                        //       children: [
                        //         SizedBox(
                        //           height: 30,
                        //         ),
                        //         Padding(
                        //           padding: EdgeInsets.only(left: 20.w),
                        //           child: Row(
                        //             children: [
                        //               Container(
                        //                 width: 50.w,
                        //                 height: 50.h,
                        //                 decoration: BoxDecoration(
                        //                   shape: BoxShape.circle,
                        //                   border: Border.all(
                        //                       color: Color(0xFFD6E4FA)),
                        //                   color: Colors.white,
                        //                   // image: DecorationImage(
                        //                   //     image: NetworkImage(widget.teacherImage == ""
                        //                   //         ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                        //                   //         : ApiConstants.IMAGE_BASE_URL +
                        //                   //         "${widget.teacherImage}"),
                        //                   //     fit: BoxFit.cover),
                        //                 ),
                        //                 child: ClipRRect(
                        //                   borderRadius:
                        //                       BorderRadius.circular(100),
                        //                   child: CachedNetworkImage(
                        //                     width: 50,
                        //                     height: 50,
                        //                     fit: BoxFit.fill,
                        //                     imageUrl: "",
                        //                     placeholder: (context, url) =>
                        //                         Center(
                        //                       child: Text(
                        //                         'ben',
                        //                         style: TextStyle(
                        //                             color:
                        //                                 Color(0xFFB1BFFF),
                        //                             fontWeight:
                        //                                 FontWeight.bold,
                        //                             fontSize: 20),
                        //                       ),
                        //                     ),
                        //                     errorWidget:
                        //                         (context, url, error) =>
                        //                             Center(
                        //                       child: Text(
                        //                         'benxx',
                        //                         style: TextStyle(
                        //                             color:
                        //                                 Color(0xFFB1BFFF),
                        //                             fontWeight:
                        //                                 FontWeight.bold,
                        //                             fontSize: 20),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding:
                        //                     EdgeInsets.only(left: 10.w),
                        //                 child: Container(
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: [
                        //                       Container(
                        //                         width: 200.w,
                        //                         child: Text(
                        //                           'nhhdh',
                        //                           style: TextStyle(
                        //                               color:
                        //                                   Color(0xffFFFFFF),
                        //                               fontSize: 15.sp,
                        //                               fontWeight:
                        //                                   FontWeight.w400),
                        //                         ),
                        //                       ),
                        //                       SizedBox(
                        //                         height: 2.h,
                        //                       ),
                        //                       Text(
                        //                         "bnsdnhd",
                        //                         style: TextStyle(
                        //                             color: Colors
                        //                                 .indigoAccent[100],
                        //                             fontSize: 14.sp,
                        //                             fontWeight:
                        //                                 FontWeight.w400),
                        //                       ),
                        //                       SizedBox(
                        //                         height: 2.h,
                        //                       ),
                        //                       Container(
                        //                         width: 200.w,
                        //                         child: Text(
                        //                           "sddasdjk",
                        //                           style: TextStyle(
                        //                               color:
                        //                                   Colors.blueGrey,
                        //                               fontSize: 14.sp,
                        //                               fontWeight:
                        //                                   FontWeight.w400),
                        //                         ),
                        //                       ),
                        //                       SizedBox(
                        //                         height: 2.h,
                        //                       ),
                        //                       Container(
                        //                         width: 200.w,
                        //                         child: Text(
                        //                           "",
                        //                           style: TextStyle(
                        //                               color:
                        //                                   Colors.blueGrey,
                        //                               fontSize: 14.sp,
                        //                               fontWeight:
                        //                                   FontWeight.w400),
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 65, top: 15),
                        //   child: Text(
                        //     'Criteria',
                        //     style: TextStyle(
                        //         fontSize: 15, fontWeight: FontWeight.w600),
                        //   ),
                        // ),
                        // Column(
                        //   children: [
                        //     for (int i = 0;
                        //         i < questionData!['list'].length;
                        //         i++)
                        //       Expanded(
                        //         flex: 0,
                        //         child: Padding(
                        //           padding: const EdgeInsets.fromLTRB(
                        //               35, 20, 30, 0),
                        //           child: Container(
                        //             // height: 275.w,
                        //             decoration: BoxDecoration(
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                     color: Colors.black26,
                        //                     blurRadius: 1),
                        //               ],
                        //               borderRadius:
                        //                   BorderRadius.circular(30),
                        //               color: Colors.white,
                        //             ),
                        //             child: FormField(
                        //               // validator: (value) {
                        //               //   //print(value);
                        //               //   if (value != true) {
                        //               //     isvalid = false;
                        //               //     print(
                        //               //         'isvalid lesson= false $isvalid');
                        //               //     return null;
                        //               //   } else {
                        //               //     isvalid = true;
                        //               //     print(
                        //               //         'isvalid lesson= true $isvalid');
                        //               //   }
                        //               //   // return null;
                        //               // },
                        //               builder:
                        //                   (FormFieldState<bool> state) =>
                        //                       Column(
                        //                 children: [
                        //                   Padding(
                        //                     padding: EdgeInsets.only(
                        //                       left: 20.w,
                        //                       top: 15.h,
                        //                       bottom: 20.h,
                        //                     ),
                        //                     child: Row(
                        //                       children: [
                        //                         Container(
                        //                           height: 20.h,
                        //                           width: 20.h,
                        //                           decoration: BoxDecoration(
                        //                             color: Colors.black,
                        //                             borderRadius:
                        //                                 BorderRadius
                        //                                     .circular(100),
                        //                           ),
                        //                           child: Center(
                        //                               child: Text(
                        //                             (i + 1).toString(),
                        //                             style: TextStyle(
                        //                                 color:
                        //                                     Colors.white),
                        //                           )),
                        //                         ),
                        //                         SizedBox(
                        //                           width: 8.w,
                        //                         ),
                        //                         Container(
                        //                           width: 255.w,
                        //                           child: Text(
                        //                               questionData!['list']
                        //                                   [i]['indicator']),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ),
                        //                   Row(
                        //                     children: [
                        //                       Padding(
                        //                         padding: EdgeInsets.only(
                        //                             left: 12.w,
                        //                             right: 10.w),
                        //                         child: Container(
                        //                           // height: 200.h,
                        //                           width: 135.w,
                        //                           decoration: BoxDecoration(
                        //                             borderRadius:
                        //                                 BorderRadius
                        //                                     .circular(24),
                        //                             color: Color(0xffFEE68B)
                        //                                 .withOpacity(0.2),
                        //                           ),
                        //                           child: Padding(
                        //                             padding:
                        //                                 EdgeInsets.only(
                        //                                     top: 15.h),
                        //                             child: Column(
                        //                               children: [
                        //                                 Row(
                        //                                   children: [
                        //                                     Theme(
                        //                                       data: ThemeData(
                        //                                           unselectedWidgetColor:
                        //                                               Colors
                        //                                                   .red[700]),
                        //                                       child: Radio(
                        //                                         value: 0,
                        //                                         groupValue:
                        //                                             questionData!['list'][i]
                        //                                                 [
                        //                                                 'values'],
                        //                                         onChanged:
                        //                                             (Object?
                        //                                                 value) {
                        //                                           setState(
                        //                                               () {
                        //                                             print(
                        //                                                 'radio1--------------------->$value');
                        //                                             questionData!['list'][i]['values'] =
                        //                                                 value!;
                        //                                           });
                        //                                           state.setValue(
                        //                                               true);
                        //                                         },
                        //                                         activeColor:
                        //                                             Colors.red[
                        //                                                 700],
                        //                                       ),
                        //                                     ),
                        //                                     const Text(
                        //                                         "N/A")
                        //                                   ],
                        //                                 ),
                        //                                 Row(
                        //                                   children: [
                        //                                     Theme(
                        //                                       data: ThemeData(
                        //                                           unselectedWidgetColor:
                        //                                               Colors
                        //                                                   .yellow[900]),
                        //                                       child: Radio(
                        //                                         value: 3,
                        //                                         groupValue:
                        //                                             questionData!['list'][i]
                        //                                                 [
                        //                                                 'values'],
                        //                                         onChanged:
                        //                                             (Object?
                        //                                                 value) {
                        //                                           setState(
                        //                                               () {
                        //                                             print(
                        //                                                 'radio2--------------------->$value');
                        //                                             questionData!['list'][i]['values'] =
                        //                                                 value!;
                        //                                           });
                        //                                           state.setValue(
                        //                                               true);
                        //                                         },
                        //                                         activeColor:
                        //                                             Colors.yellow[
                        //                                                 900],
                        //                                       ),
                        //                                     ),
                        //                                     const Text(
                        //                                         "Weak")
                        //                                   ],
                        //                                 ),
                        //                                 Row(
                        //                                   children: [
                        //                                     Theme(
                        //                                       data: ThemeData(
                        //                                           unselectedWidgetColor:
                        //                                               Colors
                        //                                                   .yellow[700]),
                        //                                       child: Radio(
                        //                                         value: 5,
                        //                                         groupValue:
                        //                                             questionData!['list'][i]
                        //                                                 [
                        //                                                 'values'],
                        //                                         onChanged:
                        //                                             (Object?
                        //                                                 value) {
                        //                                           setState(
                        //                                               () {
                        //                                             print(
                        //                                                 'radio3--------------------->$value');
                        //                                             questionData!['list'][i]['values'] =
                        //                                                 value!;
                        //                                           });
                        //                                           state.setValue(
                        //                                               true);
                        //                                         },
                        //                                         activeColor:
                        //                                             Colors.yellow[
                        //                                                 700],
                        //                                       ),
                        //                                     ),
                        //                                     const Text(
                        //                                         "Acceptable")
                        //                                   ],
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                           ),
                        //                         ),
                        //                       ),
                        //                       Container(
                        //                         // height: 170.h,
                        //                         width: 135.w,
                        //                         decoration: BoxDecoration(
                        //                           borderRadius:
                        //                               BorderRadius.circular(
                        //                                   24),
                        //                           color: Color(0xff79CF62)
                        //                               .withOpacity(0.2),
                        //                         ),
                        //                         child: Padding(
                        //                           padding: EdgeInsets.only(
                        //                               top: 15.h),
                        //                           child: Column(
                        //                             children: [
                        //                               Row(
                        //                                 children: [
                        //                                   Theme(
                        //                                     data: ThemeData(
                        //                                         unselectedWidgetColor:
                        //                                             Colors
                        //                                                 .green),
                        //                                     child: Radio(
                        //                                       value: 7,
                        //                                       groupValue:
                        //                                           questionData!['list']
                        //                                                   [
                        //                                                   i]
                        //                                               [
                        //                                               'values'],
                        //                                       onChanged:
                        //                                           (Object?
                        //                                               value) {
                        //                                         setState(
                        //                                             () {
                        //                                           print(
                        //                                               'radio4--------------------->$value');
                        //                                           questionData!['list'][i]
                        //                                                   [
                        //                                                   'values'] =
                        //                                               value!;
                        //                                         });
                        //                                         state.setValue(
                        //                                             true);
                        //                                       },
                        //                                       activeColor:
                        //                                           Colors
                        //                                               .green,
                        //                                     ),
                        //                                   ),
                        //                                   const Text("Good")
                        //                                 ],
                        //                               ),
                        //                               Row(
                        //                                 children: [
                        //                                   Theme(
                        //                                     data: ThemeData(
                        //                                         unselectedWidgetColor:
                        //                                             Colors.green[
                        //                                                 700]),
                        //                                     child: Radio(
                        //                                       value: 9,
                        //                                       groupValue:
                        //                                           questionData!['list']
                        //                                                   [
                        //                                                   i]
                        //                                               [
                        //                                               'values'],
                        //                                       onChanged:
                        //                                           (Object?
                        //                                               value) {
                        //                                         setState(
                        //                                             () {
                        //                                           print(
                        //                                               'radio5--------------------->$value');
                        //                                           questionData!['list'][i]
                        //                                                   [
                        //                                                   'values'] =
                        //                                               value!;
                        //                                         });
                        //                                         state.setValue(
                        //                                             true);
                        //                                       },
                        //                                       activeColor:
                        //                                           Colors.green[
                        //                                               700],
                        //                                     ),
                        //                                   ),
                        //                                   const Text(
                        //                                       "Very good")
                        //                                 ],
                        //                               ),
                        //                               Row(
                        //                                 children: [
                        //                                   Theme(
                        //                                     data: ThemeData(
                        //                                         unselectedWidgetColor:
                        //                                             Colors.green[
                        //                                                 900]),
                        //                                     child: Radio(
                        //                                       value: 10,
                        //                                       groupValue:
                        //                                           questionData!['list']
                        //                                                   [
                        //                                                   i]
                        //                                               [
                        //                                               'values'],
                        //                                       onChanged:
                        //                                           (Object?
                        //                                               value) {
                        //                                         setState(
                        //                                             () {
                        //                                           print(
                        //                                               'radio6--------------------->$value');
                        //                                           questionData!['list'][i]
                        //                                                   [
                        //                                                   'values'] =
                        //                                               value!;
                        //                                         });
                        //                                         state.setValue(
                        //                                             true);
                        //                                       },
                        //                                       activeColor:
                        //                                           Colors.green[
                        //                                               900],
                        //                                     ),
                        //                                   ),
                        //                                   const Text(
                        //                                       "Outstanding")
                        //                                 ],
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                   Padding(
                        //                     padding: EdgeInsets.only(
                        //                         left: 25.w, top: 15.h),
                        //                     child: Padding(
                        //                       padding:
                        //                           const EdgeInsets.only(
                        //                               bottom: 10),
                        //                       child: Row(
                        //                         children: [
                        //                           Icon(
                        //                             Icons.info_outline,
                        //                             color: Colors.grey,
                        //                           ),
                        //                           SizedBox(
                        //                             width: 15.w,
                        //                           ),
                        //                           GestureDetector(
                        //                             onTap: () =>
                        //                                 Navigator.push(
                        //                                     context,
                        //                                     MaterialPageRoute(
                        //                                         builder:
                        //                                             (context) =>
                        //                                                 rubrics(
                        //                                                   rubricslessonob: questionData!['list'][i]['rubrix'],
                        //                                                 ))),
                        //                             child: Text(
                        //                               'Rubrics',
                        //                               style: TextStyle(
                        //                                 color: Colors.grey,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                           SizedBox(
                        //                             width: 5.w,
                        //                           ),
                        //                           GestureDetector(
                        //                             onTap: () =>
                        //                                 Navigator.push(
                        //                                     context,
                        //                                     MaterialPageRoute(
                        //                                         builder:
                        //                                             (context) =>
                        //                                                 rubrics(
                        //                                                   rubricslessonob: questionData!['list'][i]['rubrix'],
                        //                                                 ))),
                        //                             child: Icon(
                        //                               Icons
                        //                                   .arrow_forward_ios,
                        //                               size: 12,
                        //                               color: Colors.grey,
                        //                             ),
                        //                           )
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //   ],
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       right: 35.w, left: 35.w, top: 20.h),
                        //   child: TextFormField(
                        //     maxLength: 1000,
                        //     validator: (val) => val!.isEmpty
                        //         ? '  *Fill the Field to Submit'
                        //         : null,
                        //     decoration: InputDecoration(
                        //         hintStyle: TextStyle(color: Colors.black26),
                        //         contentPadding: EdgeInsets.symmetric(
                        //             vertical: 10.0, horizontal: 20.0),
                        //         hintText: " Summary   ",
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(
                        //             Radius.circular(10.0),
                        //           ),
                        //         ),
                        //         enabledBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color:
                        //                   Color.fromRGBO(230, 236, 254, 8),
                        //               width: 1.0),
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(22)),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color:
                        //                   Color.fromRGBO(230, 236, 254, 8),
                        //               width: 1.0),
                        //           borderRadius: BorderRadius.all(
                        //               Radius.circular(30.0)),
                        //         ),
                        //         fillColor: Color.fromRGBO(230, 236, 254, 8),
                        //         filled: true),
                        //     maxLines: 5,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       right: 35.w, left: 35.w, top: 20.h),
                        //   child: TextFormField(
                        //     maxLength: 1000,
                        //     validator: (val) => val!.isEmpty
                        //         ? '  *Fill the Field to Submit'
                        //         : null,
                        //     decoration: InputDecoration(
                        //         hintStyle: TextStyle(color: Colors.black26),
                        //         contentPadding: EdgeInsets.symmetric(
                        //             vertical: 10.0, horizontal: 20.0),
                        //         hintText: " What went well   ",
                        //         counterText: "/1000",
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(
                        //             Radius.circular(10.0),
                        //           ),
                        //         ),
                        //         enabledBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color:
                        //                   Color.fromRGBO(230, 236, 254, 8),
                        //               width: 1.0),
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(22)),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color:
                        //                   Color.fromRGBO(230, 236, 254, 8),
                        //               width: 1.0),
                        //           borderRadius: BorderRadius.all(
                        //               Radius.circular(30.0)),
                        //         ),
                        //         fillColor: Color.fromRGBO(230, 236, 254, 8),
                        //         filled: true),
                        //     maxLines: 5,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       right: 35.w, left: 35.w, top: 20.h),
                        //   child: TextFormField(
                        //     maxLength: 1000,
                        //     validator: (val) => val!.isEmpty
                        //         ? '  *Fill the Field to Submit'
                        //         : null,
                        //     decoration: InputDecoration(
                        //         hintStyle: TextStyle(color: Colors.black26),
                        //         contentPadding: EdgeInsets.symmetric(
                        //             vertical: 10.0, horizontal: 20.0),
                        //         hintText: " Even better if   ",
                        //         counterText: "/1000",
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(
                        //             Radius.circular(10.0),
                        //           ),
                        //         ),
                        //         enabledBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color:
                        //                   Color.fromRGBO(230, 236, 254, 8),
                        //               width: 1.0),
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(22)),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color:
                        //                   Color.fromRGBO(230, 236, 254, 8),
                        //               width: 1.0),
                        //           borderRadius: BorderRadius.all(
                        //               Radius.circular(30.0)),
                        //         ),
                        //         fillColor: Color.fromRGBO(230, 236, 254, 8),
                        //         filled: true),
                        //     maxLines: 5,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                        //   child: Row(
                        //     children: [
                        //       Checkbox(
                        //         value: isChecked,
                        //         onChanged: (value) {
                        //           setState(() {});
                        //         },
                        //       ),
                        //       Text(
                        //         'Joined Observation',
                        //         style: TextStyle(
                        //           fontSize: 12,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.fromLTRB(35, 20, 35, 0),
                        //   child: GestureDetector(
                        //     onTap: () async {},
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(
                        //           left: 55, right: 55),
                        //       child: Container(
                        //         height: 60.h,
                        //         // width: 280.w,
                        //         decoration: BoxDecoration(
                        //             color: Color(0xff42C614),
                        //             borderRadius:
                        //                 BorderRadius.circular(10)),
                        //         child: Center(
                        //             child: Text(
                        //           'Submit',
                        //           style: TextStyle(
                        //               fontSize: 18, color: Colors.white),
                        //         )),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 180.h,
                        // )
                      ]),
                ),
              ],
            ),
          ),
        ));
  }

  rubrics({required rubricslessonob}) {}
}
