import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/api_controllers/lessonObservationController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
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
import '../../sqflite_db/lessondatabase/lessonmodel.dart';
import '../CWidgets/AppBarBackground.dart';
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
                                        'Lesson Observation',
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
                                        // height: 80.h,
                                        width: 280.w,
                                        decoration: BoxDecoration(
                                            color: Colorutils.userdetailcolor,
                                            borderRadius:
                                            BorderRadius.circular(15)),
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
                                                    ),
                                                    Container(
                                                      width: 200.w,
                                                      child:
                                                      SingleChildScrollView(
                                                        child: Text(
                                                          "Topic: ${widget.topic}",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 14.sp,
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
                                      const EdgeInsets.fromLTRB(25, 5, 0, 5),
                                      child: Text(
                                        'Criteria',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    QuestionRadioFields(topicData: widget.topic),
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
              ],
            ),
          ),
        ));
  }

  Future<void> submitLearningWalk() async {
    context.loaderOverlay.show();
    UserAuthController userAuthController = Get.find<UserAuthController>();
    LessonObservationController lessonObservationController = Get.find<LessonObservationController>();

    LearningWalkApplyModel learningWalkApplyModel = LearningWalkApplyModel(
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
    );

    bool connection = await CheckConnectivity().check();

    if(connection) {
      try {
        Map<String, dynamic> resp = await ApiServices.learningWalkSubmit(reqData: learningWalkApplyModel);
        if(resp['status']['code'] == 200) {
          submitFailed(
            title: "Success",
            message: "Lesson Observation Result Added Successfully",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
          log("------------submit resp-------------$resp");
        } else {
          await saveNote(learning: learningWalkApplyModel);
          submitFailed(
            title: "Success",
            message: "Lesson Observation Result Added Successfully",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
        }
      } catch(e) {
        await saveNote(learning: learningWalkApplyModel);
        submitFailed(
          title: "Success",
          message: "Lesson Observation Result Added Successfully",
          actionName: "Close",
          iconData: Icons.done,
          iconColor: Colors.green,
        );
        // snackBar(context: context, message: "Something went wrong", color: Colors.red);
      }
    } else {
      await saveNote(learning: learningWalkApplyModel);
      submitFailed(
        title: "Success",
        message: "Lesson Observation Result Added Successfully",
        actionName: "Close",
        iconData: Icons.done,
        iconColor: Colors.green,
      );
      // snackBar(context: context, message: "No internet connection", color: Colors.red);
    }
    context.loaderOverlay.hide();
  }

  Future<void> saveNote({required LearningWalkApplyModel learning}) async {
    Lesson Lnote = Lesson(
      teachername: learning.teacherName,
      observername: learning.observerName,
      academicyear: learning.academicYear,
      topic: learning.topic,
      areas_for_improvement: learning.areasForImprovement,
      remedial_measures: learning.remedialMeasures,
      role_ids: json.encode([
        for(int i = 0; i < learning.rollIds.length; i++)
          learning.rollIds[i].toJson()
      ]),
      batchid: learning.batchId,
      classid: learning.classId,
      classname: learning.className,
      curriculum_id: learning.curriculumId,
      isJoin: learning.isJoin.toString(),
      observerid: learning.observerId,
      schoolid: learning.schoolId,
      session_id: learning.sessionId,
      strengths: learning.strengths,
      subjectid: learning.subjectId,
      subjectname: learning.subjectName,
      teacherid: learning.teacherId,
      upper_hierarchy: learning.upperHierarchy,
      tempnam: json.encode(learning.remarksData.first.toJson()),
    );
    await LessonDatabase.instance.create(Lnote);
  }

  static submitFailed({
    required String title,
    required String message,
    required String actionName,
    required IconData iconData,
    required Color iconColor,
  }) {
    return Get.dialog(
      AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Column(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 50.w,
            ),
            SizedBox(height: 10.w),
            Text(
              title,
              style: TeacherAppFonts.interW600_18sp_textWhite.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.sp),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colorutils.letters1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  actionName,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
