import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';

import '../../Models/api_models/hosFullListModel.dart';
import '../../Services/api_services.dart';
import '../../View/CWidgets/TeacherAppPopUps.dart';

class Popupcontoller extends GetxController {

RxBool isLoading = false.obs;
RxBool isLoaded = false.obs;
RxBool isError = false.obs;
RxInt currentTabIndex = 0.obs;
RxList<Datas> recentData = <Datas>[].obs;
RxList<Datas> studentinprogressdata = <Datas>[].obs;
RxList<Datas> studentCompletedData = <Datas>[].obs;


void resetStatus() {
  isLoading.value = false;
  isError.value = false;
}

void resetData() {
  recentData.value = [];
  studentinprogressdata.value = [];
  studentCompletedData.value = [];
}

Future<void> fetchAllStudentDateList({DateTime? date}) async {
  UserAuthController userAuthController = Get.find<UserAuthController>();
  UserRole? userRole = userAuthController.userRole.value;
  print("-------------brinesg print-here---");

  isLoading.value = true;
  isLoaded.value = false;
  try {
    String? selectedDate = DateFormat("yyyy-MM-dd").format(date ?? DateTime.now());
    String acYr =
        Get.find<UserAuthController>().userData.value.academicYear ?? '';
    String scId =
        Get.find<UserAuthController>().userData.value.schoolId ?? '';
    String teacherId =
        Get.find<UserAuthController>().userData.value.userId ?? '';

    Map<String, dynamic> resp = await ApiServices.popupcontoller(
      schoolId: scId, academicYear: acYr, date: selectedDate,);

    if (resp['status']['code'] == 200) {
      HosfullListModel hosfulldata =
      HosfullListModel.fromJson(resp);

      recentData.value = hosfulldata.data?.data?? [];
      isLoaded.value = true;

      for (var sub in recentData.value) {
        if (sub.isprogress ?? true) {
          studentinprogressdata.add(sub);
          print("----------${studentinprogressdata.length}-Studentadadda-----------");
          if(userRole == UserRole.bothTeacherAndLeader || userRole == UserRole.leader)
          (studentinprogressdata.first.status?.length == 1 )?
          TeacherAppPopUps.Trackingpop(
              title: "Student Coming!",
              message:
              "${studentinprogressdata.first.studentName} ,${" from Grade"
                  " "
                  "${studentinprogressdata.first.classs}"
                  " "
                  "${studentinprogressdata.first.batch}"} on way, Sent By ${studentinprogressdata.first..status?.first.sentBy}",
              actionName: "Track",
              iconColor: Colors.green,
              timeText: '', sendername:"${studentinprogressdata.first..studentName}"):
          TeacherAppPopUps.Trackingpoplate(
              title: "Late Alert",
              message:
              "${studentinprogressdata.first.studentName} ${"has not reached yet."}",
              actionName: "Track",
              iconColor: Colors.green,
              timeText: '', sendername: '${studentinprogressdata.first.studentName}');
        } else {
          studentCompletedData.add(sub);


        }
      }
      // print("-----------endorsedclasseslist${endorsedClassesList.value}-----------");
    }
  } catch (e) {
    isLoaded.value = false;
    print("-----------obs result list error-----------");
  } finally {
    resetStatus();
  }
}
}