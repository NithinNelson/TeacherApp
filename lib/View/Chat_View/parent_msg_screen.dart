import 'dart:async';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Models/api_models/sent_msg_by_teacher_model.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';
import 'package:teacherapp/View/Chat_View/Chat_widgets/parent_select_bottomSheet.dart';
import '../../Controller/api_controllers/parentChatController.dart';
import '../../Models/api_models/parent_chat_list_api_model.dart';
import '../../Models/api_models/parent_chatting_model.dart';
import '../../Services/check_connectivity.dart';
import '../../Services/dialog_box.dart';
import '../../Services/snackBar.dart';
import 'Chat_widgets/audio_widget.dart';
import 'Chat_widgets/file_widget.dart';
import 'Chat_widgets/camera_screen.dart';
import 'Chat_widgets/chat_audioPlaying_widget.dart';
import 'Chat_widgets/chat_audioRecording_widget.dart';
import 'Chat_widgets/chat_date_widget.dart';
import 'Chat_widgets/more_option_widget.dart';
import 'Chat_widgets/reaction_widget.dart';
import 'Chat_widgets/swape_to.dart';

class ParentMsgScreen extends StatefulWidget {
  final Datum? msgData;
  const ParentMsgScreen({super.key, this.msgData});

  @override
  State<ParentMsgScreen> createState() => _ParentMsgScreenState();
}

class _ParentMsgScreenState extends State<ParentMsgScreen> {
  TextEditingController messageCtr = TextEditingController();
  ParentChattingController parentChattingController = Get.find<ParentChattingController>();
  UserAuthController userAuthController = Get.find<UserAuthController>();
  Timer? chatUpdate;

  @override
  void initState() {
    super.initState();
    initialize();
    parentChattingController.isReplay.value = null;
  }

  @override
  void dispose() {
    chatUpdate!.cancel();
    super.dispose();
  }

