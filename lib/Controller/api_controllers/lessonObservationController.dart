import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';

import '../../Models/api_models/learning_observation_api_model.dart';
import '../../Services/api_services.dart';

class LessonObservationController extends GetxController {
  RxList<TeacherData> teacherNameList = <TeacherData>[].obs;
  RxList<TeacherDetails> teacherDataList = <TeacherDetails>[].obs;
  RxList<SubjectDetail> teacherClassList = <SubjectDetail>[].obs;

  Future<void> fetchLessonObservation() async {
    teacherDataList.value = [];
    try {
      String? userId = Get.find<UserAuthController>().userData.value.userId;
      String? acYr = Get.find<UserAuthController>().userData.value.academicYear;
      Map<String, dynamic> resp = await ApiServices.getLeadership(
          userId: userId.toString(),
          academicYear: acYr.toString(),
          hosStatus: true);
      LessonObservationData lessonObservationModel =
          LessonObservationData.fromJson(resp);
      if (resp['status']['code'] == 200) {
        teacherNameList.value =
            lessonObservationModel.data?.details?.response ?? [];
        // teacherClassList.value= lessonObservationModel.data!.details!.response[0].details[0].subjectDetails ;
      }
    } catch (e) {
      print("-----------lesson obs error--------------");
    } finally {}
  }

  Future<void> getTeacherData({required String teacherName}) async {
    try {
      for (var teacher in teacherNameList) {
        if (teacher.teacherName == teacherName) {
          teacherDataList.value = teacher.details;
        }
      }
    } catch (e) {}
  }

  Future<void> getTeacherClassData({required String classAndBatch}) async {
    try {
      for (var classes in teacherDataList) {
        if ("${classes.className} ${classes.batchName}" == classAndBatch) {
          teacherClassList.value = classes.subjectDetails;
        }
      }
    } catch (e) {}
  }
}
