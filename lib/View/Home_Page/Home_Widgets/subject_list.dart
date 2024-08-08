import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';

import '../../../Controller/api_controllers/userAuthController.dart';
import '../../../Models/api_models/time_table_api_model.dart';
import '../../My_Class/Myclass.dart';
import '../../OldScreens/non_teaching_students.dart';
import '../../OldScreens/teaching_students.dart';


class SubjectList extends StatelessWidget {
  final List<TeacherSubject> teacherSubjects;
  const SubjectList({super.key, required this.teacherSubjects});

  @override
  Widget build(BuildContext context) {
    int itemLength = teacherSubjects.length;
    return Container(
      height: 70.w * (itemLength % 2 == 1 ? ((itemLength - 1)/2) : (itemLength/2)) + (itemLength % 2 == 1 ? 70.w : 0.w),
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8).w,
      child: GridView.builder(

        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemLength,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.w,
          // childAspectRatio: 2.8.w,
          mainAxisExtent: 55.w,
        ),
        itemBuilder: (context, index) {
          List<Color> colors = [
            Colorutils.Subjectcolor1,
            Colorutils.Subjectcolor2,
            Colorutils.Subjectcolor3,
            Colorutils.Subjectcolor4,
          ];
          Color color = colors[index % colors.length];
          List<Color> colors1 = [
            Colorutils.Subjectcolor11,
            Colorutils.Subjectcolor22,
            Colorutils.Subjectcolor33,
            Colorutils.Subjectcolor44,
          ];
          Color color1 = colors1[index % colors.length];
          return GestureDetector(
            onTap: (){
              UserAuthController userAuthController = Get.find<UserAuthController>();
              if(teacherSubjects[index].isClassTeacher == null) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => NonTeacherStudentList(
                  className: "${teacherSubjects[index].classs} ${teacherSubjects[index].batch}",
                  curriculam_id: teacherSubjects[index].curriculumId,
                  session_id: teacherSubjects[index].sessionId,
                  class_id: teacherSubjects[index].classId,
                  batch_id: teacherSubjects[index].batchId,
                  selectedDate: getCurrentDate(),
                  name: userAuthController.userData.value.name,
                  images: userAuthController.userData.value.image,
                  school_id: userAuthController.userData.value.schoolId,
                  academic_year: userAuthController.userData.value.academicYear,
                  userId: userAuthController.userData.value.userId,
                )));
              } else {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentListView(
                  className: "${teacherSubjects[index].classs} ${teacherSubjects[index].batch}",
                  curriculam_id: teacherSubjects[index].curriculumId,
                  session_id: teacherSubjects[index].sessionId,
                  class_id: teacherSubjects[index].classId,
                  batch_id: teacherSubjects[index].batchId,
                  selectedDate: getCurrentDate(),
                  name: userAuthController.userData.value.name,
                  images: userAuthController.userData.value.image,
                  school_id: userAuthController.userData.value.schoolId,
                  academic_year: userAuthController.userData.value.academicYear,
                  userId: userAuthController.userData.value.userId,
                  ClassAndBatch: "${teacherSubjects[index].classs} ${teacherSubjects[index].batch}",
                  subjectName: teacherSubjects[index].sub,
                  LoginedUserEmployeeCode: userAuthController.userData.value.employeeNo,
                )));
              }
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Myclasses()));
            },
            child: Container(
              // height: 60.w,
              padding: const EdgeInsets.symmetric(horizontal: 5).w,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15.0).r,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 45.w,
                    width: 48.w,
                    decoration: BoxDecoration(
                      color:color1,
                      borderRadius: BorderRadius.circular(8.0).r,
                    ),
                    child: Center(
                      child: Text(
                        "${teacherSubjects[index].classs}${teacherSubjects[index].batch}",
                        style: TeacherAppFonts.interW600_16sp_letters1,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    children: [
                      // Container(
                      //   height: 10,
                      //   child: Text("class Teacher",style: TextStyle(fontSize: 8),),
                      // ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                teacherSubjects[index].sub ?? '--',
                                style: TeacherAppFonts.interW500_16sp_letters1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  getCurrentDate() {
    final DateFormat formatter = DateFormat('d-MMMM-y');
    String createDate = formatter.format(DateTime.now());
    return createDate;
  }
}


