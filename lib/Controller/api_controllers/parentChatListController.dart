
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
  RxList<Datum> filteredChatList = <Datum>[].obs;
  RxList<Datum> allParentChatList = <Datum>[].obs;
  RxList<String> allClasses = <String>['All'].obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  Future<void> fetchParentChatList() async {
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
        ParentChatListApiModel parentChatListApiModel = ParentChatListApiModel.fromJson(resp);
        allParentChatList.value = parentChatListApiModel.data?.data ?? [];
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

  void setTab(int index) {
    currentTab.value = index;
    setChatList();
  }

  void setChatList() {
    if(currentTab.value == 0) {
      parentChatList.value = allParentChatList;
    }
    if(currentTab.value == 1) {
      parentChatList.value = [];
      for (var chat in allParentChatList) {
        if(chat.unreadCount != null && chat.unreadCount != "0") {
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
    if(classBatch == 'All') {
      filteredChatList.value = allParentChatList;
    } else {
      for (var chatRoom in allParentChatList) {
        if(classBatch == "${chatRoom.datumClass}${chatRoom.batch}") {
          filteredChatList.add(chatRoom);
        }
      }
    }
  }
}
