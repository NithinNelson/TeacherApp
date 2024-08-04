
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/chatClassGroupController.dart';
import 'package:teacherapp/Controller/api_controllers/notificationController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Controller/ui_controllers/page_controller.dart';
import 'package:teacherapp/Models/api_models/leave_req_list_api_model.dart';
import 'package:teacherapp/Services/shared_preferences.dart';
import '../../Models/api_models/hos_listing_api_model.dart';
import '../../Models/api_models/login_api_model.dart';
import '../../Services/api_services.dart';
import '../../Utils/Colors.dart';
import '../../View/CWidgets/TeacherAppPopUps.dart';

class LeaveRequestController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxList<ClassData> classList = <ClassData>[].obs;
  Rx<ClassData> classData = ClassData().obs;
  RxList<StudentsData> studentList = <StudentsData>[].obs;
  RxList<StudentsData> filteredStudentList = <StudentsData>[].obs;
  RxInt currentClassIndex = 0.obs;
  RxString claass = ''.obs;
  RxString batch = ''.obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  void resetData() {
    classList.value = [];
    studentList.value = [];
    currentClassIndex.value = 0;
  }

  Future<void> fetchLeaveReqList() async {
    resetData();
    isLoading.value = true;
    isLoaded.value = false;
    try {
      String usrId = Get.find<UserAuthController>().userData.value.userId ?? '';
      String acYr = Get.find<UserAuthController>().userData.value.academicYear ?? '';
      String scId = Get.find<UserAuthController>().userData.value.schoolId ?? '';
      Map<String, dynamic> resp =
      await ApiServices.getLeaveReqList(schoolId: scId, accYr: acYr, userId: usrId);
      if (resp['status']['code'] == 200) {
        LeaveRequestListApiModel leaveRequestListApiModel = LeaveRequestListApiModel.fromJson(resp);
        classList.value = leaveRequestListApiModel.data?.details ?? [];
        if(classList.value.isNotEmpty) {
          studentList.value = classList.value.first.students ?? [];
          classData.value = classList.value.first;
          filteredStudentList.value = studentList.value;
          claass.value = classList.value.first.className ?? '--';
          batch.value = classList.value.first.batchName ?? '--';
        }
      }
    } catch (e) {
      isLoaded.value = false;
      print("-----------leave req error-----------");
    } finally {
      resetStatus();
    }
  }

  void setStudentList({required ClassData selectedClassData, required int index}) {
    currentClassIndex.value = index;
    studentList.value = selectedClassData.students ?? [];
    classData.value = selectedClassData;
    filteredStudentList.value = studentList.value;
    claass.value = selectedClassData.className ?? '--';
    batch.value = selectedClassData.batchName ?? '--';
  }

  void filterList({required String text}) {
    filteredStudentList.value = studentList.value
        .where((student) => student.name!.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
