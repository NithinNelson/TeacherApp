import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/api_controllers/timeTableController.dart';
import 'package:teacherapp/View/Home_Page/Home_Widgets/my_class.dart';
import '../../Controller/api_controllers/popUpContoller.dart';
import 'Home_Widgets/class_list.dart';
import 'Home_Widgets/subject_list.dart';
import 'Home_Widgets/time_table.dart';
import 'Home_Widgets/topics.dart';
import 'Home_Widgets/user_details.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  TimeTableController timeTableController = Get.find<TimeTableController>();

  @override
  void initState() {


    initialize();
    Get.find<Popupcontoller>().fetchAllStudentDateList();
    print("-------------Arun print-here---");
    super.initState();
  }

  Future<void> initialize() async {
    context.loaderOverlay.show();
    await timeTableController.fetchTimeTable();
    await timeTableController.fetchWorkLoad();
    if(!mounted) return;
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4,right: 4),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const UserDetails(shoBackgroundColor: true, isWelcome: true, bellicon: true, notificationcount: true,),
              GetX<TimeTableController>(
                  builder: (TimeTableController controller) {
                    return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 50).w,
                    children: [
                      if(controller.classTeacherSubjects.isNotEmpty || controller.teacherSubjects.isNotEmpty)
                        MyClass(),
                      ClassList(classTeacherSubjects: controller.classTeacherSubjects.value,),
                      SubjectList(teacherSubjects: controller.teacherSubjects.value),
                      AllTimeTable(todaySubjects: controller.teacherTimeTableToday.value),
                      Topic(todaySubjects: controller.teacherTimeTableToday.value),
                    ],
                  ),
                );
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