  Future<void> initialize() async {
    context.loaderOverlay.show();
    ParentChattingReqModel chattingReqModel = ParentChattingReqModel(
      teacherId: userAuthController.userData.value.userId,
      schoolId: userAuthController.userData.value.schoolId,
      classs: widget.msgData?.datumClass,
      batch: widget.msgData?.batch,
      parentId: widget.msgData?.parentId,
      offset: 0,
      limit: 100,
    );
    await parentChattingController.fetchParentMsgList(chattingReqModel);
    if (!mounted) return;
    context.loaderOverlay.hide();
    await Future.delayed(const Duration(milliseconds: 50), () {
      parentChattingController.parentChatScrollController.value.animateTo(
        parentChattingController.parentChatScrollController.value.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
    chatUpdate = Timer.periodic(
      const Duration(seconds: 1),
          (timer) async {
        await parentChattingController.fetchParentMsgListPeriodically(chattingReqModel);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorutils.userdetailcolor,
        leadingWidth: 50.w,
        titleSpacing: 5,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ],
          ),
        ),
        title: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              padding: const EdgeInsets.all(10).w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: FittedBox(
                child: Text(
                  "${widget.msgData?.datumClass}${widget.msgData?.batch}",
                  style: TeacherAppFonts.interW600_16sp_black,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              widget.msgData?.subjectName ?? '--',
              style: GoogleFonts.inter(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 27.w,
              width: 27.w,
              child: SvgPicture.asset(
                'assets/images/MagnifyingGlass.svg',
                width: 200,
                height: 200,
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        // height: screenHeight,
        child: GetX<ParentChattingController>(
          builder: (ParentChattingController controller) {
            return Column(
              children: [
                Container(height: 10.h, color: Colorutils.userdetailcolor),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/chatBg.png",
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.white.withOpacity(0.8),
                        ),
                        const ChatList(),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colorutils.bgcolor9,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      children: [
                        controller.filePath.value == null
                            ? const SizedBox()
                            : Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.h),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 35.w,
                                    height: 30.w,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/images/new-document.png"),
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(
                                          parentChattingController.filePath.value!
                                              .split(".")
                                              .last,
                                          style: TeacherAppFonts
                                              .interW500_12sp_textWhite
                                              .copyWith(
                                            fontSize: 10.sp,
                                            color: Colors.black,
                                          ),
                                        )),
                                  ),
                                  SizedBox(width: 5.w),
                                  Expanded(
                                    child: Text(
                                      parentChattingController.filePath.value!
                                          .split("/")
                                          .last,
                                      style: TeacherAppFonts
                                          .interW400_16sp_letters1
                                          .copyWith(
                                          color: Colors.black),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      parentChattingController
                                          .filePath.value = null;
                                    },
                                    child: SizedBox(
                                      width: 25.w,
                                      height: 40.w,
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        controller.showAudioPlayingWidget.value == true
                            ? const ChatAudioPlayingWidget()
                            : const SizedBox(),
                        SizedBox(height: 10.w),
                        controller.isReplay.value != null
                            ? Column(
                          children: [
                            IntrinsicHeight(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(10.h),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 7.w,
                                      decoration: BoxDecoration(
                                        color: Colorutils.letters1,
                                        borderRadius: BorderRadius.only(
                                          topLeft:
                                          Radius.circular(10.h),
                                          bottomLeft:
                                          Radius.circular(10.h),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(5.w),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                controller
                                                    .replayName.value,
                                                style: TeacherAppFonts
                                                    .interW600_16sp_letters1,
                                              ),
                                            ),
                                            SizedBox(height: 5.h),
                                            Builder(
                                              builder: (context) {
                                                if (parentChattingController
                                                    .replayMessage
                                                    .type ==
                                                    "file") {
                                                  return Row(
                                                    children: [
                                                      Container(
                                                        width: 17,
                                                        height: 18,
                                                        decoration:
                                                        const BoxDecoration(
                                                          image:
                                                          DecorationImage(
                                                            fit: BoxFit
                                                                .fill,
                                                            image: AssetImage(
                                                                "assets/images/new-document.png"),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child:
                                                          SizedBox(
                                                            height: 8,
                                                            width: 12,
                                                            child:
                                                            FittedBox(
                                                              child:
                                                              Text(
                                                                parentChattingController
                                                                    .replayMessage
                                                                    .fileName!
                                                                    .split(".")
                                                                    .last,
                                                                style: TeacherAppFonts
                                                                    .interW400_14sp_textWhite
                                                                    .copyWith(
                                                                  fontSize:
                                                                  8.sp,
                                                                  color:
                                                                  Colors.black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: 5.h),
                                                      Expanded(
                                                        child: Text(
                                                          parentChattingController
                                                              .replayMessage
                                                              .fileName!,
                                                          style: TeacherAppFonts
                                                              .interW400_14sp_textWhite
                                                              .copyWith(
                                                            color: Colorutils
                                                                .fontColor6
                                                                .withOpacity(
                                                                0.8),
                                                          ),
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                } else if (
                                                parentChattingController
                                                    .replayMessage
                                                    .type ==
                                                    "text") {
                                                  return Text(
                                                    // "Can you pls share the pdf adsdaddsf.",
                                                    parentChattingController
                                                        .replayMessage
                                                        .message ??
                                                        "",
                                                    overflow:
                                                    TextOverflow
                                                        .ellipsis,

                                                    style: TeacherAppFonts
                                                        .interW400_14sp_textWhite
                                                        .copyWith(
                                                        color: Colorutils
                                                            .fontColor6
                                                            .withOpacity(
                                                            0.8)),
                                                  );
                                                } else if (
                                                parentChattingController
                                                    .replayMessage
                                                    .type ==
                                                    "audio") {
                                                  return Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 22,
                                                        height: 15.h,
                                                        child: SvgPicture
                                                            .asset(
                                                            "assets/images/Record Audio.svg"),
                                                      ),
                                                      SizedBox(
                                                          width: 1.w),
                                                      Expanded(
                                                        child: Text(
                                                          "Audio",
                                                          style: TeacherAppFonts
                                                              .interW400_14sp_textWhite
                                                              .copyWith(
                                                            color: Colorutils
                                                                .fontColor6
                                                                .withOpacity(
                                                                0.8),
                                                          ),
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                } else if (
                                                parentChattingController
                                                    .replayMessage
                                                    .type ==
                                                    "text_file" ||
                                                    parentChattingController
                                                        .replayMessage
                                                        .type ==
                                                        "text_audio") {
                                                  return Text(
                                                    // "Can you pls share the pdf adsdaddsf.",
                                                    parentChattingController
                                                        .replayMessage
                                                        .message ??
                                                        "",

                                                    overflow:
                                                    TextOverflow
                                                        .ellipsis,

                                                    style: TeacherAppFonts
                                                        .interW400_14sp_textWhite
                                                        .copyWith(
                                                        color: Colorutils
                                                            .fontColor6
                                                            .withOpacity(
                                                            0.8)),
                                                  );
                                                }

                                                return const SizedBox();
                                              },
                                            ),
                                            // SizedBox(
                                            //   width: double.infinity,
                                            //   child: Text(
                                            //     controller
                                            //         .replayMessage.value,
                                            //     maxLines: 3,
                                            //     overflow:
                                            //         TextOverflow.ellipsis,
                                            //     style: FontsStyle()
                                            //         .interW400_16sp
                                            //         .copyWith(
                                            //             color: ColorUtil
                                            //                 .black),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        parentChattingController
                                            .isReplay.value = null;
                                      },
                                      child: SizedBox(
                                        width: 25.w,
                                        height: 40.w,
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.w)
                                    // InkWell(
                                    //   onTap: () {},
                                    //   child: const Icon(
                                    //     Icons.close,
                                    //     color: ColorUtil.grey,
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        )
                            : const SizedBox(),
                        controller.showAudioRecordWidget.value
                            ? const ChatAudioRecordingWidget(isParentChat: true)
                            : Row(
                          children: [
                            controller.audioPath.value == null
                                ? InkWell(
                              onTap: () async {
                                await parentChattingController
                                    .selectAttachment(
                                    context: context);

                                // feedViewController
                                //     .selectAttachment(context: context);
                              },
                              child: SizedBox(
                                height: 25.w,
                                width: 25.w,
                                child: SvgPicture.asset(
                                    "assets/images/Attachment.svg"),
                              ),
                            )
                                : const SizedBox(),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(50.h),
                                    border: Border.all(
                                      width: 0.5.w,
                                      color: Colorutils.bordercolor1,
                                    )),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        focusNode:
                                        controller.focusNode.value,
                                        controller: messageCtr,
                                        decoration: InputDecoration(
                                          prefix: SizedBox(
                                            width: 15.w,
                                          ),
                                          border: InputBorder.none,
                                          contentPadding:
                                          const EdgeInsets.all(0),
                                          isDense: true,
                                          hintText: "Message",
                                          hintStyle: TeacherAppFonts
                                              .interW400_16sp_letters1
                                              .copyWith(
                                              color: Colors.black
                                                  .withOpacity(
                                                  0.2)),
                                        ),
                                        onChanged: (value) {
                                          controller.ontype.value =
                                              value;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            controller.audioPath.value == null
                                ? InkWell(
                              onTap: () async {
                                bool permission = await parentChattingController
                                    .permissionCheck(context);
                                if (permission) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const CameraScreen(isParentChat: true);
                                      },
                                    ),
                                  );
                                }
                              },
                              child: SizedBox(
                                height: 25.w,
                                width: 25.w,
                                child: SvgPicture.asset(
                                    "assets/images/Camera.svg"),
                              ),
                            )
                                : const SizedBox(),
                            SizedBox(
                              width: 20.w,
                            ),
                            controller.ontype.value == "" &&
                                controller.audioPath.value ==
                                    null &&
                                controller.filePath.value == null
                                ? GestureDetector(
                              onLongPress: () async {
                                await Permission.microphone
                                    .request();

                                if (await Permission.microphone
                                    .status.isGranted) {
                                  HapticFeedback.vibrate();
                                  parentChattingController
                                      .showAudioRecordWidget
                                      .value = true;
                                } else {
                                  ShowWarnDialog().showWarn(
                                      context: context,
                                      message:
                                      "Enable microphone permission.",
                                      iconData: Icons.mic_none);
                                }
                              },
                              child: SizedBox(
                                height: 25.w,
                                width: 25.w,
                                child: SvgPicture.asset(
                                    "assets/images/Record Audio.svg"),
                              ),
                            )
                                : controller.isSentLoading.value == true
                                ? SizedBox(
                              height: 25.w,
                              width: 25.w,
                              child:
                              CircularProgressIndicator(),
                            )
                                : InkWell(
                              onTap: () async {
                                controller.isSentLoading
                                    .value = true;
                                await checkInternet(
                                  context: context,
                                  function: () async {
                                    if (parentChattingController
                                        .audioPath
                                        .value !=
                                        null ||
                                        parentChattingController
                                            .filePath
                                            .value !=
                                            null) {
                                      await parentChattingController
                                          .sendAttach(
                                        classs: widget.msgData
                                            ?.datumClass ??
                                            '--',
                                        batch: widget.msgData
                                            ?.batch ??
                                            '--',
                                        subId: widget.msgData
                                            ?.subjectId ??
                                            '--',
                                        sub: widget.msgData
                                            ?.subjectName ??
                                            '--',
                                        teacherId:
                                        userAuthController
                                            .userData
                                            .value
                                            .userId ??
                                            '--',
                                        context: context,
                                        filePath: parentChattingController
                                            .audioPath
                                            .value ??
                                            parentChattingController
                                                .filePath
                                                .value,
                                        message: messageCtr
                                            .text
                                            .isNotEmpty
                                            ? messageCtr.text
                                            : null,
                                      );
                                    } else {
                                      if (messageCtr
                                          .text.isNotEmpty) {
                                        SentMsgByTeacherModel
                                        sentMsgData =
                                        SentMsgByTeacherModel(
                                          subjectId: widget
                                              .msgData
                                              ?.subjectId ??
                                              '--',
                                          batch: widget
                                              .msgData
                                              ?.batch ??
                                              '--',
                                          classs: widget
                                              .msgData
                                              ?.datumClass ??
                                              '--',
                                          message: messageCtr
                                              .text
                                              .isNotEmpty
                                              ? messageCtr
                                              .text
                                              : null,
                                          messageFrom:
                                          userAuthController
                                              .userData
                                              .value
                                              .userId ??
                                              '--',
                                          subject: widget
                                              .msgData
                                              ?.subjectName ??
                                              '--',
                                          replyId: controller
                                              .isReplay.value,
                                          fileData: FileData(
                                            name: null,
                                            orgName: null,
                                            extension: null,
                                          ),
                                        );
                                        await parentChattingController
                                            .sendAttachMsg(
                                          sentMsgData:
                                          sentMsgData,
                                          context: context,
                                        );
                                      }
                                    }
                                  },
                                );
                                controller.isSentLoading
                                    .value = false;

                                //delaying for completing the message tile update after rebuild//
                                Future.delayed(
                                    const Duration(
                                        milliseconds: 50),
                                        () {
                                          parentChattingController
                                          .parentChatScrollController
                                          .value
                                          .animateTo(
                                        controller
                                            .parentChatScrollController
                                            .value
                                            .position
                                            .maxScrollExtent,
                                        duration: const Duration(
                                            milliseconds: 200),
                                        curve: Curves.easeOut,
                                      );
                                    });
                                print("clear worked");
                                messageCtr.clear();
                                controller.ontype.value = "";

                                //delaying for completing the message tile update after rebuild//
                                Future.delayed(
                                  const Duration(
                                      milliseconds: 50),
                                      () {
                                        parentChattingController
                                        .parentChatScrollController
                                        .value
                                        .animateTo(
                                      controller
                                          .parentChatScrollController
                                          .value
                                          .position
                                          .maxScrollExtent,
                                      duration:
                                      const Duration(
                                          milliseconds:
                                          200),
                                      curve:
                                      Curves.easeOut,
                                    );
                                  },
                                );
                              },
                              child: SizedBox(
                                height: 25.w,
                                width: 25.w,
                                child: const Icon(
                                  Icons.send,
                                  color: Colorutils.bgcolor13,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 35.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    String userId =
        Get.find<UserAuthController>().userData.value.userId ?? '--';
    return GetX<ParentChattingController>(
      builder: (ParentChattingController controller) {
        List<ParentMsgData> msgList = controller.chatMsgList.value;
        return GroupedListView<ParentMsgData, String>(
          useStickyGroupSeparators: true,
          cacheExtent: 10000,
          floatingHeader: true,
          padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
          controller: controller.parentChatScrollController.value,
          groupBy: (element) {
            try {
              return DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(element.sendAt!));
            } catch (e) {
              return "--";
            }
          },
          sort: true,
          elements: msgList,
          groupSeparatorBuilder: (String groupByValue) {
            return ChatDateWidget(date: groupByValue);
          },
          itemComparator: (item1, item2) => item1.sendAt!.compareTo(item2.sendAt!),
          itemBuilder: (context, messageData) {
            // final messageData = msgList[index];
            return "${messageData.messageFromId}" == userId
                ? Column(
              children: [
                SwapeToWidget(
                  function: () {
                    controller.focusTextField();
                    controller.isReplay.value = messageData.messageId;
                    controller.replayName.value = "You";
                    controller.replayMessage = messageData;
                  },
                  iconWidget: SvgPicture.asset(
                      "assets/images/ArrowBendUpLeft.svg"),
                  child: SentMessageBubble(
                    message: messageData.message ?? '',
                    time: messageData.sendAt,
                    replay: true,
                    audio: messageData.messageAudio,
                    fileName: messageData.fileName,
                    fileLink: messageData.messageFile,
                    messageData: messageData,
                  ),
                ),
              ],
            )
                : Column(
              children: [
                SwapeToWidget(
                  function: () {
                    controller.focusTextField();
                    // FocusScope.of(context)
                    //     .requestFocus(controller.focusNode);
                    controller.isReplay.value = messageData.messageId;
                    controller.replayName.value =
                        messageData.messageFrom ?? "";
                    controller.replayMessage = messageData;
                  },
                  iconWidget: SvgPicture.asset(
                      "assets/images/ArrowBendUpLeft.svg"),
                  child: ReceiveMessageBubble(
                    senderName: messageData.messageFrom,
                    message: messageData.message,
                    time: messageData.sendAt,
                    replay: true,
                    audio: messageData.messageAudio,
                    fileName: messageData.fileName,
                    fileLink: messageData.messageFile,
                    subject: messageData.subjectName,
                    messageData: messageData,
                  ),
                ),
              ],
            );
          },
          separator: SizedBox(
            height: 5.h,
          ),
          // separatorBuilder: (context, index) {
          //   return SizedBox(
          //     height: 5.h,
          //   );
          // },
          // itemCount: msgList.length,
        );
      },
    );
  }
}

messageMoreShowDialog(
    BuildContext context, Widget widget, Offset position, Offset tapPosition) {
  double safeAreaVerticalPadding = MediaQuery.of(context).padding.top +
      MediaQuery.of(context).padding.bottom;

  showDialog(
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Stack(
            children: [
              Positioned(
                top: position.dy - safeAreaVerticalPadding,
                left: 0,
                right: 0,
                child: Container(child: widget),
              ),
              Positioned(
                top: tapPosition.dy -
                    safeAreaVerticalPadding -
                    ((ScreenUtil().screenHeight / 1.7) > tapPosition.dy
                        ? 100.h
                        : 420.h),
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ScreenUtil().screenHeight / 1.7 < tapPosition.dy
                        ? MessageMoreContainer(
                      widget: widget,
                    )
                        : const SizedBox(),
                    SizedBox(height: 20.h),
                    const ReactionContainerWidget(),
                    SizedBox(height: 80.h),
                    ScreenUtil().screenHeight / 1.7 > tapPosition.dy
                        ? MessageMoreContainer(
                      widget: widget,
                    )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> checkInternet(
    {required BuildContext context, required Function() function}) async {
  bool connected = await CheckConnectivity().check();
  bool isConnectionGood = await CheckConnectivity().goodConnection();
  print("internect connection is $connected");
  print("internect Good connection is $isConnectionGood");
  if (connected) {
    if (isConnectionGood) {
      function();
    } else {
      snackBar(
          context: context,
          message: "Something went wrong.",
          color: Colors.red);
    }
  } else {
    snackBar(
        context: context,
        message: "No Internet Connection.",
        color: Colors.red);
  }
}

class SentMessageBubble extends StatelessWidget {
  SentMessageBubble(
      {super.key,
        this.message,
        this.time,
        this.replay,
        this.audio,
        this.fileName,
        this.fileLink,
        // this.senderId,
        this.messageData});

  late Offset _tapPosition;

  bool? replay;
  String? time;
  String? message;
  ParentMsgData? messageData;
  String? audio;
  String? fileName;
  String? fileLink;
  // String? senderId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(right: 20.h),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: -5.w,
              child: SizedBox(
                width: 20.w,
                height: 20.w,
                child: SvgPicture.asset(
                  "assets/images/MessageBubbleShape.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      _tapPosition = details.globalPosition;
                      print(_tapPosition);
                      print(ScreenUtil().screenHeight);
                    },
                    onLongPress: () {
                      Get.find<ParentChattingController>().seletedMsgData = messageData;
                      final renderObject =
                      context.findRenderObject() as RenderBox;
                      final position = renderObject.localToGlobal(Offset.zero);

                      messageMoreShowDialog(
                          context, this, position, _tapPosition);
                    },
                    child: IntrinsicWidth(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 310.w),
                        decoration: BoxDecoration(
                            color: Colorutils.msgBubbleColor1,
                            borderRadius: BorderRadius.circular(10.h)),
                        child: Padding(
                          padding: EdgeInsets.all(10.h),
                          child: Column(
                            children: [
                              messageData!.replyData != null
                                  ? ReplayMessageWidget(
                                senderId: messageData!.messageFromId,
                                replyData: messageData!.replyData!,
                              )
                                  : const SizedBox(),
                              fileName != null
                                  ? FileWidget1(
                                fileType: fileName!.split(".").last,
                                fileName: fileName!,
                                fileLink: fileLink!,
                              )
                                  : const SizedBox(),
                              audio != null
                                  ? AudioWidget(content: audio!)
                                  : const SizedBox(),
                              message != null && fileName != null ||
                                  audio != null
                                  ? SizedBox(height: 5.h)
                                  : const SizedBox(),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 200.w,
                                        ),
                                        child: Text(
                                          message ?? "",
                                          // maxLines: 100,
                                          style: TeacherAppFonts
                                              .interW400_16sp_letters1
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(height: 5.h)
                                    ],
                                  ),
                                  SizedBox(width: 20.h),
                                  Row(
                                    children: [
                                      Text(
                                        // "17:47",
                                        messageBubbleTimeFormat(time),
                                        style: TeacherAppFonts
                                            .interW400_12sp_topicbackground
                                            .copyWith(
                                            color: Colors.black
                                                .withOpacity(.25)),
                                      ),
                                      SizedBox(width: 5.h),
                                      // SizedBox(
                                      //   height: 21.h,
                                      //   width: 21.h,
                                      //   child: SvgPicture.asset(
                                      //       "assets/images/Checks.svg",
                                      //       color: messageData?.read == null
                                      //           ? Colors.grey
                                      //           : messageData!.read!
                                      //           ? Colors.green.shade900
                                      //           : Colors.grey),
                                      // ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String messageBubbleTimeFormat(String? dateTime) {
  // Check if the input date-time string is null
  if (dateTime == null) {
    return "--";
  }

  // Parse the input date-time string
  DateTime parsedDateTime = DateTime.parse(dateTime);

  // Format the parsed DateTime to the desired time format
  String formattedTime = DateFormat('HH:mm').format(parsedDateTime);

  return formattedTime;
}

String chatFormatDate(String? dateTime) {
  // Check if the input date-time string is null
  if (dateTime == null) {
    return "--";
  }
  // Parse the input date-time string
  DateTime parsedDateTime = DateTime.parse(dateTime);

  // Format the parsed DateTime to the desired format
  String formattedDate = DateFormat('EEE, MMM d').format(parsedDateTime);

  return formattedDate;
}

class ReplayMessageWidget extends StatelessWidget {
  const ReplayMessageWidget({super.key, required this.replyData, this.senderId});
  final ReplyData replyData;
  final String? senderId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 5.w,
              decoration: BoxDecoration(
                  color: Colorutils.userdetailcolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.h),
                      bottomLeft: Radius.circular(5.h))),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: senderId == Get.find<UserAuthController>().userData.value.userId
                        ? Colorutils.userdetailcolor.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.h),
                        bottomRight: Radius.circular(5.h))),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextAndFileWidget(replyData: replyData)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextAndFileWidget extends StatelessWidget {
  const TextAndFileWidget({
    super.key,
    required this.replyData,
  });
  final ReplyData replyData;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (replyData.type == "file") {
        return Row(
          children: [
            Container(
              width: 17,
              height: 18,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/new-document.png"),
                ),
              ),
              child: Center(
                child: SizedBox(
                  height: 8,
                  width: 12,
                  child: FittedBox(
                    child: Text(
                      replyData.fileName!.split(".").last,
                      style: TeacherAppFonts.interW400_14sp_textWhite.copyWith(
                        fontSize: 8.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Text(
                replyData.fileName!,
                style: TeacherAppFonts.interW400_14sp_textWhite.copyWith(
                  color: Colorutils.fontColor6.withOpacity(0.8),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        );
      } else if (replyData.type == "text") {
        return Text(
          // "Can you pls share the pdf adsdaddsf.",
          replyData.message ?? "",
          overflow: TextOverflow.ellipsis,

          style: TeacherAppFonts
              .interW400_14sp_textWhite
              .copyWith(color: Colorutils.fontColor6.withOpacity(0.8)),
        );
      } else if (replyData.type == "audio") {
        return Row(
          children: [
            SizedBox(
              width: 22,
              height: 15.h,
              child: SvgPicture.asset("assets/svg/Record Audio.svg"),
            ),
            SizedBox(width: 1.w),
            Expanded(
              child: Text(
                "Audio",
                style: TeacherAppFonts.interW400_14sp_textWhite.copyWith(
                  color: Colorutils.fontColor6.withOpacity(0.8),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        );
      } else if (replyData.type == "text_file" ||
          replyData.type == "text_audio") {
        return Text(
          // "Can you pls share the pdf adsdaddsf.",
          replyData.message ?? "",

          overflow: TextOverflow.ellipsis,

          style: TeacherAppFonts
              .interW400_14sp_textWhite
              .copyWith(color: Colorutils.fontColor6.withOpacity(0.8)),
        );
      }

      return const SizedBox();
    });
  }
}

class ReceiveMessageBubble extends StatelessWidget {
  ReceiveMessageBubble(
      {super.key,
        this.message,
        this.time,
        this.replay,
        this.audio,
        this.fileLink,
        this.fileName,
        this.senderName,
        this.messageData,
        this.subject});

  late Offset _tapPosition;

  bool? replay;
  String? time;
  String? message;
  String? audio;
  String? fileName;
  String? fileLink;
  String? senderName;
  String? subject;
  ParentMsgData? messageData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 20.h),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: -2.w,
              child: SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: SvgPicture.asset(
                    "assets/images/MessageBubbleShape2.svg",
                    fit: BoxFit.fill,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: GestureDetector(
                onTapDown: (TapDownDetails details) {
                  _tapPosition = details.globalPosition;
                  print(_tapPosition);
                  print(ScreenUtil().screenHeight);
                },
                onLongPress: () {
                  Get.find<ParentChattingController>().seletedMsgData = messageData;
                  final renderObject = context.findRenderObject() as RenderBox;
                  final position = renderObject.localToGlobal(Offset.zero);

                  messageMoreShowDialog(context, this, position, _tapPosition);
                },
                child: Container(
                  constraints: BoxConstraints(maxWidth: 310.w),
                  decoration: BoxDecoration(
                      color: Colorutils.fontColor8,
                      borderRadius: BorderRadius.circular(10.h)),
                  child: Padding(
                    padding: EdgeInsets.all(10.h),
                    child: Stack(
                      children: [
                        IntrinsicWidth(
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    constraints:
                                    BoxConstraints(maxWidth: 150.w),
                                    child: Text(
                                      senderName == null
                                          ? "--"
                                          : "~ ${senderName ?? ""}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TeacherAppFonts
                                          .interW500_12sp_textWhite
                                          .copyWith(
                                          color: Colorutils.fontColor5),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 70.w),
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      // "Arabic",
                                      subject ?? "--",

                                      style: TeacherAppFonts
                                          .interW400_12sp_textWhite_italic
                                          .copyWith(
                                          color: Colorutils.fontColor10),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              messageData!.replyData != null
                                  ? ReplayMessageWidget(
                                senderId: messageData!.messageFromId,
                                replyData: messageData!.replyData!,
                              )
                                  : const SizedBox(),
                              fileName != null
                                  ? FileWidget2(
                                fileType: fileName!.split(".").last,
                                fileName: fileName!,
                                fileLink: fileLink!,
                              )
                                  : const SizedBox(),
                              audio != null
                                  ? AudioWidget(content: audio!)
                                  : const SizedBox(),
                              message != null && fileName != null ||
                                  audio != null
                                  ? SizedBox(height: 5.h)
                                  : const SizedBox(),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxWidth: 210.w,
                                        ),
                                        child: Text(
                                          message ?? "",
                                          maxLines: 100,
                                          style: TeacherAppFonts
                                              .interW400_16sp_letters1
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                    ],
                                  ),
                                  SizedBox(width: 20.h),
                                  Text(
                                    // "17:47",
                                    messageBubbleTimeFormat(time),
                                    style: TeacherAppFonts.interW400_12sp_topicbackground.copyWith(
                                        color: Colors.black.withOpacity(.25)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatAudioPlayingWidget extends StatefulWidget {
  // final Function(bool) removeAudioPath;
  const ChatAudioPlayingWidget({
    super.key,
    // required this.removeAudioPath,
  });

  @override
  State<ChatAudioPlayingWidget> createState() => _ChatAudioPlayingWidgetState();
}

class _ChatAudioPlayingWidgetState extends State<ChatAudioPlayingWidget> {
  final player = AudioPlayer();
  Duration _audioPosition = Duration.zero;
  Duration _audioDuration = Duration.zero;
  bool _isPlaying = false;
  String? _audioPath;
  String userId = "";
  String schoolId = "";

  @override
  void initState() {
    _initialize();
    _initAudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  _initialize() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var school_Id = preferences.getString('school_id');
    var fromId = preferences.getString('userID');
    setState(() => userId = fromId!);
    setState(() => schoolId = school_Id!);
  }

  void _initAudioPlayer() async {
    player.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() => _isPlaying = state == PlayerState.playing);
      }
    });

    player.onDurationChanged.listen((Duration duration) {
      if (mounted) {
        setState(() => _audioDuration = duration);
      }
    });

    player.onPositionChanged.listen((Duration duration) {
      if (mounted) {
        setState(() => _audioPosition = duration);
      }
    });

    // player.onPlayerComplete.listen((event) {
    //   if (mounted) {
    //     setState(() => _audioPosition = Duration.zero);
    //   }
    // });

    _audioPath = Get.find<ParentChattingController>().audioPath.value!;
    await player.setSourceDeviceFile(_audioPath!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
          color: Colors.white,
        ),
        height: 50.h,
        width: double.infinity,
        child: Row(
          children: [
            InkWell(
              onTap: () => _playAudio(_audioPath!),
              child: SizedBox(
                width: 25,
                height: 25,
                child: Center(child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow)),
              ),
            ),
            Expanded(
              child: SliderTheme(
                data: const SliderThemeData(
                    thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 8, disabledThumbRadius: 8)),
                child: Slider(
                  min: 0,
                  max: _audioDuration.inSeconds.toDouble(),
                  value: _audioPosition.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await player.seek(position);
                    await player.resume();
                  },
                  thumbColor: Colorutils.userdetailcolor,
                  activeColor: Colorutils.userdetailcolor,
                ),
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              formatDuration(_audioDuration - _audioPosition),
              style: const TextStyle(fontSize: 10),
            ),
            SizedBox(width: 5.w),
            InkWell(
              onTap: () {
                Get.find<ParentChattingController>().audioPath.value = null;
                Get.find<ParentChattingController>().showAudioPlayingWidget.value =
                false; // for hiding the audio playing widget //
              },
              child: SizedBox(
                width: 25.w,
                height: 40.w,
                child: const Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
              ),
            ),
            // SizedBox(
            //   width: 25,
            //   child: IconButton(
            //     onPressed: () {
            //       Get.find<FeedViewController>().audioPath.value = null;
            //     },
            //     icon: const Icon(
            //       Icons.close,
            //       color: ColorUtil.grey,
            //     ),
            //   ),
            // ),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }

  Future<void> _playAudio(String content) async {
    if (_isPlaying) {
      await player.pause();
    } else {
      await player.play(DeviceFileSource(_audioPath!));
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String threeDigits(int n) => n.toString().padLeft(3, '0');

    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String milliseconds = threeDigits(duration.inMilliseconds.remainder(1000));

    if (hours == "00") {
      return '$minutes:$seconds';
    } else {
      return '$hours:$minutes:$seconds';
    }
  }
}

