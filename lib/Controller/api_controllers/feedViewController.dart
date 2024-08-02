
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

class FeedViewController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  // Rx<ChatFeedViewModel> chatFeedData = ChatFeedViewModel().obs;
  Rx<ParentListApiModel> parentListApiData = ParentListApiModel().obs;
  RxList<MsgData> chatMsgList = <MsgData>[].obs;
  RxList<ParentData> parentDataList = <ParentData>[].obs;
  RxList<String> allParentDataList = <String>[].obs;
  RxList<ParentData> selectedParentDataList = <ParentData>[].obs;
  RxList<String> finalParentDataList = <String>[].obs;
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
  String? lastMessageId;
  RxInt tabControllerIndex = 0.obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  Future<void> fetchFeedViewMsgList(ChatFeedViewReqModel reqBody) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> resp = await ApiServices.getChatFeedView(reqBodyData: reqBody);
      if(resp['status']['code'] == 200) {
        ChatFeedViewModel chatFeedData = ChatFeedViewModel.fromJson(resp);
        feedUnreadCount.value = chatFeedData.data?.count ?? 0;
        chatMsgList.value = chatFeedData.data?.data ?? [];
        // chatMsgList.sort((a, b) => a.sendAt!.compareTo(b.sendAt!));
        chatMsgList.sort((a, b) {
          DateTime dateA = DateTime.parse(a.sendAt!);
          DateTime dateB = DateTime.parse(b.sendAt!);
          return dateA.compareTo(dateB);
        });
      }
      await fetchParentList(
        classs: reqBody.classs ?? '--',
        batch: reqBody.batch ?? '--',
        subId: reqBody.subjectId ?? '--',
        schoolId: reqBody.schoolId ?? '--',
      );
      isLoaded.value = true;
    } catch(e) {
      isLoaded.value = false;
      print('--------feed view error--------');
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
      print('--------feed view error--------');
    } finally {}
    MsgData? lastMsg = chatFeedData?.data?.data?.first;
    String? newLastMessageId = "${lastMsg?.messageId}${lastMsg?.messageFromId}${lastMsg?.sendAt}";

    if (lastMessageId == null || newLastMessageId != lastMessageId) {
      lastMessageId = newLastMessageId;
      // update();
      feedUnreadCount.value = chatFeedData?.data?.count ?? 0;
      chatMsgList.value = chatFeedData?.data?.data ?? [];
      chatMsgList.sort((a, b) {
        DateTime dateA = DateTime.parse(a.sendAt!);
        DateTime dateB = DateTime.parse(b.sendAt!);
        return dateA.compareTo(dateB);
      });
      // chatMsgList.sort(
      //   (a, b) => a.sendAt!.compareTo(b.sendAt!),
      // );
      Future.delayed(
        const Duration(milliseconds: 50),
            () {
              chatFeedViewScrollController.value
              .animateTo(
                chatFeedViewScrollController.value
                .position
                .maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        },
      );
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
    // PermissionStatus micPermissionStatus = await Permission.microphone.status;

    if (cameraPermissionStatus.isGranted) {
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
    }
    // else if (micPermissionStatus.isDenied) {
    //   await Permission.microphone.request();
    //   micPermissionStatus = await Permission.microphone.status;
    //   if (!micPermissionStatus.isGranted) {
    //     await ShowWarnDialog().showWarn(
    //       context: context,
    //       message: 'Audio access denied.',
    //       iconData: Icons.mic,
    //       isCameraPage: false,
    //     );
    //   }
    // }
    else {
      if (cameraPermissionStatus.isPermanentlyDenied) {
        await ShowWarnDialog().showWarn(
          context: context,
          message: 'Enable camera access.',
          iconData: Icons.camera_alt,
          isCameraPage: false,
        );
      }
      // else if (micPermissionStatus.isPermanentlyDenied) {
      //   await ShowWarnDialog().showWarn(
      //     context: context,
      //     message: 'Audio access denied.',
      //     iconData: Icons.mic,
      //     isCameraPage: false,
      //   );
      // }
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
        isReplay.value = null;
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
    print("--------rgte4ght------------${finalParentDataList.length}");
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
          parents: finalParentDataList.value.isNotEmpty ? finalParentDataList.value : allParentDataList.value,
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
    if(focusNode.value.hasFocus) {
      focusNode.value = FocusNode();
    }
    focusNode.value.requestFocus();
  }

  Future<void> fetchParentList({required String classs, required String batch, required String subId, required String schoolId}) async {
    try {
      Map<String, dynamic> resp = await ApiServices.getParentList(
          classs: classs,
          batch: batch,
          subId: subId,
          schoolId: schoolId,
      );
      if(resp['status']['code'] == 200) {
        parentListApiData.value = ParentListApiModel.fromJson(resp);
        parentDataList.value = parentListApiData.value.data?.parentData ?? [];
        for (var parent in parentDataList) {
          allParentDataList.add(parent.sId.toString());
        }
      }
    } catch(e) {
      print("----------parent list error---------");
    }
  }

  void addParentList(ParentData parent) {
    List<ParentData> parents = selectedParentDataList.where((emp) => emp.sId == parent.sId).toList();
    if(parents.isEmpty) {
      selectedParentDataList.add(parent);
    } else {
      removeParentList(parent);
    }
  }

  void removeParentList(ParentData parent) {
    selectedParentDataList.remove(parent);
  }

  void setFinalParentList() {
    for (var parent in selectedParentDataList) {
      finalParentDataList.add(parent.sId ?? '');
    }
  }

  bool showSelectionIcon(ParentData parent) {
    return selectedParentDataList.contains(parent);
  }
}