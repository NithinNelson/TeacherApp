
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import '../../Models/api_models/grouped_view_list_api_model.dart';
import '../../Services/api_services.dart';

class GroupedViewListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxList<RoomData> roomList = <RoomData>[].obs;
  RxInt unreadCount = 0.obs;
  RxString classs = ''.obs;
  RxString batch = ''.obs;
  RxString subjectId = ''.obs;
  Rx<ScrollController> groupedViewScrollController = ScrollController().obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  void resetData() {
    unreadCount.value = 0;
    roomList.value = [];
  }

  void setPayload({required String stdClass, required String stdBatch, required String subId}) {
    classs.value = stdClass;
    batch.value = stdBatch;
    subjectId.value = subId;
  }

  Future<void> fetchGroupedViewList() async {
    resetData();
    isLoading.value = true;
    isLoaded.value = false;
    try {
      String? teacherId = Get.find<UserAuthController>().userData.value.userId;
      String? schoolId = Get.find<UserAuthController>().userData.value.schoolId;
      Map<String, dynamic> resp = await ApiServices.getGroupedViewList(
        batch: batch.value,
        classs: classs.value,
        schoolId: schoolId.toString(),
        subId: subjectId.value,
        teacherId: teacherId.toString(),
      );
      if (resp['status']['code'] == 200) {
        GroupedViewApiModel groupedViewApiModel = GroupedViewApiModel.fromJson(resp);
        // unreadCount.value = classGroupApiModel.data?.unreadCount ?? 0;
        roomList.value = groupedViewApiModel.data?.data ?? [];
      }
    } catch (e) {
      print("------class group error---------");
      isLoaded.value = false;
    } finally {
      resetStatus();
    }
  }

  Future<void> fetchGroupedViewListPeriodically() async {
    try {
      String? teacherId = Get.find<UserAuthController>().userData.value.userId;
      String? schoolId = Get.find<UserAuthController>().userData.value.schoolId;
      Map<String, dynamic> resp = await ApiServices.getGroupedViewList(
        batch: batch.value,
        classs: classs.value,
        schoolId: schoolId.toString(),
        subId: subjectId.value,
        teacherId: teacherId.toString(),
      );
      if (resp['status']['code'] == 200) {
        GroupedViewApiModel groupedViewApiModel = GroupedViewApiModel.fromJson(resp);
        roomList.value = groupedViewApiModel.data?.data ?? [];
      }
    } catch (e) {
      print("------class group error---------");
    } finally {}
  }
}
