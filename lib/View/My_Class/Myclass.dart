import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:badges/badges.dart' as badges;
import '../../Utils/Colors.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class Myclasses extends StatefulWidget {
  const Myclasses({super.key});

  @override
  State<Myclasses> createState() => _MyclassesState();
}

class _MyclassesState extends State<Myclasses> {
  get isSpinner => null;
  bool status = false;
  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          width: 300,
          color: Colors.white,
          child: Center(
            child: Text('Bottom Sheet Content'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height ,
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
                  margin: EdgeInsets.only(
                    left: 10.w,
                    top: 120.h,
                    right: 10.w,
                  ),
                  height: ScreenUtil().screenHeight,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r)),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10,right: 20),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "10 A Biology",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 20.w,
                                        height: 20.h,
                                        child: SvgPicture.asset(
                                          'assets/images/studentCalender.svg',color: Colorutils.userdetailcolor,)),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    SizedBox(
                                      child: Text('30-08-1997'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.w, right: 15.w),
                          child: TextFormField(
                            onChanged: (value) {},
                            validator: (val) =>
                            val!.isEmpty ? 'Enter the Topic' : null,
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey),
                                hintText: "Search Here",
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colorutils.userdetailcolor,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2.0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colorutils.chatcolor,
                                      width: 1.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colorutils.chatcolor,
                                      width: 1.0),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.0)),
                                ),
                                fillColor: Colorutils.chatcolor.withOpacity(0.15),
                                filled: true),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 30),
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 50.w),
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      margin: EdgeInsets.only(left: 15.w,top: 10),
                                      child: SwipeTo(
                                        onRightSwipe: (details) {
                                          _showBottomSheet(context);
                                        },
                                        child: Column(
                                          children: [
                                            Theme(
                                              data: ThemeData().copyWith(
                                                  dividerColor:
                                                  Colors.transparent),
                                              child: Row(
                                                children: [
                                                  badges.Badge(
                                                    position:
                                                    badges.BadgePosition
                                                        .bottomEnd(
                                                        end: 0,
                                                        bottom: -5),
                                                    badgeContent: Text(
                                                      "${index + 1}",
                                                      style: TextStyle(
                                                          color: Colorutils.userdetailcolor),
                                                    ),
                                                    badgeStyle:
                                                    badges.BadgeStyle(
                                                      elevation: 0,
                                                      badgeColor: Colorutils.chatcolor,
                                                    ),
                                                    child: Container(
                                                        width: 60.w,
                                                        height: 60.h,
                                                        decoration:
                                                        BoxDecoration(
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xFFD6E4FA)),
                                                          shape:
                                                          BoxShape.circle,
                                                          // image: DecorationImage(
                                                          //     image: NetworkImage( afterAttendanceTaken != null
                                                          //         ? (afterAttendanceTaken[index]["feeDetails"]["image"] ==
                                                          //                 "avathar"
                                                          //             ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                                          //             :_searchController.text.isNotEmpty
                                                          //         ? ApiConstants.IMAGE_BASE_URL + newResult[index]["feeDetails"]["image"].replaceAll('"', '') : ApiConstants
                                                          //                     .IMAGE_BASE_URL +
                                                          //                 afterAttendanceTaken[index]
                                                          //                         ["feeDetails"][
                                                          //                     "image"].replaceAll('"', ''))
                                                          //         : (ourStudentList[index]["image"].replaceAll('"', '') ==
                                                          //                 null
                                                          //             ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                                          //             : _searchController.text.isNotEmpty
                                                          //         ? ApiConstants.IMAGE_BASE_URL + newResult[index]["image"].replaceAll('"', '') : ApiConstants
                                                          //                     .IMAGE_BASE_URL +
                                                          //                 ourStudentList[index]
                                                          //                     ["image"].replaceAll('"', ''))),
                                                          //     fit: BoxFit.fill),
                                                        ),
                                                        child: ClipRRect(

                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              100),
                                                          child:
                                                          CachedNetworkImage(
                                                            width: 50,
                                                            height: 50,
                                                            fit: BoxFit.fill,
                                                            imageUrl: "A",
                                                            errorWidget:
                                                                (context, url,
                                                                error) =>
                                                                Center(
                                                                  child: Text(
                                                                    'A'
                                                                    // '${ourStudentList[index]["username"].split(' ')[1].toString()[0]}'
                                                                    ,
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFFB1BFFF),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                        fontSize:
                                                                        20),
                                                                  ),
                                                                ),
                                                          ),
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Container(
                                                          width: 200.w,
                                                          child:
                                                          SingleChildScrollView(
                                                            scrollDirection:
                                                            Axis.horizontal,
                                                            child: Text(
                                                                "Mohhamad Noufal Azad",
                                                                overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                                style: GoogleFonts.spaceGrotesk(
                                                                    textStyle: TextStyle(
                                                                        fontSize: 16
                                                                            .sp,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                        FontWeight.bold))),
                                                          )),
                                                      SizedBox(
                                                        height: 6.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              "AED :",
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "900.00",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .red,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 15.w,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        child: FlutterSwitch(
                                                            width: 80.w,
                                                            height: 40.h,
                                                            valueFontSize: 16.sp,
                                                            toggleSize: 35.h,
                                                            toggleBorder:
                                                            Border.all(
                                                                color: Color(
                                                                    0xFFD6E4FA),
                                                                width: 2),
                                                            activeText: "  P",
                                                            inactiveText: "  A  ",
                                                            value: status,
                                                            borderRadius: 30.0,
                                                            padding: 0,
                                                            activeColor: Colors.green,
                                                            inactiveColor:
                                                            Colors.red,
                                                            inactiveTextColor:
                                                            Colors.white,
                                                            activeTextColor:
                                                            Colors.white,
                                                            showOnOff: true,
                                                            onToggle: (val) {
                                                              setState(() {
                                                                status = val;
                                                              });
                                                            }),
                                                      ),
                                                      SizedBox(height: 20,),
                                                      GestureDetector(
                                                          onTap: () async {
                                                            showDialog(
                                                                context: context,
                                                                builder: (BuildContext
                                                                context) =>
                                                                    AlertDialog(
                                                                        backgroundColor:
                                                                        Colors.blue[
                                                                        50],
                                                                        title:
                                                                        Container(
                                                                          decoration:
                                                                          BoxDecoration(
                                                                            borderRadius:
                                                                            BorderRadius.all(Radius.circular(50)),
                                                                          ),
                                                                          child:
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  SizedBox(
                                                                                    width: 80,
                                                                                  ),
                                                                                  Text(
                                                                                    'Remarks',
                                                                                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 45,
                                                                                  ),
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Container(
                                                                                      height: 35,
                                                                                      width: 35,
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), border: Border.all(color: Colors.black)),
                                                                                      child: Icon(
                                                                                        Icons.close_rounded,
                                                                                        size: 25,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height:
                                                                                10.h,
                                                                              ),
                                                                              Text(
                                                                                "gjzgs",
                                                                                style:
                                                                                TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500,color: Colors.red),
                                                                              ),
                                                                              SizedBox(
                                                                                height:
                                                                                10.h,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )));
                                                          },
                                                          child: Container(
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .remove_red_eye_outlined,
                                                                    size: 18,
                                                                  ),
                                                                  Text(
                                                                    'Late',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                        color:
                                                                        Colors.red,
                                                                        fontSize:
                                                                        15.sp),
                                                                  ),
                                                                ],
                                                              ))
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: EdgeInsets.only(
                                            //       left: 10.w,
                                            //       top: 15.h,
                                            //       bottom: 8.h),
                                            //   child: Row(
                                            //     children: [
                                            //       SizedBox(
                                            //         width: 2870.w,
                                            //       ),
                                            //       GestureDetector(
                                            //           onTap: () async {
                                            //             showDialog(
                                            //                 context: context,
                                            //                 builder: (BuildContext
                                            //                         context) =>
                                            //                     AlertDialog(
                                            //                         backgroundColor:
                                            //                             Colors.blue[
                                            //                                 50],
                                            //                         title:
                                            //                             Container(
                                            //                           decoration:
                                            //                               BoxDecoration(
                                            //                             borderRadius:
                                            //                                 BorderRadius.all(Radius.circular(50)),
                                            //                           ),
                                            //                           child:
                                            //                               Column(
                                            //                             crossAxisAlignment:
                                            //                                 CrossAxisAlignment.start,
                                            //                             children: [
                                            //                               Row(
                                            //                                 children: [
                                            //                                   SizedBox(
                                            //                                     width: 80,
                                            //                                   ),
                                            //                                   Text(
                                            //                                     'Remarks',
                                            //                                     style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
                                            //                                   ),
                                            //                                   SizedBox(
                                            //                                     width: 45,
                                            //                                   ),
                                            //                                   GestureDetector(
                                            //                                     onTap: () {
                                            //                                       Navigator.pop(context);
                                            //                                     },
                                            //                                     child: Container(
                                            //                                       height: 35,
                                            //                                       width: 35,
                                            //                                       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), border: Border.all(color: Colors.black)),
                                            //                                       child: Icon(
                                            //                                         Icons.close_rounded,
                                            //                                         size: 25,
                                            //                                       ),
                                            //                                     ),
                                            //                                   ),
                                            //                                 ],
                                            //                               ),
                                            //                               SizedBox(
                                            //                                 height:
                                            //                                     10.h,
                                            //                               ),
                                            //                               Text(
                                            //                                 "gjzgs",
                                            //                                 style:
                                            //                                     TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500,color: Colors.red),
                                            //                               ),
                                            //                               SizedBox(
                                            //                                 height:
                                            //                                     10.h,
                                            //                               ),
                                            //                             ],
                                            //                           ),
                                            //                         )));
                                            //           },
                                            //           child: Container(
                                            //               child: Row(
                                            //             children: [
                                            //               Icon(
                                            //                 Icons
                                            //                     .remove_red_eye_outlined,
                                            //                 size: 18,
                                            //               ),
                                            //               Text(
                                            //                 'Late',
                                            //                 style: TextStyle(
                                            //                     fontWeight:
                                            //                         FontWeight
                                            //                             .w900,
                                            //                     color:
                                            //                         Colors.red,
                                            //                     fontSize:
                                            //                         15.sp),
                                            //               ),
                                            //             ],
                                            //           ))
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                            const Divider(
                                              indent: 10,
                                              endIndent: 10,
                                              thickness: 0.2,
                                            )
                                          ],
                                        ),
                                      ));
                                },
                              ),
                            )
                        ),


                      ])),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50.w,
            width: 200.w,
            child: FloatingActionButton(

              onPressed: () {

              },
              child:Text(
                'SUBMIT',
                style: GoogleFonts.inter(
                    fontSize: 15,color: Colorutils.chatcolor

                ),
              ),
              backgroundColor:Colorutils.userdetailcolor,
              elevation: 10,
              shape: RoundedRectangleBorder(


                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
