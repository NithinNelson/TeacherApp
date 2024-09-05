import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import '../../Models/api_models/chat_group_api_model.dart';
import '../../Services/api_services.dart';

class ChatClassGroupController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxBool searchEnabled = false.obs;
  var currentChatTab = 0.obs;
  RxList<ClassTeacherGroup> classGroupList = <ClassTeacherGroup>[].obs;
  RxList<ClassTeacherGroup> classGroupListCopy = <ClassTeacherGroup>[].obs;
  RxInt unreadCount = 0.obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  void resetData() {
    unreadCount.value = 0;
    classGroupList.value = [];
  }

  Future<void> fetchClassGroupList() async {
    // resetData();
    isLoading.value = true;
    isLoaded.value = false;
    try {
      String? teacherId = Get.find<UserAuthController>().userData.value.userId;
      String? emailId = Get.find<UserAuthController>().userData.value.username;
      Map<String, dynamic> resp = await ApiServices.getClassGroupList(
        teacherId: teacherId.toString(),
        emailId: emailId.toString(),
      );
      if (resp['status']['code'] == 200) {
        ClassGroupApiModel classGroupApiModel =
            ClassGroupApiModel.fromJson(resp);
        unreadCount.value = classGroupApiModel.data?.unreadCount ?? 0;
        classGroupList.value = classGroupApiModel.data?.classTeacher ?? [];
        classGroupListCopy.value = classGroupApiModel.data?.classTeacher ?? [];
        // classGroupList.addAll(classGroupApiModel.data?.data ?? []);
        classGroupListCopy.addAll(classGroupApiModel.data?.data ?? []);
      }
    } catch (e) {
      print("------class group error--------- $e");
      isLoaded.value = false;
    } finally {
      resetStatus();
    }
  }

  Future<void> fetchClassGroupListPeriodically() async {
    try {
      String? teacherId = Get.find<UserAuthController>().userData.value.userId;
      String? emailId = Get.find<UserAuthController>().userData.value.username;
      Map<String, dynamic> resp = await ApiServices.getClassGroupList(
        teacherId: teacherId.toString(),
        emailId: emailId.toString(),
      );
      if (resp['status']['code'] == 200) {
        ClassGroupApiModel classGroupApiModel =
            ClassGroupApiModel.fromJson(resp);
        unreadCount.value = classGroupApiModel.data?.unreadCount ?? 0;
        classGroupList.value = classGroupApiModel.data?.classTeacher ?? [];
        classGroupListCopy.value = classGroupApiModel.data?.classTeacher ?? [];
        // classGroupList.addAll(classGroupApiModel.data?.data ?? []);
        classGroupListCopy.addAll(classGroupApiModel.data?.data ?? []);
      }
    } catch (e) {
      print("------class group error---------");
    } finally {}
  }

  void setCurrentChatTab(int index) {
    currentChatTab.value = index;
  }

  void filterGroupList({required String text}) {
    classGroupList.value = classGroupListCopy.value
        .where((chat) =>
            chat.subjectName!.toUpperCase().contains(text.toUpperCase()))
        .toList();
  }
}
