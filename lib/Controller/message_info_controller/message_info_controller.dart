import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Models/api_models/message_info_model.dart';
import 'package:teacherapp/Services/message_info_service/message_info_service.dart';
import 'package:teacherapp/View/Chat_View/group_msg_screen.dart';

class MessageInfoController extends GetxController {
  // Rx<String?> deliveryTime = Rx(null);
  // Rx<String?> seenTime = Rx(null);
  // RxBool readstatus = false.obs;
  Rx<List<Viewdata>?> viewsList = Rx(null);

  void getMessageInfo(
      {required BuildContext context, required int messageId}) async {
    checkInternet(
      context: context,
      function: () async {
        MessageInfoModel? messageData =
            await MessageInfoService.getMessageInfo(messageId: messageId);
        print("message == data $messageData");

        if (messageData != null) {
          if (messageData.data != null) {
            if (messageData.data!.viewdata != null) {
              if (messageData.data!.viewdata!.isNotEmpty) {
                viewsList.value = messageData.data!.viewdata!;
              }
            }
          }
        }
      },
    );
  }
}
