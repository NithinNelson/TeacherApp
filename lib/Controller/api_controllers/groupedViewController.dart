
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:teacherapp/Models/api_models/sent_msg_by_teacher_model.dart';
import 'package:teacherapp/Services/api_services.dart';
import '../../Models/api_models/chat_feed_view_model.dart';
import '../../Models/api_models/parent_list_api_model.dart';
import '../../Services/check_connectivity.dart';
import '../../Services/dialog_box.dart';
import '../../Services/snackBar.dart';

class GroupedViewController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxList<MsgData> chatMsgList = <MsgData>[].obs;
  Rx<ScrollController> chatGroupedViewScrollController = ScrollController().obs;
  Rx<FocusNode> focusNode = FocusNode().obs;
  String? lastMessageId;

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
      Map<String, dynamic> resp = await ApiServices.getChatFeedView(reqBodyData: reqBody);

      print("-----------grouped view ewsp-------------$resp");
      if(resp['status']['code'] == 200) {
        ChatFeedViewModel chatFeedData = ChatFeedViewModel.fromJson(resp);
        chatMsgList.value = chatFeedData.data?.data ?? [];
        chatMsgList.sort((a, b) {
          DateTime dateA = DateTime.parse(a.sendAt!);
          DateTime dateB = DateTime.parse(b.sendAt!);
          return dateA.compareTo(dateB);
        });
      }
      isLoaded.value = true;
    } catch(e) {
      isLoaded.value = false;
      print('--------grouped view error--------');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchFeedViewMsgListPeriodically(ChatFeedViewReqModel reqBody) async {
    ChatFeedViewModel? chatFeedData;
    try {
      Map<String, dynamic> resp = await ApiServices.getChatFeedView(reqBodyData: reqBody);
      if(resp['status']['code'] == 200) {
        chatFeedData = ChatFeedViewModel.fromJson(resp);
      }
    } catch(e) {
      print('--------grouped view error--------');
    } finally {}
    MsgData? lastMsg = chatFeedData?.data?.data?.first;
    String? newLastMessageId = "${lastMsg?.messageId}${lastMsg?.messageFromId}${lastMsg?.sendAt}";

    if (lastMessageId == null || newLastMessageId != lastMessageId) {
      lastMessageId = newLastMessageId;
      chatMsgList.value = chatFeedData?.data?.data ?? [];
      chatMsgList.sort((a, b) {
        DateTime dateA = DateTime.parse(a.sendAt!);
        DateTime dateB = DateTime.parse(b.sendAt!);
        return dateA.compareTo(dateB);
      });
      Future.delayed(
        const Duration(milliseconds: 50),
            () {
              chatGroupedViewScrollController.value
              .animateTo(
                chatGroupedViewScrollController.value
                .position
                .maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        },
      );
    }
  }
}