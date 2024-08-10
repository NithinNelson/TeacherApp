
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/api_controllers/lessonObservationController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Controller/ui_controllers/keyboardController.dart';
import 'package:teacherapp/Services/api_services.dart';
import 'package:teacherapp/Services/check_connectivity.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:teacherapp/View/CWidgets/custom_check_box.dart';
import 'package:teacherapp/View/Learning_Walk/learning_walk_widgets/question_radio_fields.dart';
import '../../Models/api_models/learning_walk_apply_model.dart';
import '../../Utils/Colors.dart';
import '../../sqflite_db/lessonLearnDatabase/lessonLearnDbHelper.dart';
import '../CWidgets/AppBarBackground.dart';
import '../CWidgets/commons.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class LessonObservationApply extends StatefulWidget {
  final String teacherName;
  final String classAndBatch;
  final String subjectName;
  final String topic;
  const LessonObservationApply({
    super.key,
    required this.teacherName,
    required this.classAndBatch,
    required this.subjectName,
    required this.topic,
  });

  @override
  State<LessonObservationApply> createState() => _LessonObservationApplyState();
}

class _LessonObservationApplyState extends State<LessonObservationApply> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _summaryController = TextEditingController();
  TextEditingController _whatWentWellController = TextEditingController();
  TextEditingController _evenBetterIfController = TextEditingController();
  KeyboardController keyboardController = Get.find<KeyboardController>();

  @override
  Widget build(BuildContext context) {
    List<String> nameParts = widget.teacherName.split(" ");
    String? placeholderName;
    try {
      placeholderName = nameParts.length > 1 ? "${nameParts[0].trim().substring(0, 1)}${nameParts[1].trim().substring(0, 1)}".toUpperCase() : nameParts[0].trim().substring(0, 2).toUpperCase();
    } catch(e) {}

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
                        shoBackgroundColor: false, isWelcome: false, bellicon: true, notificationcount: true,),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.w, top: 120.h, right: 10.w, bottom: 20.h),
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    decoration: themeCardDecoration,
                    child: Form(
                      key: _formKey,
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
                                        padding: EdgeInsets.fromLTRB(
                                            20.w, 10.h, 0, 10.h),
                                        child: Text(
                                          'Lesson Observation',
                                          style: TextStyle(
                                              fontSize: 18.h,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.w,
                                            top: 5.h,
                                            right: 20.w,
                                            bottom: 5.h),
                                        child: Container(
                                          // height: 80.h,
                                          // width: 280.w,
                                          decoration: BoxDecoration(
                                              color: Colorutils.userdetailcolor,
                                              borderRadius:
                                              BorderRadius.circular(15).r),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 8.w),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10)
                                                        .w,
                                                    child: Container(
                                                      width: 50.h,
                                                      height: 50.h,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color:
                                                            Color(0xFFD6E4FA)),
                                                        color: Colors.white,
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            100).r,
                                                        child: CachedNetworkImage(
                                                          width: 50.h,
                                                          height: 50.h,
                                                          fit: BoxFit.fill,
                                                          imageUrl: "__",
                                                          errorWidget: (context,
                                                              url, error) =>
                                                              Center(
                                                                child: Text(
                                                                  placeholderName ?? '--',
                                                                  style: TextStyle(
                                                                      color: Color(0xFFB1BFFF),
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                      fontSize: 22.h),
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
                                                        width: 200.w,
                                                        child:
                                                        SingleChildScrollView(
                                                          scrollDirection:
                                                          Axis.horizontal,
                                                          child: Text(
                                                            widget.teacherName,
                                                            style: TextStyle(
                                                                color: const Color(0xffFFFFFF),
                                                                fontSize: 14.h,
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
                                                            widget.classAndBatch,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 13.h,
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
                                                            widget.subjectName,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 13.h,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 200.w,
                                                        child:
                                                        SingleChildScrollView(
                                                          child: Text(
                                                            "Topic: ${widget.topic}",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 13.h,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 8.w),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(25.w, 5.h, 0, 5.h),
                                        child: Text(
                                          'Criteria',
                                          style: TextStyle(
                                              fontSize: 18.h,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      QuestionRadioFields(topicData: widget.topic),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.w,
                                            top: 10.h,
                                            right: 20.w,
                                            bottom: 5.h),
                                        child: TextFormField(
                                          maxLength: 1000,
                                          validator: (val) => val!.isEmpty
                                              ? '  *Fill the Field to Submit'
                                              : null,
                                          controller: _summaryController,
                                          focusNode: keyboardController.summaryFocusNode.value,
                                          decoration: InputDecoration(
                                              hintStyle: const TextStyle(color: Colors.black26),
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 10.h, horizontal: 20.w),
                                              hintText: " Summary  ",

                                              border: OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ).r,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        230, 236, 254, 8),
                                                    width: 1.0),
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(22)).r,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        230, 236, 254, 8),
                                                    width: 1.0),
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(30.0)).r,
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
                                            bottom: 5.h),
                                        child: TextFormField(
                                          controller: _whatWentWellController,
                                          focusNode: keyboardController.whatWentWellFocusNode.value,
                                          maxLength: 1000,
                                          validator: (val) => val!.isEmpty
                                              ? '  *Fill the Field to Submit'
                                              : null,
                                          decoration: InputDecoration(
                                              hintStyle:
                                              const TextStyle(color: Colors.black26),
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 10.h, horizontal: 20.w),
                                              hintText: " What went well   ",

                                              border: OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ).r,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        230, 236, 254, 8),
                                                    width: 1.0),
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(22)).r,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        230, 236, 254, 8),
                                                    width: 1.0),
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(30.0)).r,
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
                                          bottom: 5.h,
                                        ),
                                        child: TextFormField(
                                          maxLength: 1000,
                                          validator: (val) => val!.isEmpty
                                              ? '  *Fill the Field to Submit'
                                              : null,
                                          controller: _evenBetterIfController,
                                          focusNode: keyboardController.evenBetterIfFocusNode.value,
                                          decoration: InputDecoration(
                                              hintStyle:
                                              const TextStyle(color: Colors.black26),
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical: 10.h, horizontal: 20.w),
                                              hintText: " Even better if   ",

                                              border: OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ).r,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        230, 236, 254, 8),
                                                    width: 1.0),
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(22)).r,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        230, 236, 254, 8),
                                                    width: 1.0),
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(30.0)).r,
                                              ),
                                              fillColor: Colorutils.chatcolor
                                                  .withOpacity(0.3),
                                              filled: true),
                                          maxLines: 5,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 10.w),
                                            CustomCheckbox(
                                              onChange: (value) {
                                                setState(() {
                                                  isChecked = !isChecked;
                                                });
                                              },
                                              borderRadius: BorderRadius.circular(3).r,
                                              checkIcon: Icon(Icons.done),
                                              borderColor: Colors.teal,
                                              selectedColor: Colors.teal,
                                              isChecked: isChecked,
                                              size: 23,
                                            ),
                                            // Checkbox(
                                            //   activeColor:
                                            //   Colorutils.userdetailcolor,
                                            //   value: isChecked,
                                            //   onChanged: (value) {
                                            //     setState(() {
                                            //       isChecked = !isChecked;
                                            //     });
                                            //   },
                                            // ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              'Joined Observation',
                                              style: TextStyle(
                                                fontSize: 14.h,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 50.h),
                                      GestureDetector(
                                        onTap: () async {
                                          if(_formKey.currentState!.validate()) {
                                            await submitLessonObs();
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 80.w, right: 80.w),
                                          child: Container(
                                            height: 50.h,
                                            // width: 180.w,
                                            decoration: BoxDecoration(
                                                color: Colorutils.userdetailcolor,
                                                borderRadius: BorderRadius.circular(30).r,
                                            ),
                                            child: Center(
                                                child: Text(
                                                  'SUBMIT',
                                                  style: TextStyle(
                                                      fontSize: 18.h,
                                                      letterSpacing: 1,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GetX<KeyboardController>(
                                        builder: (KeyboardController controller) {
                                          if(controller.summaryFocusNode.value.hasFocus ||
                                          controller.whatWentWellFocusNode.value.hasFocus ||
                                          controller.evenBetterIfFocusNode.value.hasFocus) {
                                            return SizedBox(
                                              height: MediaQuery.of(context).viewInsets.bottom + 50.h,
                                            );
                                          } else {
                                            return SizedBox(
                                              height: 50.h,
                                            );
                                          }
                                        },
                                      ),
                                    ]),
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> submitLessonObs() async {
    context.loaderOverlay.show();
    UserAuthController userAuthController = Get.find<UserAuthController>();
    LessonObservationController lessonObservationController = Get.find<LessonObservationController>();

    LessonLearningApplyModel lessonLearningApplyModel = LessonLearningApplyModel(
        isLesson: true,
      lessonLearning: LessonLearning(
        schoolId: userAuthController.userData.value.schoolId ?? '',
        teacherId: lessonObservationController.selectedTeacher.value?.teacherId ?? '',
        teacherName: lessonObservationController.selectedTeacher.value?.teacherName ?? '',
        observerId: userAuthController.selectedHos.value?.userId ?? userAuthController.userData.value.userId ?? '',
        observerName: userAuthController.selectedHos.value?.hosName ?? userAuthController.userData.value.name ?? '',
        classId: lessonObservationController.selectedClass.value?.classId ?? '',
        classBatchName: "${lessonObservationController.selectedClass.value?.className} ${lessonObservationController.selectedClass.value?.batchName}",
        batchId: lessonObservationController.selectedClass.value?.batchId ?? '',
        topic: widget.topic,
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
        Map<String, dynamic> resp = await ApiServices.lessonWalkSubmit(reqData: lessonLearningApplyModel);
        if(resp['status']['code'] == 200) {
          Get.back();
          TeacherAppPopUps.submitFailed(
            title: "Success",
            message: "Lesson Observation Result Added Successfully",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
          log("------------submit resp-------------$resp");
        } else {
          await LessonLearningDatabase.instance.create(lessonLearningApplyModel);
          Get.back();
          TeacherAppPopUps.submitFailed(
            title: "Success",
            message: "Lesson Observation Result Added Successfully",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
        }
      } catch(e) {
        await LessonLearningDatabase.instance.create(lessonLearningApplyModel);
        Get.back();
        TeacherAppPopUps.submitFailed(
          title: "Success",
          message: "Lesson Observation Result Added Successfully",
          actionName: "Close",
          iconData: Icons.done,
          iconColor: Colors.green,
        );
      }
    } else {
      await LessonLearningDatabase.instance.create(lessonLearningApplyModel);
      Get.back();
      TeacherAppPopUps.submitFailed(
        title: "Success",
        message: "Lesson Observation Result Added Successfully",
        actionName: "Close",
        iconData: Icons.done,
        iconColor: Colors.green,
      );
    }
    context.loaderOverlay.hide();
  }
}
