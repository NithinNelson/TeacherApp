import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Models/api_models/chat_feed_view_model.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';
import '../../../Controller/ui_controllers/chat_controller.dart';
import '../../Controller/api_controllers/groupedViewController.dart';
import '../../Models/api_models/grouped_view_list_api_model.dart';
import '../Chat_List/Mychat/Chat_seen.dart';
import 'Chat_widgets/audio_widget.dart';
import 'Chat_widgets/chat_date_widget.dart';
import 'Chat_widgets/file_widget.dart';
import 'Chat_widgets/message_info_screen.dart';
import 'Chat_widgets/replay_in_message_widget.dart';
import 'Chat_widgets/sent_bubble_widget.dart';

class GroupedViewMsgScreen extends StatefulWidget {
  final RoomData? roomData;
  const GroupedViewMsgScreen({super.key, this.roomData});

  @override
  State<GroupedViewMsgScreen> createState() => _GroupedViewMsgScreenState();
}

class _GroupedViewMsgScreenState extends State<GroupedViewMsgScreen> {
  GroupedViewController groupedViewController = Get.find<GroupedViewController>();

  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() async {
    context.loaderOverlay.show();
    String? userId = Get.find<UserAuthController>().userData.value.userId;
    String? schoolId = Get.find<UserAuthController>().userData.value.schoolId;
    ChatFeedViewReqModel chatFeedViewReqModel = ChatFeedViewReqModel(
      classs: widget.roomData?.classs ?? '--',
      batch: widget.roomData?.batch ?? '--',
      subjectId: widget.roomData?.subjectId ?? '--',
      teacherId: userId ?? '--',
      schoolId: schoolId ?? '--',
      limit: 100,
      offset: 0,
    );
    await groupedViewController.fetchFeedViewMsgList(chatFeedViewReqModel);
    await Future.delayed(const Duration(milliseconds: 50), () {
      groupedViewController.chatGroupedViewScrollController.value.animateTo(
        groupedViewController.chatGroupedViewScrollController.value.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
    if(!mounted) return;
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorutils.userdetailcolor,
        leadingWidth: 40.w,
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
            CircleAvatar(radius: 20.r, backgroundColor: Colors.white),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.roomData?.subjectName ?? '--',
                      style: TeacherAppFonts.interW600_18sp_textWhite,
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10).w,
                      decoration: BoxDecoration(
                        color: Colorutils.Whitecolor,
                        borderRadius: BorderRadius.circular(28).r,
                      ),
                      child: Text(
                        "${widget.roomData?.classs ?? ''}${widget.roomData?.batch ?? ''}",
                        style: TeacherAppFonts.interW500_12sp_textWhite.copyWith(
                          color: const Color(0xFF003D36),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.roomData?.teacherName ?? '--',
                  style: TeacherAppFonts.interW400_14sp_textWhite,
                ),
              ],
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

        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    String userId = Get.find<UserAuthController>().userData.value.userId ?? '--';
    return GetX<GroupedViewController>(
      builder: (GroupedViewController controller) {
        List<MsgData> msgData = controller.chatMsgList.value;
        return GroupedListView<MsgData, String>(
          useStickyGroupSeparators: true,
          cacheExtent: 10000,
          floatingHeader: true,
          padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
          controller: controller.chatGroupedViewScrollController.value,
          groupBy: (element) {
            try {
              return DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(element.sendAt!));
            } catch (e) {
              return "--";
            }
          },
          sort: true,
          elements: msgData,
          groupSeparatorBuilder: (String groupByValue) {
            return ChatDateWidget(date: groupByValue);
          },
          itemBuilder: (context, messageData) {
            List<StudentData> student = messageData.studentData ?? [];
            StudentData? relation = student.isNotEmpty ? student.first : StudentData();
            String relationData = "${relation.relation ?? ''} ${relation.relation != null ? 'of' : ''} ${messageData.messageFrom ?? '--'}";
            return "${messageData.messageFromId}" == userId
                ? SentMessageBubble(
                  message: messageData.message ?? '',
                  time: messageData.sendAt,
                  replay: true,
                  audio: messageData.messageAudio,
                  fileName: messageData.fileName,
                  fileLink: messageData.messageFile,
                  messageData: messageData,
                )
                : ReceiveMessageBubble(
                  senderName: student.isNotEmpty ? messageData.studentData?.first.studentName ?? '--' : '--',
                  message: messageData.message,
                  time: messageData.sendAt,
                  replay: true,
                  audio: messageData.messageAudio,
                  fileName: messageData.fileName,
                  fileLink: messageData.messageFile,
                  messageData: messageData,
                  relation: relationData,
                );
          },
          separator: SizedBox(
            height: 5.h,
          ),
        );
      },
    );
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
  MsgData? messageData;
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
                                    SizedBox(
                                      height: 21.h,
                                      width: 21.h,
                                      child: SvgPicture.asset(
                                          "assets/images/Checks.svg",
                                          color: messageData?.read == null
                                              ? Colors.grey
                                              : messageData!.read!
                                              ? Colors.green.shade900
                                              : Colors.grey),
                                    ),
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
              ],
            ),
          ],
        ),
      ),
    );
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
        this.relation});

  bool? replay;
  String? time;
  String? message;
  String? audio;
  String? fileName;
  String? fileLink;
  String? senderName;
  MsgData? messageData;
  String? relation;

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
                                  BoxConstraints(maxWidth: 70.w),
                                  child: Text(
                                    senderName == null
                                        ? "--"
                                        : "~ ${senderName?.split(" ").first ?? ""}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TeacherAppFonts
                                        .interW500_12sp_textWhite
                                        .copyWith(
                                        color: Colorutils.fontColor5),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Container(
                                  constraints: BoxConstraints(maxWidth: 150.w),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.right,
                                    // "Arabic",
                                    relation ?? "--",

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
          ],
        ),
      ),
    );
  }
}
