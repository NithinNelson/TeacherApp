import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import '../../Models/api_models/parent_chat_list_api_model.dart';
import '../../Services/api_services.dart';

class ParentChatListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxInt currentTab = 0.obs;
  RxList<Datum> parentChatList = <Datum>[].obs;
  RxList<Datum> parentChatListCopy = <Datum>[].obs;
  RxList<Datum> filteredChatList = <Datum>[].obs;
  RxList<Datum> allParentChatList = <Datum>[].obs;
  RxList<String> allClasses = <String>['All'].obs;
  RxInt unreadCount = 0.obs;
  RxString currentFilterClass = 'All'.obs;
  RxBool searchEnabled = false.obs;
  RxString isTextField = "".obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  void resetData() {
    unreadCount.value = 0;
    currentTab.value = 0;
    allParentChatList.value = [];
    parentChatList.value = [];
    filteredChatList.value = [];
    allClasses.value = [];
  }

  Future<void> fetchParentChatList() async {
    resetData();
    isLoading.value = true;
    isLoaded.value = false;
    try {
      String? teacherId = Get.find<UserAuthController>().userData.value.userId;
      String? email = Get.find<UserAuthController>().userData.value.username;
      Map<String, dynamic> resp = await ApiServices.getParentChatList(
        teacherId: teacherId.toString(),
        teacherEmail: email.toString(),
      );
      if (resp['status']['code'] == 200) {
        ParentChatListApiModel parentChatListApiModel =
            ParentChatListApiModel.fromJson(resp);
        unreadCount.value = parentChatListApiModel.data?.unreadCount ?? 0;
        allParentChatList.value = parentChatListApiModel.data?.data ?? [];
        parentChatListCopy.value = parentChatListApiModel.data?.data ?? [];
        filterByClass('All');
        setClassList();
        setChatList();
        isLoaded.value = true;
      }
    } catch (e) {
      print("------parent chat list error---------");
      isLoaded.value = false;
    } finally {
      resetStatus();
    }
  }

  Future<void> fetchParentChatListPeriodically() async {
    try {
      String? teacherId = Get.find<UserAuthController>().userData.value.userId;
      String? email = Get.find<UserAuthController>().userData.value.username;
      Map<String, dynamic> resp = await ApiServices.getParentChatList(
        teacherId: teacherId.toString(),
        teacherEmail: email.toString(),
      );
      if (resp['status']['code'] == 200) {
        ParentChatListApiModel parentChatListApiModel =
            ParentChatListApiModel.fromJson(resp);
        unreadCount.value = parentChatListApiModel.data?.unreadCount ?? 0;
        allParentChatList.value = parentChatListApiModel.data?.data ?? [];
        parentChatListCopy.value = parentChatListApiModel.data?.data ?? [];
        filterByClass(currentFilterClass.value);
        setClassList();
        setChatList();
      }
    } catch (e) {
      print("------parent chat list error---------");
    } finally {
      resetStatus();
    }
  }

  void setCurrentFilterClass({required String currentClass}) {
    currentFilterClass.value = currentClass;
  }

  void setTab(int index) {
    currentTab.value = index;
    setChatList();
  }

  void setChatList() {
    if (currentTab.value == 0) {
      parentChatList.value = allParentChatList;
    }
    if (currentTab.value == 1) {
      parentChatList.value = [];
      for (var chat in allParentChatList) {
        if (chat.unreadCount != null && chat.unreadCount != "0") {
          parentChatList.add(chat);
        }
      }
    }
  }

  void setClassList() {
    allClasses.value = ['All'];
    Set<String> uniqueClassBatchSet = {};
    for (var chatRoom in allParentChatList) {
      uniqueClassBatchSet.add("${chatRoom.datumClass}${chatRoom.batch}");
    }
    allClasses.addAll(uniqueClassBatchSet.toList());
  }

  void filterByClass(String classBatch) {
    filteredChatList.value = [];
    if (classBatch == 'All') {
      filteredChatList.value = allParentChatList;
    } else {
      for (var chatRoom in allParentChatList) {
        if (classBatch == "${chatRoom.datumClass}${chatRoom.batch}") {
          filteredChatList.add(chatRoom);
        }
      }
    }
  }

  void filterGroupList({required String text}) {
    parentChatList.value = parentChatListCopy.value
        .where((chat) =>
            chat.studentName!.toUpperCase().contains(text.toUpperCase()))
        .toList();
  }

  void filterParentList({required String text}) {
    filteredChatList.value = allParentChatList.value
        .where((parent) =>
            parent.parentName!.toUpperCase().contains(text.toUpperCase()))
        .toList();
  }
}
