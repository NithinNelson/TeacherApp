import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  RxString ontype = "".obs;
  RxBool isReplay = false.obs;
  RxInt tabCurrentIndex = 0.obs;
  RxInt pageCurrentIndex = 0.obs;
  RxList<String> messageList = RxList([]);
  FocusNode focusNode = FocusNode();
  RxString replayMessage = "".obs;
  RxString replayName = "".obs;

  double value = 0;
  @override
  void onClose() {
    print("On close Work >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    focusNode.dispose();

    super.onClose();
  }

  Rx<ScrollController> chatListscrollController = ScrollController().obs;

  sentMsg(String msg) {
    messageList.add(msg);
    // messageList.insert(0, msg);
  }


}
