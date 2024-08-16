import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:teacherapp/Services/api_services.dart';
import '../../Models/api_models/chat_feed_view_model.dart';

class GroupedViewController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxList<MsgData> chatMsgList = <MsgData>[].obs;
  late Rx<AutoScrollController> chatGroupedViewScrollController;

  Rx<FocusNode> focusNode = FocusNode().obs;
  String? lastMessageId;

  late int chatMsgCount;
  int messageCount = 30;
  bool showScrollIcon = true;
  int? previousMessageListLenght;
  RxBool showLoaderMoreMessage = true.obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  void resetData() {
    isLoading.value = false;
    isError.value = false;
    isLoaded.value = false;
    chatMsgList.value = [];
  }

  Future<void> fetchFeedViewMsgList(ChatFeedViewReqModel reqBody) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> resp =
          await ApiServices.getChatFeedView(reqBodyData: reqBody);

      print("-----------grouped view ewsp-------------$resp");
      if (resp['status']['code'] == 200) {
        ChatFeedViewModel chatFeedData = ChatFeedViewModel.fromJson(resp);
        chatMsgList.value = chatFeedData.data?.data ?? [];
        if (chatMsgList.isNotEmpty) {
          chatMsgList.add(chatMsgList[chatMsgList.length - 1]);
          print("Chat list -- worked----------------- ${chatMsgList.length}");
        }

        update();
        // chatMsgList.sort((a, b) {
        //   DateTime dateA = DateTime.parse(a.sendAt!);
        //   DateTime dateB = DateTime.parse(b.sendAt!);
        //   return dateA.compareTo(dateB);
        // });
      }
      isLoaded.value = true;
    } catch (e) {
      isLoaded.value = false;
      print('--------grouped view error--------');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchFeedViewMsgListPeriodically(
      ChatFeedViewReqModel reqBody) async {
    // ChatFeedViewModel? chatFeedData;
    try {
      Map<String, dynamic> resp =
          await ApiServices.getChatFeedView(reqBodyData: reqBody);
      if (resp['status']['code'] == 200) {
        ChatFeedViewModel chatFeedData = ChatFeedViewModel.fromJson(resp);
        chatMsgList.value = chatFeedData.data?.data ?? [];
        print("message number = chat list lenth = ${chatMsgList.length}");
        if (chatMsgList.isNotEmpty) {
          chatMsgList.add(chatMsgList[chatMsgList.length - 1]);
          print("Chat list -- worked----------------- ${chatMsgList.length}");
        }

        update();
      }
    } catch (e) {
      print('--------grouped view error--------');
    } finally {}
    // MsgData? lastMsg = chatFeedData?.data?.data?.first;
    // String? newLastMessageId =
    //     "${lastMsg?.messageId}${lastMsg?.messageFromId}${lastMsg?.sendAt}";

    // if (lastMessageId == null || newLastMessageId != lastMessageId) {
    //   lastMessageId = newLastMessageId;
    //   chatMsgList.value = chatFeedData?.data?.data ?? [];
    //   // chatMsgList.sort((a, b) {
    //   //   DateTime dateA = DateTime.parse(a.sendAt!);
    //   //   DateTime dateB = DateTime.parse(b.sendAt!);
    //   //   return dateA.compareTo(dateB);
    //   // });
    //   // Future.delayed(
    //   //   const Duration(milliseconds: 50),
    //   //   () {
    //   //     chatGroupedViewScrollController.value.animateTo(
    //   //       chatGroupedViewScrollController.value.position.maxScrollExtent,
    //   //       duration: const Duration(milliseconds: 200),
    //   //       curve: Curves.easeOut,
    //   //     );
    //   //   },
    //   // );
    // }
  }

  Future<int?> findMessageIndex({
    required ChatFeedViewReqModel reqBody,
    required int? msgId,
  }) async {
    print(reqBody.limit);
    // chatMsgCount = 1000;
    await fetchFeedViewMsgListPeriodically(reqBody);
    print(chatMsgList.length);
    print("message number = lenth = ${chatMsgList.length}");
    for (int i = 0; i < chatMsgList.length; i++) {
      MsgData element = chatMsgList[i];
      print("message number = i = ${element.messageId}");
      if (element.messageId == msgId.toString()) {
        print("message number = i = $i");

        return i;
      }
    }
    return null;
  }

  void fetchMoreMessage({required ChatFeedViewReqModel reqBody}) async {
    ChatFeedViewModel? chatFeedData;
    ChatFeedViewReqModel chatFeedViewReqModel = ChatFeedViewReqModel(
      teacherId: reqBody.teacherId,
      schoolId: reqBody.schoolId,
      classs: reqBody.classs,
      batch: reqBody.batch,
      subjectId: reqBody.subjectId,
      offset: 0,
      limit: chatMsgCount,
    );
    try {
      Map<String, dynamic> resp =
          await ApiServices.getChatFeedView(reqBodyData: chatFeedViewReqModel);
      if (resp['status']['code'] == 200) {
        chatFeedData = ChatFeedViewModel.fromJson(resp);

        chatMsgList.value = chatFeedData.data?.data ?? [];
        print("Chat list -- worked----------------- ${chatMsgList.length}");
        if (chatMsgList.isNotEmpty) {
          chatMsgList.add(chatMsgList[chatMsgList.length - 1]);
        }
        if (previousMessageListLenght == null ||
            chatMsgList.length == previousMessageListLenght) {
          showLoaderMoreMessage.value = false;
          // print("working show no");
        } else {
          showLoaderMoreMessage.value = true;
          // print("working show");
        }
        previousMessageListLenght = chatMsgList.length;
      }
      update();
    } catch (e) {
      print("periodicGetMsgList Error :-------------- $e");
    }
  }

  setScrollerIcon() {
    update(); // for showing scroll indicator for go down side of chat list
  }
}
