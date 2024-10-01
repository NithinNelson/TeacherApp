import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/api_controllers/leaveRequestController.dart';
import 'package:teacherapp/Models/api_models/chat_feed_view_model.dart';
import 'package:teacherapp/View/Leave_Page/leave_apply.dart';

import '../../Models/api_models/leave_req_list_api_model.dart';
import '../../Utils/Colors.dart';
import '../../Utils/constants.dart';
import '../../Utils/font_util.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class LeaveRequest extends StatefulWidget {
  const LeaveRequest({super.key});

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  LeaveRequestController leaveRequestController =
      Get.find<LeaveRequestController>();
  TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;
  late bool selected;

  @override
  void initState() {
    initialize();
    _searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Future<void> initialize() async {
    context.loaderOverlay.show();
    await leaveRequestController.fetchLeaveReqList();
    if (!mounted) return;
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleLight,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: ScreenUtil().screenWidth,
            child: Stack(
              children: [
                const AppBarBackground(),
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
                      shoBackgroundColor: false,
                      isWelcome: true,
                      bellicon: true,
                      notificationcount: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10.w,
                    top: 120.h,
                    right: 10.w,
                  ),
                  // width: 550.w,
                  // height: ScreenUtil().screenHeight ,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ).r,

                    boxShadow: [
                      BoxShadow(
                        color: Colorutils.userdetailcolor.withOpacity(0.2),
                        // Shadow color
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // Shadow position
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Leave Request',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    // Text(
                                    //   'My Class',
                                    //   style: TextStyle(
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 15.sp,
                                    //       color: Colors.black),
                                    // ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Container(
                                      height: 60.h,
                                      width: 150.w,
                                      child: GetX<LeaveRequestController>(
                                        builder: (LeaveRequestController
                                            controller) {
                                          List<ClassData> classlist =
                                              controller.classList.value;
                                          classlist.sort((a, b) =>
                                              "${a.className!}${a.batchName!}"
                                                  .compareTo(
                                                      "${b.className!}${b.batchName!}"));
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: classlist.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    SingleChildScrollView(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            print(
                                                                "object----------------------------------");
                                                            _currentIndex =
                                                                index;
                                                            controller.setStudentList(
                                                                selectedClassData:
                                                                    classlist[
                                                                        index],
                                                                index: index);
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 50.w,
                                                          height: 50.h,
                                                          decoration:
                                                              BoxDecoration(
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.1),
                                                                  spreadRadius:
                                                                      1,
                                                                  blurRadius: 1,
                                                                  offset:
                                                                      Offset(
                                                                          0, 1),
                                                                ),
                                                              ],
                                                                  color: _currentIndex == index
                                                                      ? Colorutils
                                                                          .bottomnaviconcolor
                                                                      : Colors
                                                                          .grey
                                                                          .shade200,
                                                                  // color: controller.currentClassIndex.value == index ? Colors.green : Colors.red,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              50.r))),
                                                          child: Center(
                                                            child: Text(
                                                              "${classlist[index].className}"
                                                              "${classlist[index].batchName}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20.sp,
                                                                  color: _currentIndex ==
                                                                          index
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20.w),
                          Container(
                            margin: EdgeInsets.only(left: 15.w, right: 15.w),
                            child: TextFormField(
                              controller: _searchController,
                              onChanged: (value) {
                                leaveRequestController.filterList(text: value);
                              },
                              cursorColor: Colors.grey,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.grey),
                                  hintText: "Search Student Name or Adm.No",
                                  prefixIcon: const Icon(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                  fillColor:
                                      Colorutils.chatcolor.withOpacity(0.15),
                                  filled: true),
                            ),
                          ),
                          SizedBox(height: 20.w),
                          GetX<LeaveRequestController>(
                            builder: (LeaveRequestController controller) {
                              List<StudentsData> studentList =
                                  controller.filteredStudentList;
                              // studentList.sort((a, b) => a.name!.compareTo(b.name!),);

                              if (studentList.isNotEmpty) {
                                return Container(
                                  height: ScreenUtil().screenHeight * 0.7,
                                  child: SingleChildScrollView(
                                    padding: EdgeInsets.only(
                                            bottom: View.of(context)
                                                    .viewInsets
                                                    .bottom +
                                                150)
                                        .w,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        for (int i = 0;
                                            i < studentList.length;
                                            i++)
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LeaveApply(
                                                    studentsData:
                                                        studentList[i],
                                                    claas:
                                                        controller.claass.value,
                                                    batch:
                                                        controller.batch.value,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  left: 15,
                                                  right: 15,
                                                  bottom: 5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colorutils.chatcolor
                                                        .withOpacity(0.05),
                                                    border: Border.all(
                                                        color: Colorutils
                                                            .chatcolor)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8,
                                                      vertical: 8),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 50.w,
                                                        height: 50.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color: Colorutils
                                                                  .chatcolor),
                                                        ),
                                                        child: Center(
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: "--",
                                                            placeholder:
                                                                (context,
                                                                        url) =>
                                                                    Text(
                                                              studentList[i]
                                                                      .name
                                                                      ?.substring(
                                                                          0,
                                                                          1) ??
                                                                  '',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFFB1BFFF),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20),
                                                            ),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Text(
                                                              studentList[i]
                                                                      .name
                                                                      ?.substring(
                                                                          0,
                                                                          1) ??
                                                                  '',
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
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 250.w,
                                                              child: Text(
                                                                studentList[i]
                                                                        .name
                                                                        ?.toUpperCase() ??
                                                                    '--',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 250.w,
                                                              child: Text(
                                                                "Adm. No. : ${studentList[i].admissionNumber ?? '--'}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  height: ScreenUtil().screenHeight * 0.7,
                                  child: Container(
                                    height: 250.h,
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/nodata.gif"),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

String capitalizeFirstLetterOfEachWord(String input) {
  return input
      .trim()
      .split(' ')
      .where((word) => word.isNotEmpty) // Filter out empty strings
      .map((word) {
    print("$input...........input..............");
    String removeSpace = word.trim();
    print("$removeSpace...........removeSpace..............");
    return removeSpace[0].toUpperCase() + removeSpace.substring(1);
  }).join(' ');
}
