
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';

import '../../Models/api_models/chat_group_api_model.dart';
import '../../Services/api_services.dart';

class ChatClassGroupController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxList<ClassTeacherGroup> classGroupList = <ClassTeacherGroup>[].obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  Future<void> fetchClassGroupList() async {
    isLoading.value = true;
    isLoaded.value = false;
    try {
      String? teacherId = Get.find<UserAuthController>().userData.value.userId;
      Map<String, dynamic> resp = await ApiServices.getClassGroupList(
        teacherId: teacherId.toString(),
      );
      if (resp['status']['code'] == 200) {
        ClassGroupApiModel classGroupApiModel = ClassGroupApiModel.fromJson(resp);
        classGroupList.value = classGroupApiModel.data?.classTeacher ?? [];
        classGroupList.addAll(classGroupApiModel.data?.data ?? []);
      }
    } catch (e) {
      print("------class group error---------");
      isLoaded.value = false;
    } finally {
      resetStatus();
    }
  }
}
