import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import '../../Models/api_models/HierarchyModel.dart';
import '../../Models/api_models/HosStudentListModel.dart';

import '../../Models/api_models/hos_listing_api_model.dart';
import '../../Models/api_models/recentlist_model.dart';
import '../../Services/api_services.dart';

class Hierarchcontroller extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxList<Users> hosdata = <Users>[].obs;
  RxList<SendData> recivedStudentData = <SendData>[].obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  void resetData() {
    hosdata.value = [];
    recivedStudentData.value = [];
  }

  Future<void> fetchHierarchyList() async {
    print("--------------here---");
    resetData();
    isLoading.value = true;
    isLoaded.value = false;
    try {
      String acYr =
          Get.find<UserAuthController>().userData.value.academicYear ?? '';
      String scId =
          Get.find<UserAuthController>().userData.value.schoolId ?? '';



      // List<Map<String, dynamic>> classList = [];
      // for (var sub in teacherSubjects) {
      //   classList.add(
      //     {
      //       "class": sub.classs,
      //       "batch": sub.batch,
      //     },
      //   );
      // }

      Map<String, dynamic> resp = await ApiServices.loadHierarchyList(
          schoolId: scId, academicYear: acYr, id: 'role121234', name: 'HOS');

      if (resp['status']['code'] == 200) {
        HierarchyListModel hoslist =
        HierarchyListModel.fromJson(resp);
print("-----------isentStudentData..${resp}-----------");
        hosdata.value= hoslist.data?.details?.response?.users ?? [];


        print(
            "----------hoslista..${hosdata.value.length}-----------");

        isLoaded.value = true;

      }
    } catch (e) {
      isLoaded.value = false;
      print("-----------obs result list error-----------");
    } finally {
      resetStatus();
    }
  }
}
