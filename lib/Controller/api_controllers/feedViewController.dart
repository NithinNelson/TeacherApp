
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:teacherapp/Services/api_services.dart';
import '../../Models/api_models/chat_feed_view_model.dart';
import '../../Models/api_models/sent_msg_by_teacher_model.dart';
import '../../Services/check_connectivity.dart';
import '../../Services/dialog_box.dart';
import '../../Services/snackBar.dart';

class FeedViewController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<ChatFeedViewModel> chatFeedData = ChatFeedViewModel().obs;
  RxList<MsgData> chatMsgList = <MsgData>[].obs;
  RxInt feedUnreadCount = 0.obs;
  Rx<ScrollController> chatFeedViewScrollController = ScrollController().obs;
  Rx<FocusNode> focusNode = FocusNode().obs;
  Rx<String?> isReplay = Rx(null);
  MsgData replayMessage = MsgData();
  RxString replayName = "".obs;
  Rx<String?> filePath = Rx(null);
  Rx<String?> audioPath = Rx(null);
  Rx<String?> cameraImagePath = Rx(null);
  RxBool isSentLoading = false.obs;
  RxString ontype = "".obs;
  RxBool showAudioRecordWidget = false.obs;
  RxBool showAudioPlayingWidget = false.obs;
  MsgData? seletedMsgData;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  Future<void> fetchFeedViewMsgList(ChatFeedViewReqModel reqBody) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> resp = await ApiServices.getChatFeedView(reqBodyData: reqBody);
      if(resp['status']['code'] == 200) {
        chatFeedData.value = ChatFeedViewModel.fromJson(resp);
        feedUnreadCount.value = chatFeedData.value.data?.count ?? 0;
        chatMsgList.value = chatFeedData.value.data?.data ?? [];
        chatMsgList.sort((a, b) => a.sendAt!.compareTo(b.sendAt!));
      }
      isLoaded.value = true;
    } catch(e) {
      isLoaded.value = false;
      print('--------feed view error--------');
    } finally {
      isLoading.value = false;
    }
  }

  selectAttachment({required BuildContext context}) async {
    bool connected = await CheckConnectivity().check();

    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(
        type: FileType.any,
        // allowedExtensions: [
        //   'pdf',
        //   'jpg',
        //   'jpeg',
        //   'png',
        //   'mp4',
        //   'mov',
        //   'avi',
        //   'mkv',
        //   'mp3',
        //   'wav',
        //   'opus',
        //   'm4a',
        // ],
      ).whenComplete(() {
        if (!connected) {
          snackBar(
              context: context,
              message: "No Internet Connection.",
              color: Colors.red);
        }
      });
      // const XTypeGroup typeGroup = XTypeGroup(
      //   label: 'images',
      //   extensions: <String>[
      //     // 'pdf',
      //     // 'jpg',
      //     // 'jpeg',
      //     // 'png',
      //     // 'mp4',
      //     // 'mov',
      //     // 'avi',
      //     // 'mkv',
      //     // 'mp3',
      //     // 'wav',
      //     // 'opus',
      //     // 'm4a',
      //     // 'xlsx',
      //     // 'xlsm',
      //     // 'xlsb',
      //     // 'xltx',
      //     // 'doc',
      //     // 'docm',
      //     // 'docx',
      //     // 'dot',
      //   ],
      // );

      // final File? result =
      // await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup])
      //     .whenComplete(() {
      //   if (!connected) {
      //     snackBar(
      //         context: context,
      //         message: "No Internet Connection.",
      //         color: Colors.red);
      //   }
      // });

      if (result != null && result.files.isNotEmpty) {
        File file = File(result.files.first.path!);

        int fileSizeInBytes = await file.length();

        if (fileSizeInBytes < 30 * 1024 * 1024) {
          filePath.value = result.files.first.path!;
        } else {
          filePath.value = null;
          snackBar(
              context: context,
              message: "The selected file is above 30 MB",
              color: Colors.red);
        }
      }
    } catch (e) {
      print("selectAttachment Error :-------------- $e");
      if (await Permission.storage.status.isDenied ||
          await Permission.storage.status.isPermanentlyDenied) {
        await ShowWarnDialog()
            .showWarn(context: context, message: "Enable storage permission.");
      }
      print("--------_selectAttachment---------${e.toString()}");
    }
  }

  Future<bool> permissionCheck(context) async {
    PermissionStatus cameraPermissionStatus = await Permission.camera.status;
    PermissionStatus micPermissionStatus = await Permission.microphone.status;

    if (cameraPermissionStatus.isGranted && micPermissionStatus.isGranted) {
      return true;
    } else if (cameraPermissionStatus.isDenied) {
      await Permission.camera.request();
      cameraPermissionStatus = await Permission.camera.status;
      if (!cameraPermissionStatus.isGranted) {
        await ShowWarnDialog().showWarn(
          context: context,
          message: 'Enable camera access.',
          iconData: Icons.camera_alt,
          isCameraPage: false,
        );
      }
    } else if (micPermissionStatus.isDenied) {
      await Permission.microphone.request();
      micPermissionStatus = await Permission.microphone.status;
      if (!micPermissionStatus.isGranted) {
        await ShowWarnDialog().showWarn(
          context: context,
          message: 'Audio access denied.',
          iconData: Icons.mic,
          isCameraPage: false,
        );
      }
    } else {
      if (cameraPermissionStatus.isPermanentlyDenied) {
        await ShowWarnDialog().showWarn(
          context: context,
          message: 'Enable camera access.',
          iconData: Icons.camera_alt,
          isCameraPage: false,
        );
      } else if (micPermissionStatus.isPermanentlyDenied) {
        await ShowWarnDialog().showWarn(
          context: context,
          message: 'Audio access denied.',
          iconData: Icons.mic,
          isCameraPage: false,
        );
      }
    }
    return false;
  }

  Future<dynamic> sendAttachMsg({
    required BuildContext context,
    required SentMsgByTeacherModel sentMsgData,
  }) async {
    print("Arun Msg Sent working ------------------------------");

    try {
      Map<String, dynamic> resp = await ApiServices.sentMsgByTeacher(
        teacherMsg: sentMsgData,
      );

      if (resp['status']['code'] == 200) {
        audioPath.value = null;
        filePath.value = null;
        showAudioRecordWidget.value = false; // for hiding the audio recording widget //
        showAudioPlayingWidget.value = false; // for hiding the audio playing widget //
      }
      isSentLoading.value = false;
      print("------msg-------$resp");
    } catch (e) {
      print("sendAttachMsg Error :-------------- $e");
      snackBar(
          context: context,
          message: "Something went wrong.",
          color: Colors.red);
      isSentLoading.value = false;
    }
  }

  Future<dynamic> sendAttach(
      {required BuildContext context,
        required String classs,
        required String batch,
        required String subId,
        required String sub,
        required String teacherId,
        filePath,
        String? message}) async {
    try {
      Map<String, dynamic> resp = await ApiServices.sendAttachment(filePath: filePath);

      print("---------respdata------------$resp");

      if (resp['status']['code'] == 200) {
        SentMsgByTeacherModel sentMsgByTeacherModel = SentMsgByTeacherModel(
          subjectId: subId,
          batch: batch,
          classs: classs,
          message: message,
          messageFrom: teacherId,
          parents: [],
          subject: sub,
          replyId: isReplay.value,
          fileData: FileData(
            name: resp['data']['file_data']['name'],
            orgName: resp['data']['file_data']['org_name'],
            extension: resp['data']['file_data']['extension'],
          ),
        );
        await sendAttachMsg(
          context: context,
          sentMsgData: sentMsgByTeacherModel,
        );
      }
      isSentLoading.value = false;
    } catch (e) {
      print("sendAttach Error :-------------- $e");
      snackBar(
          context: context,
          message: "Something went wrong.",
          color: Colors.red);
      isSentLoading.value = false;
    }
  }

  Future<dynamic> deleteMsg({
    int? msgId,
    String? teacherId,
    required BuildContext context,
  }) async {
    try {
      var resp = await ApiServices
          .deleteSenderMsg(msgId: msgId!, teacherId: teacherId!);
      if (resp['status']['code'] == 200) {
        print("-----resp-----$resp");
        snackBar(
            context: context,
            message: resp['data']['message'],
            color: Colors.green);
        Navigator.pop(context);
      }
    } catch (e) {
      print("Delete message Error :-------------- $e");
    }
  }

  bool showDelete(String dateTimeString) {
    try {
      // Parse the given date time string
      DateTime messageTime = DateTime.parse(dateTimeString);

      // Get the current time
      DateTime now = DateTime.now();

      // Calculate the difference in time
      Duration difference = now.difference(messageTime);

      // Check if the difference is less than 15 minutes
      return difference.inMinutes < 15;
    } catch(e) {
      return false;
    }
  }

  void focusTextField() {
    focusNode.value.requestFocus();
  }

}