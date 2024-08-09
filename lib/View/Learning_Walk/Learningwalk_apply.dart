import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/api_controllers/lessonObservationController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Models/api_models/learning_observation_api_model.dart';
import 'package:teacherapp/Services/api_services.dart';
import 'package:teacherapp/Services/check_connectivity.dart';
import 'package:teacherapp/Services/snackBar.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:teacherapp/View/Learning_Walk/learning_walk_widgets/question_radio_fields.dart';
import '../../Models/api_models/learning_walk_apply_model.dart';
import '../../Utils/Colors.dart';
import '../../Utils/font_util.dart';
import '../../sqflite_db/learningdatabase/learningdbhelper.dart';
import '../../sqflite_db/learningdatabase/learningmodel.dart';
import '../../sqflite_db/lessondatabase/lessondbhelper.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class LessonWalkApply extends StatefulWidget {
  final String teacherName;
  final String classAndBatch;
  final String subjectName;
  const LessonWalkApply({
    super.key,
    required this.teacherName,
    required this.classAndBatch,
    required this.subjectName,
  });

  @override
  State<LessonWalkApply> createState() => _LessonWalkApplyState();
}

class _LessonWalkApplyState extends State<LessonWalkApply> {
  bool isChecked = false;
  String? _selectedValue = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController _summaryController = TextEditingController();
  TextEditingController _whatWentWellController = TextEditingController();
  TextEditingController _evenBetterIfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> nameParts = widget.teacherName.split(" ");
    String placeholderName = nameParts.length > 1 ? "${nameParts[0].trim().substring(0, 1)}${nameParts[1].trim().substring(0, 1)}".toUpperCase() : nameParts[0].trim().substring(0, 2).toUpperCase();

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
                        shoBackgroundColor: false, isWelcome: false, bellicon: true, notificationcount: true,),
                  ),
                ),
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
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
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
                                                          imageUrl: "__",
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Center(
                                                            child: Text(
                                                              placeholderName,
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
                                                            "${widget.teacherName}",
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
                                                            "${widget.classAndBatch}",
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
                                                            "${widget.subjectName}",
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
                                          controller: _summaryController,
                                          decoration: InputDecoration(
                                              hintStyle:
                                                  TextStyle(color: Colors.black26),
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 10.0, horizontal: 20.0),
                                              hintText: " Summary  ",

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
                                          controller: _whatWentWellController,
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
                                          controller: _evenBetterIfController,
                                          decoration: InputDecoration(
                                              hintStyle:
                                                  TextStyle(color: Colors.black26),
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 10.0, horizontal: 20.0),
                                              hintText: " Even better if   ",

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
                                          onTap: () async {
                                            if(_formKey.currentState!.validate()) {
                                              await submitLearningWalk();
                                            }
                                          },
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
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> submitLearningWalk() async {
    context.loaderOverlay.show();
    UserAuthController userAuthController = Get.find<UserAuthController>();
    LessonObservationController lessonObservationController = Get.find<LessonObservationController>();

    LessonLearningApplyModel learningWalkApplyModel = LessonLearningApplyModel(
        isLesson: false,
      lessonLearning: LessonLearning(
        schoolId: userAuthController.userData.value.schoolId ?? '',
        teacherId: lessonObservationController.selectedTeacher.value?.teacherId ?? '',
        teacherName: lessonObservationController.selectedTeacher.value?.teacherName ?? '',
        observerId: userAuthController.selectedHos.value?.userId ?? userAuthController.userData.value.userId ?? '',
        observerName: userAuthController.selectedHos.value?.hosName ?? userAuthController.userData.value.name ?? '',
        classId: lessonObservationController.selectedClass.value?.classId ?? '',
        classBatchName: "${lessonObservationController.selectedClass.value?.className} ${lessonObservationController.selectedClass.value?.batchName}",
        batchId: lessonObservationController.selectedClass.value?.batchId ?? '',
        topic: "No data",
        academicYear: userAuthController.userData.value.academicYear ?? '',
        batchName: lessonObservationController.selectedClass.value?.batchName ?? '',
        className: lessonObservationController.selectedClass.value?.className ?? '',
        subjectName: lessonObservationController.selectedSubject.value?.subjectName ?? '',
        subjectId: lessonObservationController.selectedSubject.value?.subjectId ?? '',
        rollIds: userAuthController.userData.value.allRolesArray ?? [],
        areasForImprovement: [_whatWentWellController.text],
        strengths: [_summaryController.text],
        remedialMeasures: _evenBetterIfController.text,
        upperHierarchy: null,
        sessionId: lessonObservationController.selectedClass.value?.sessionId ?? '',
        curriculumId: lessonObservationController.selectedClass.value?.curriculumId ?? '',
        isJoin: isChecked,
        remarksData: [
          RemarksData(indicators: lessonObservationController.markedIndicators.value),
        ],
      ),
    );

    bool connection = await CheckConnectivity().check();

    if(connection) {
      try {
        Map<String, dynamic> resp = await ApiServices.lessonWalkSubmit(reqData: learningWalkApplyModel);
        if(resp['status']['code'] == 200) {
          Get.back();
          TeacherAppPopUps.submitFailed(
            title: "Success",
            message: "Learning Walk Result Added Successfully",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
          log("------------submit resp-------------$resp");
        } else {
          await LessonDatabase.instance.create(learningWalkApplyModel);
          Get.back();
          TeacherAppPopUps.submitFailed(
            title: "Success",
            message: "Learning Walk Result Added Successfully",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
        }
      } catch(e) {
        await LessonDatabase.instance.create(learningWalkApplyModel);
        Get.back();
        TeacherAppPopUps.submitFailed(
          title: "Success",
          message: "Learning Walk Result Added Successfully",
          actionName: "Close",
          iconData: Icons.done,
          iconColor: Colors.green,
        );
      }
    } else {
      await LessonDatabase.instance.create(learningWalkApplyModel);
      Get.back();
      TeacherAppPopUps.submitFailed(
        title: "Success",
        message: "Learning Walk Result Added Successfully",
        actionName: "Close",
        iconData: Icons.done,
        iconColor: Colors.green,
      );
    }
    context.loaderOverlay.hide();
  }
}
