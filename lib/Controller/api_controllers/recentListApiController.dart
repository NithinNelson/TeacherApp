import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import '../../Models/api_models/obs_result_api_model.dart';
import '../../Models/api_models/recentlist_model.dart';
import '../../Services/api_services.dart';
import 'leaveRequestController.dart';

class RecentListApiController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
   RxList<EndorsedClass> endorsedClassesList = <EndorsedClass>[].obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  void resetData() {}

  Future<void> fetchRecentList() async {
    resetData();
    isLoading.value = true;
    isLoaded.value = false;
    try {
      String acYr = Get.find<UserAuthController>().userData.value.academicYear ?? '';
      String scId = Get.find<UserAuthController>().userData.value.schoolId ?? '';
      List<EndorsedClass> classList = (Get.find<RecentListApiController>().endorsedClassesList);

      print("----------classlist..........$classList-----------");


      Map<String, dynamic> resp = await ApiServices.getRecentList(schoolId: scId, academicYear: acYr, endorsedClass:classList);


      print("-----------endorsedclasseslist?${endorsedClassesList.value}-----------");



      if (resp['status']['code'] == 200) {
        RecentTrackingModel recentTrackingModel =RecentTrackingModel.fromJson(resp);

        endorsedClassesList.value = recentTrackingModel.endorsedClass?? [];
        isLoaded.value = true;
        print("-----------endorsedclasseslist${endorsedClassesList.value}-----------");
      }
    } catch (e) {
      isLoaded.value = false;
      print("-----------obs result list error-----------");
    } finally {
      resetStatus();
    }
  }
}