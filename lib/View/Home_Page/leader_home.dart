
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/api_controllers/lessonObservationController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Services/snackBar.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:teacherapp/View/Learning_Walk/Learning_walk.dart';
import 'package:teacherapp/View/Lesson_Observation/Lesson_Observation.dart';
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
  List<Note>? notes;
  List<Lesson>? not;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    context.loaderOverlay.show();
    await lessonObservationController.fetchLessonObservation();
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
                            GestureDetector(
                              onTap: () {
                                refreshNote().then((_) {
                                  print('-----not$not');
                                  if(not!.isEmpty){
                                    TeacherAppPopUps.submitFailed(
                                      title: "No Data to \nUpload",
                                      message: "",
                                      actionName: "Ok",
                                      iconData: Icons.info_outline,
                                      iconColor: Colors.yellow,
                                    );
                                  }else{
                                    //refreshNotes().then((_) {
                                    SubmitRequestLesson();
                                    // });
                                  }
                                });
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
                            ),
                            SizedBox(width: 20.w),
                            GestureDetector(
                              onTap: () {
                                refreshNotes().then((_) {
                                  // print('-----notes$notes');
                                  if(notes!.isEmpty){
                                    print('-----notes1$notes');
                                    TeacherAppPopUps.submitFailed(
                                        title: "No Data to \nUpload",
                                        message: "",
                                        actionName: "Ok",
                                        iconData: Icons.info_outline,
                                        iconColor: Colors.yellow,
                                    );
                                  }else{
                                    print('-----notes$notes');
                                    //refreshNotes().then((_) {
                                    SubmitRequest();
                                    // });
                                  }
                                });
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
                            ),
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

  Future refreshNotes() async {
    this.notes = await NotesDatabase.instance.readAllNotes();
    print('learning walk db length------->${notes!.length}');
    //print(notes!.first.teachername);
  }

  Future refreshNote() async {
    this.not = await LessonDatabase.instance.readAllNotes();
    print('lesson obs db length-------${not!.length}');
    // print(not!.first.teachername);
  }

  SubmitRequest() async {
    // setState(() {
    //   isSpinner = true;
    // });
    var result = await Connectivity().checkConnectivity();
    if (result.contains(ConnectivityResult.none)) {
      await snackBar(context: context, message: "No internet connection", color: Colors.red);
      // _checkInternet(context);
      // setState(() {
      //   isSpinner = false;
      // });
    } else {
      // setState(() {
      //   isSpinner = true;
      // });
      for (var learninglist = 0; learninglist < notes!.length; learninglist++) {
        // isSpinner = true;
        var url = Uri.parse("https://teamsqa3000.educore.guru/v2/learning_walk/submit_evaluation");
        var header = {
          "x-auth-token": "tq355lY3MJyd8Uj2ySzm",
          "Content-Type": "application/json",
        };
        //var areaof  = json.decode(notes[learninglist].area);
        //var strenghtof = json.decode(notes[learninglist].strength);
        final bdy = jsonEncode({
          "school_id": notes![learninglist].schoolid,
          "teacher_id": notes![learninglist].teacherid,
          "teacher_name": notes![learninglist].teachername,
          "observer_id": notes![learninglist].observerid,
          "observer_name": notes![learninglist].observername,
          "subject_id": notes![learninglist].subjectid,
          "subject_name": notes![learninglist].subjectname,
          "class_id": notes![learninglist].classid,
          "batch_id": notes![learninglist].batchid,
          "class_batch_name": notes![learninglist].classname,
          "academic_year": notes![learninglist].academicyear,
          "areas_for_improvement": notes![learninglist].area,
          "strengths": notes![learninglist].strength,
          "remedial_measures": notes![learninglist].suggested,
          "roll_ids": notes![learninglist].rol_ids,
          "upper_hierrarchy": notes![learninglist].upper_hierrarchy,
          "curriculum_id": notes![learninglist].curriculum_id,
          "isJoin": notes![learninglist].isJoin,
          "session_id": notes![learninglist].session_id,
          "remarks_data": [
            {"Indicators": jsonDecode(notes![learninglist].tempname.toString())}
          ]
        });
        var jsonresponse = await http.post(url, headers: header, body: bdy);
        print(bdy);
        if (jsonresponse.statusCode == 200) {
          // isSpinner = false;
        } else {
          // isSpinner = false;
        }
      }
      // isSpinner = true;
      setState(() {
        // isSpinner = false;
        TeacherAppPopUps.submitFailed(
          title: "Success",
          message: "Learning Walk Result Added Successfully",
          actionName: "Close",
          iconData: Icons.done,
          iconColor: Colors.green,
        );
      });
    }
  }

  SubmitRequestLesson() async {
    // setState(() {
    //   isSpinner = true;
    // });
    var result = await Connectivity().checkConnectivity();
    if (result.contains(ConnectivityResult.none)) {
      snackBar(context: context, message: "No internet connection", color: Colors.red);
    } else {
      // isSpinner = true;
      for (var lessonlist = 0; lessonlist < not!.length; lessonlist++) {
        // isSpinner = true;
        var url = Uri.parse("https://teamsqa3000.educore.guru/v2/lesson_observation/submit_evaluation");
        // var lessonstrengt = json.decode(not[lessonlist].areas_for_improvement);
        // var lessonarea = json.decode(not[lessonlist].strengths);
        final bdy = jsonEncode({
          "school_id": not![lessonlist].schoolid,
          "teacher_id": not![lessonlist].teacherid,
          "teacher_name": not![lessonlist].teachername,
          "observer_id": not![lessonlist].observerid,
          "observer_name": not![lessonlist].observername,
          "subject_id": not![lessonlist].subjectid,
          "class_id": not![lessonlist].classid,
          "class_batch_name": not![lessonlist].classname,
          "batch_id": not![lessonlist].batchid,
          "topic": not![lessonlist].topic,
          "academic_year": not![lessonlist].academicyear,
          "areas_for_improvement": not![lessonlist].areas_for_improvement,
          "subject_name": not![lessonlist].subjectname,
          "remedial_measures": not![lessonlist].remedial_measures,
          "strengths": not![lessonlist].strengths,
          //"roll_ids": jsonDecode(not[lessonlist].role_ids.toString()),
          "roll_ids": not![lessonlist].role_ids,
          "upper_hierarchy": not![lessonlist].upper_hierarchy,
          "session_id": not![lessonlist].session_id,
          "curriculum_id": not![lessonlist].curriculum_id,
          "isJoin": not![lessonlist].isJoin,

          "remarks_data": [
            {"Indicators": jsonDecode(not![lessonlist].tempnam.toString())},
          ]
        });
        var header = {
          "x-auth-token": "tq355lY3MJyd8Uj2ySzm",
          "Content-Type": "application/json",
        };
        print(bdy);
        var jsonresponse = await http.post(
          url,
          headers: header,
          body: bdy,
        );
        print(jsonresponse.body);
        if (jsonresponse.statusCode == 200) {
          // isSpinner = false;
          // var response = await SubmitLesson.fromJson(jsonDecode(
          //   jsonresponse.body,
          // ));
        } else {
          // isSpinner = false;
        }
      }
      TeacherAppPopUps.submitFailed(
        title: "Success",
        message: "Lesson Observation Result Added Successfully",
        actionName: "Close",
        iconData: Icons.done,
        iconColor: Colors.green,
      );
      // _submitedSuccessfully(context);
      // setState(() {
      //   // isSpinner = false;
      // });
    }
  }
}
