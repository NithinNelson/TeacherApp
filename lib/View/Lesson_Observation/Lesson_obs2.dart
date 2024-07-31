import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacherapp/Models/api_models/learning_observation_api_model.dart';
import 'package:teacherapp/View/Learning_Walk/learning_walk_widgets/question_radio_fields.dart';
import '../../Utils/Colors.dart';
import '../../Utils/font_util.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class LessonObservingScreen extends StatefulWidget {

  const LessonObservingScreen({
    super.key,

  });

  @override
  State<LessonObservingScreen> createState() => _LessonObservingScreenState();
}

class _LessonObservingScreenState extends State<LessonObservingScreen> {
  bool isChecked = true;
  String? _selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                        shoBackgroundColor: false, isWelcome: false),
                  ),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   height: 180.w,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //           bottomLeft: Radius.circular(12.w),
                //           bottomRight: Radius.circular(12.w)),
                //       color: Colorutils.userdetailcolor,
                //     ),
                //   ),
                // ),
                // Positioned(
                //   left: 0,
                //   top: 40,
                //   child: SvgPicture.asset(
                //     'assets/images/pencil2.svg',
                //     width: 100.w,
                //     color: Colorutils.Whitecolor.withOpacity(0.1),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                // Positioned(
                //   left: 240,
                //   top: 25,
                //   child: Transform.rotate(
                //     angle: 0.5,
                //     child: SvgPicture.asset(
                //       'assets/images/stars1.svg',
                //       width: 20.w,
                //       color: Colorutils.Whitecolor.withOpacity(0.5),
                //       fit: BoxFit.fitWidth,
                //     ),
                //   ),
                // ),
                // Positioned(
                //   left: 220,
                //   top: 65,
                //   child: SvgPicture.asset(
                //     'assets/images/graduation-cap-icon.svg',
                //     width: 30.w,
                //     color: Colorutils.Whitecolor.withOpacity(0.07),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                // Positioned(
                //   left: 140,
                //   top: 10,
                //   child: SvgPicture.asset(
                //     'assets/images/read-book-icon.svg',
                //     width: 30.w,
                //     color: Colorutils.Whitecolor.withOpacity(0.07),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                // Positioned(
                //   left: 115,
                //   top: 65,
                //   child: SvgPicture.asset(
                //     'assets/images/stars1.svg',
                //     width: 20.w,
                //     color: Colorutils.Whitecolor.withOpacity(0.5),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                // Positioned(
                //   left: 5,
                //   top: 10,
                //   child: SvgPicture.asset(
                //     'assets/images/stars1.svg',
                //     width: 20.w,
                //     color: Colorutils.Whitecolor.withOpacity(0.5),
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                // Positioned(
                //   right: 10,
                //   top: 140,
                //   child: SvgPicture.asset(
                //     'assets/images/stars1.svg',
                //     color: Colorutils.Whitecolor.withOpacity(0.9),
                //     width: 25.w,
                //     fit: BoxFit.fitHeight,
                //   ),
                // ),
                // Positioned(
                //   right: 0,
                //   top: -90,
                //   child: SvgPicture.asset(
                //     'assets/images/pencil3.svg',
                //     color: Colorutils.Whitecolor.withOpacity(0.2),
                //     height: 180.w,
                //     fit: BoxFit.fitHeight,
                //   ),
                // ),
                // Positioned(
                //   left: 0,
                //   top: 0,
                //   child: Padding(
                //       padding: const EdgeInsets.only(
                //           left: 7, right: 10, bottom: 3),
                //       child: Container(
                //         height: 80.w,
                //         width: 330,
                //         decoration: BoxDecoration(
                //           color: Colors.transparent,
                //           borderRadius: BorderRadius.circular(17.0),
                //         ),
                //         child: Row(
                //           children: [
                //             SizedBox(width: 12.w),
                //             Container(
                //               height: 45.w,
                //               width: 45.w,
                //               padding:
                //                   const EdgeInsets.symmetric(horizontal: 9).w,
                //               child: Icon(
                //                 Icons.arrow_back_ios,
                //                 color: Colors.white,
                //               ),
                //             ),
                //             SizedBox(width: 12.w),
                //             Expanded(
                //               child: Column(
                //                 mainAxisSize: MainAxisSize.min,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     'Hello!',
                //                     style: TeacherAppFonts
                //                         .interW400_14sp_textWhiteOp60,
                //                   ),
                //                   SingleChildScrollView(
                //                     scrollDirection: Axis.horizontal,
                //                     child: Row(
                //                       children: [
                //                         Text(
                //                           'Ustaf Fathima Nourin ',
                //                           style: TeacherAppFonts
                //                               .interW600_18sp_textWhite,
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             SizedBox(width: 12.w),
                //             Stack(
                //               children: [
                //                 Padding(
                //                   padding:
                //                       const EdgeInsets.only(right: 5, top: 5)
                //                           .w,
                //                   child: SvgPicture.asset(
                //                     'assets/images/bell 1.svg',
                //                     width: 30.w,
                //                     fit: BoxFit.fitWidth,
                //                   ),
                //                 ),
                //                 Positioned(
                //                   top: 0,
                //                   right: 0,
                //                   child: Container(
                //                     width: 18.w,
                //                     height: 18.w,
                //                     padding: const EdgeInsets.all(2).w,
                //                     decoration: const BoxDecoration(
                //                       shape: BoxShape.circle,
                //                       color: Colorutils.Whitecolor,
                //                     ),
                //                     child: FittedBox(
                //                       child: Text(
                //                         "4",
                //                         style: TeacherAppFonts
                //                             .interW500_11sp_userdetailcolor,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             SizedBox(width: 12.w),
                //             CircleAvatar(
                //               radius: 25.r,
                //               backgroundColor: Colorutils.Whitecolor,
                //               child: CircleAvatar(
                //                 radius: 24.r,
                //                 backgroundImage: AssetImage(
                //                     'assets/images/profile image.png'),
                //               ),
                //             ),
                //             SizedBox(width: 12.w),
                //           ],
                //         ),
                //       )),
                // ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, top: 120.h, right: 10.w),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
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
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            // height: 800.h,
                            child: ListView(
                                padding: const EdgeInsets.all(5),
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        25, 10, 0, 10),
                                    child: Text(
                                      'Learning Walk',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w,
                                        top: 5.h,
                                        right: 20.w,
                                        bottom: 5),
                                    child: Container(
                                      height: 80.h,
                                      width: 280.w,
                                      decoration: BoxDecoration(
                                          color: Colorutils.userdetailcolor,
                                          borderRadius:
                                          BorderRadius.circular(15)),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10)
                                                    .w,
                                                child: Container(
                                                  width: 50.w,
                                                  height: 50.h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color:
                                                        Color(0xFFD6E4FA)),
                                                    color: Colors.white,
                                                    // image: DecorationImage(
                                                    //     image: NetworkImage(widget.teacherImage == ""
                                                    //         ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                                    //         : ApiConstants.IMAGE_BASE_URL +
                                                    //         "${widget.teacherImage}"),
                                                    //     fit: BoxFit.cover),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        100),
                                                    child: CachedNetworkImage(
                                                      width: 50,
                                                      height: 50,
                                                      fit: BoxFit.fill,
                                                      imageUrl: "nhh",
                                                      placeholder:
                                                          (context, url) =>
                                                          Center(
                                                            child: Text(
                                                              'be',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFFB1BFFF),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                      errorWidget: (context,
                                                          url, error) =>
                                                          Center(
                                                            child: Text(
                                                              'be',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFFB1BFFF),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 180.w,
                                                    child:
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                      Axis.horizontal,
                                                      child: Text(
                                                        "Teacherdetails",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffFFFFFF),
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                            FontWeight
                                                                .w400),
                                                      ),
                                                    ),
                                                  ),
                                                  // SizedBox(
                                                  //   height: 2.h,
                                                  // ),
                                                  SizedBox(
                                                    width: 180.w,
                                                    child:
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                      Axis.horizontal,
                                                      child: Text(
                                                        "Teeacher Details",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                            FontWeight
                                                                .w400),
                                                      ),
                                                    ),
                                                  ),
                                                  // SizedBox(
                                                  //   height: 2.h,
                                                  // ),
                                                  Container(
                                                    width: 180.w,
                                                    child:
                                                    SingleChildScrollView(
                                                      child: Text(
                                                        "Teache Details",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                            FontWeight
                                                                .w400),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(25, 5, 0, 5),
                                    child: Text(
                                      'Criteria',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  QuestionRadioFields(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w,
                                        top: 10.h,
                                        right: 20.w,
                                        bottom: 5),
                                    child: TextFormField(
                                      maxLength: 1000,
                                      validator: (val) => val!.isEmpty
                                          ? '  *Fill the Field to Submit'
                                          : null,
                                      decoration: InputDecoration(
                                          hintStyle:
                                          TextStyle(color: Colors.black26),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20.0),
                                          hintText: " Summary  ",
                                          counterText: "00/1000",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    230, 236, 254, 8),
                                                width: 1.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(22)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    230, 236, 254, 8),
                                                width: 1.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0)),
                                          ),
                                          fillColor: Colorutils.chatcolor
                                              .withOpacity(0.3),
                                          filled: true),
                                      maxLines: 5,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w,
                                        top: 5.h,
                                        right: 20.w,
                                        bottom: 5),
                                    child: TextFormField(
                                      maxLength: 1000,
                                      validator: (val) => val!.isEmpty
                                          ? '  *Fill the Field to Submit'
                                          : null,
                                      decoration: InputDecoration(
                                          hintStyle:
                                          TextStyle(color: Colors.black26),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20.0),
                                          hintText: " What went well   ",
                                          counterText: "00/1000",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    230, 236, 254, 8),
                                                width: 1.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(22)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    230, 236, 254, 8),
                                                width: 1.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0)),
                                          ),
                                          fillColor: Colorutils.chatcolor
                                              .withOpacity(0.3),
                                          filled: true),
                                      maxLines: 5,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.w,
                                      top: 5.h,
                                      right: 20.w,
                                    ),
                                    child: TextFormField(
                                      maxLength: 1000,
                                      validator: (val) => val!.isEmpty
                                          ? '  *Fill the Field to Submit'
                                          : null,
                                      decoration: InputDecoration(
                                          hintStyle:
                                          TextStyle(color: Colors.black26),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20.0),
                                          hintText: " Even better if   ",
                                          counterText: "000/1000",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    230, 236, 254, 8),
                                                width: 1.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(22)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    230, 236, 254, 8),
                                                width: 1.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0)),
                                          ),
                                          fillColor: Colorutils.chatcolor
                                              .withOpacity(0.3),
                                          filled: true),
                                      maxLines: 5,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          activeColor:
                                          Colorutils.userdetailcolor,
                                          value: isChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              isChecked = !isChecked;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Joined Observation',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(35, 20, 35, 0),
                                    child: GestureDetector(
                                      onTap: () async {},
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 55, right: 55),
                                        child: Container(
                                          height: 40.h,
                                          // width: 180.w,
                                          decoration: BoxDecoration(
                                              color: Colorutils.userdetailcolor,
                                              borderRadius:
                                              BorderRadius.circular(30)),
                                          child: Center(
                                              child: Text(
                                                'SUBMIT',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}
