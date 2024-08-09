
import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/api_controllers/lessonObservationController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Services/api_services.dart';
import 'package:teacherapp/Services/check_connectivity.dart';
import 'package:teacherapp/Services/snackBar.dart';
import 'package:teacherapp/Utils/api_constants.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:teacherapp/View/Learning_Walk/Learning_walk.dart';
import 'package:teacherapp/View/Lesson_Observation/Lesson_Observation.dart';
import '../../Models/api_models/learning_walk_apply_model.dart';
import '../../Utils/Colors.dart';
import '../../Utils/constants.dart';
import '../../sqflite_db/learningdatabase/learningdbhelper.dart';
import '../../sqflite_db/learningdatabase/learningmodel.dart';
import '../../sqflite_db/lessondatabase/lessondbhelper.dart';
import '../../sqflite_db/lessondatabase/lessonmodel.dart';
import '../CWidgets/AppBarBackground.dart';
import '../CWidgets/commons.dart';
import 'Home_Widgets/user_details.dart';
import 'package:http/http.dart' as http;

class Leader extends StatefulWidget {
  const Leader({super.key});

  @override
  State<Leader> createState() => _LeaderState();
}

class _LeaderState extends State<Leader> {
  LessonObservationController lessonObservationController = Get.find<LessonObservationController>();
  List<LessonLearningApplyModel> learningData = [];
  List<LessonLearningApplyModel> lessonData = [];

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    context.loaderOverlay.show();
    await lessonObservationController.fetchLessonObservation();
    await refreshLessLearnData();
    if (!mounted) return;
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    String? hosName = Get.find<UserAuthController>().selectedHos.value?.hosName;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleLight,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Stack(
            children: [
              const AppBarBackground(),
              Positioned(
                left: 0,
                top: 0,
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
                margin: EdgeInsets.only(left: 20.w, top: 140.h, right: 20.w),
                // width: 550.w,
                // height: 545.h,
                // height: ScreenUtil().screenHeight * 0.8,
                decoration: themeCardDecoration,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Leadership',
                                style: TextStyle(
                                    fontSize: 18.h,
                                    fontWeight: FontWeight.w600),
                              ),
                              if(hosName != null)

                                Container(
                                    width: 150.w,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                            "HOS:${hosName}",
                                            style: TextStyle(fontSize: 17.h,fontWeight: FontWeight.bold),
                                          ),

                                        ],
                                      ),
                                    ))

                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, top: 20.h),
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Cannot fetch teacher data')));
                            },
                            child: GestureDetector(
                              onTap: () {

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LessonObservation()));
                              },
                              child: Container(
                                height: 130.h,


                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromRGBO(101, 63, 244, 8),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 65.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.transparent),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 25.w),
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/notebook 1.png')),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.w),
                                      child: Container(
                                          // height:0.h,
                                          child: Text(
                                            "Lesson  \nObservation ",
                                            style: TextStyle(
                                                fontSize: 23.h,
                                                color: Color.fromRGBO(
                                                    240, 236, 254, 8)),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, top: 35.h),
                          child: GestureDetector(
                            onTap: () {
                              Get.find<LessonObservationController>().resetLearningWalkDropdownData();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LearningWalk()));
                            },
                            child: Container(
                              height: 130.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff14C6C6),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 65.h,
                                    width: 85.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.transparent),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 25.w),
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/journalist 1.png' )),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.w),
                                    child: Container(
                                        // height: 50.h,
                                        child: Text(
                                          "Learning  \nWalk",
                                          style: TextStyle(
                                              fontSize: 23.h,
                                              color: Color.fromRGBO(
                                                  240, 236, 254, 8)),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 100.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if(lessonData.isNotEmpty)
                              GestureDetector(
                                onTap: () async {
                                  context.loaderOverlay.show();
                                  if(lessonData.isEmpty){
                                    TeacherAppPopUps.submitFailed(
                                      title: "Message",
                                      message: "No Data to Upload",
                                      actionName: "Ok",
                                      iconData: Icons.info_outline,
                                      iconColor: Colors.yellow.shade900,
                                    );
                                  } else {
                                    await lessonSubmit();
                                  }
                                  context.loaderOverlay.hide();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8).w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color.fromRGBO(0, 136, 170, 8),
                                  ),
                                  // height: 28,
                                  // width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/Synclesson.png",
                                        height: 22.h,
                                        // width: 20,
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        "Sync Lesson",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14.h),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            else
                              SizedBox(height: 24.h),
                            SizedBox(width: 20.w),
                            if(learningData.isNotEmpty)
                              GestureDetector(
                                onTap: () async {
                                  context.loaderOverlay.show();
                                  if(learningData.isEmpty){
                                    print('-----notes1$learningData');
                                    TeacherAppPopUps.submitFailed(
                                      title: "No Data to Upload",
                                      message: "",
                                      actionName: "Ok",
                                      iconData: Icons.info_outline,
                                      iconColor: Colors.yellow.shade900,
                                    );
                                  }else{
                                    print('-----notes$learningData');
                                    await learningSubmit();
                                  }
                                  context.loaderOverlay.hide();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8).w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color.fromRGBO(0, 136, 170, 8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/Synclearning.png",
                                        height: 22.h,
                                        // width: 20,
                                      ),
                                      SizedBox(width: 5.w),
                                      Center(
                                          child: Text(
                                            "Sync Learning",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 14.h),
                                          )),
                                    ],
                                  ),
                                ),
                              )
                            else
                              SizedBox(height: 24.h),
                          ],
                        ),
                        SizedBox(height: 160.h),
                        // const Spacer(),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> refreshLessLearnData() async {
    List<LessonLearningApplyModel> lessLearn = await LessonDatabase.instance.readAllLessonLearn();
    learningData = lessLearn.where((data) => data.isLesson == false).toList();
    lessonData = lessLearn.where((data) => data.isLesson == true).toList();
    setState(() {});
    print('lesson learn db length-------${lessLearn.length}');
  }

  Future<void> lessonSubmit() async {
    bool result = await CheckConnectivity().check();
    if (!result) {
      await snackBar(context: context, message: "No internet connection", color: Colors.red);
    } else {
      for (var data in lessonData) {
        try {
          Map<String, dynamic> resp = await ApiServices.lessonWalkSubmit(reqData: data);
          if(resp['status']['code'] == 200) {
            await LessonDatabase.instance.delete(data.id!);
          } else {
            TeacherAppPopUps.submitFailed(
              title: "Error",
              message: "Failed to sync data.",
              actionName: "Close",
              iconData: Icons.error_outline,
              iconColor: Colors.red.shade900,
            );
            break;
          }
        } on SocketException catch(e) {
          TeacherAppPopUps.submitFailed(
            title: "Error",
            message: "Internet connection is not stable",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
          break;
        } catch(e) {
          TeacherAppPopUps.submitFailed(
            title: "Error",
            message: "Something went wrong",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
          break;
        }
      }
    }
    await refreshLessLearnData().then((_) {
      if(lessonData.isEmpty) {
        TeacherAppPopUps.submitFailed(
          title: "Success",
          message: "Lesson Observation Result Added Successfully",
          actionName: "Close",
          iconData: Icons.done,
          iconColor: Colors.green,
        );
      }
    });
  }

  Future<void> learningSubmit() async {
    bool result = await CheckConnectivity().check();
    if (!result) {
      await snackBar(context: context, message: "No internet connection", color: Colors.red);
    } else {
      for (var data in learningData) {
        try {
          Map<String, dynamic> resp = await ApiServices.lessonWalkSubmit(reqData: data);
          if(resp['status']['code'] == 200) {
            await LessonDatabase.instance.delete(data.id!);
          } else {
            TeacherAppPopUps.submitFailed(
              title: "Error",
              message: "Failed to sync data.",
              actionName: "Close",
              iconData: Icons.error_outline,
              iconColor: Colors.red.shade900,
            );
            break;
          }
        } on SocketException catch(e) {
          TeacherAppPopUps.submitFailed(
            title: "Error",
            message: "Internet connection is not stable",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
          break;
        } catch(e) {
          TeacherAppPopUps.submitFailed(
            title: "Error",
            message: "Something went wrong",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
          break;
        }
      }
    }
    await refreshLessLearnData().then((_) {
      if(learningData.isEmpty) {
        TeacherAppPopUps.submitFailed(
          title: "Success",
          message: "Learning Walk Result Added Successfully",
          actionName: "Close",
          iconData: Icons.done,
          iconColor: Colors.green,
        );
      }
    });
  }
}
