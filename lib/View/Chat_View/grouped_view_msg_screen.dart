import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Models/api_models/chat_feed_view_model.dart';
import 'package:teacherapp/Models/api_models/chat_group_api_model.dart';
import 'package:teacherapp/Services/snackBar.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';
import 'package:teacherapp/View/Chat_View/Chat_widgets/text_and_file_widget.dart';
import 'package:teacherapp/View/Chat_View/group_msg_screen.dart';
import '../../Controller/api_controllers/groupedViewController.dart';
import '../../Models/api_models/grouped_view_list_api_model.dart';
import 'Chat_widgets/audio_widget.dart';
import 'Chat_widgets/chat_date_widget.dart';
import 'Chat_widgets/file_widget.dart';
import 'Chat_widgets/replay_in_message_widget.dart';
import 'Chat_widgets/sent_bubble_widget.dart';

class GroupedViewMsgScreen extends StatefulWidget {
  final RoomData? roomData;
  const GroupedViewMsgScreen({super.key, this.roomData});

  @override
  State<GroupedViewMsgScreen> createState() => _GroupedViewMsgScreenState();
}

class _GroupedViewMsgScreenState extends State<GroupedViewMsgScreen> {
  GroupedViewController groupedViewController =
      Get.find<GroupedViewController>();

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

    if (!mounted) return;
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return AllChatRoomDataInheritedWidget(
      batch: widget.roomData?.batch,
      classs: widget.roomData?.classs,
      subjectId: widget.roomData?.subjectId,
      child: Scaffold(
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
                        padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10)
                            .w,
                        decoration: BoxDecoration(
                          color: Colorutils.Whitecolor,
                          borderRadius: BorderRadius.circular(28).r,
                        ),
                        child: Text(
                          "${widget.roomData?.classs ?? ''}${widget.roomData?.batch ?? ''}",
                          style:
                              TeacherAppFonts.interW500_12sp_textWhite.copyWith(
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
    return GetBuilder<GroupedViewController>(
      builder: (GroupedViewController controller) {
        List<MsgData> msgData = controller.chatMsgList;
        return GroupedListView<MsgData, String>(
          useStickyGroupSeparators: true,
          cacheExtent: 10000,
          floatingHeader: true,
          shrinkWrap: true,
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
          reverse: true,
          groupComparator: (value1, value2) => value2.compareTo(value1),
          elements: msgData,
          groupSeparatorBuilder: (String groupByValue) {
            return ChatDateWidget(date: groupByValue);
          },
          indexedItemBuilder: (context, messageDatas, index) {
            final messageData = controller.chatMsgList[index];
            List<StudentData> student = messageData.studentData ?? [];
            StudentData? relation =
                student.isNotEmpty ? student.first : StudentData();
            String relationData =
                "${relation.relation ?? ''} ${relation.relation != null ? 'of' : ''} ${messageData.messageFrom ?? '--'}";
            return "${messageData.messageFromId}" == userId
                ? SentMessageBubble(
                    message: messageData.message ?? '',
                    time: messageData.sendAt,
                    replay: true,
                    audio: messageData.messageAudio,
                    fileName: messageData.fileName,
                    fileLink: messageData.messageFile,
                    messageData: messageData,
                    index: index,
                  )
                : ReceiveMessageBubble(
                    senderName: student.isNotEmpty
                        ? messageData.studentData?.first.studentName ?? '--'
                        : '--',
                    message: messageData.message,
                    time: messageData.sendAt,
                    replay: true,
                    audio: messageData.messageAudio,
                    fileName: messageData.fileName,
                    fileLink: messageData.messageFile,
                    messageData: messageData,
                    relation: relationData,
                    index: index,
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
      this.messageData,
      required this.index});

  late Offset _tapPosition;

  bool? replay;
  String? time;
  String? message;
  MsgData? messageData;
  String? audio;
  String? fileName;
  String? fileLink;
  // String? senderId;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      index: index,
      highlightColor: Colors.teal.shade200,
      controller: Get.find<GroupedViewController>()
          .chatGroupedViewScrollController
          .value,
      key: ValueKey(index),
      child: SizedBox(
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
                                  ? ReplayMessageWidget3(
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
      this.relation,
      required this.index});

  bool? replay;
  String? time;
  String? message;
  String? audio;
  String? fileName;
  String? fileLink;
  String? senderName;
  MsgData? messageData;
  String? relation;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      index: index,
      highlightColor: Colors.teal.shade200,
      controller: Get.find<GroupedViewController>()
          .chatGroupedViewScrollController
          .value,
      key: ValueKey(index),
      child: SizedBox(
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
                                    constraints: BoxConstraints(maxWidth: 70.w),
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
                                    constraints:
                                        BoxConstraints(maxWidth: 150.w),
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
                                  ? ReplayMessageWidget3(
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
                                    style: TeacherAppFonts
                                        .interW400_12sp_topicbackground
                                        .copyWith(
                                            color:
                                                Colors.black.withOpacity(.25)),
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
      ),
    );
  }
}

class ReplayMessageWidget3 extends StatelessWidget {
  ReplayMessageWidget3({super.key, required this.replyData, this.senderId});
  final ReplyData replyData;
  final String? senderId;
  // FeedViewController feedViewController = Get.find<FeedViewController>();
  UserAuthController userAuthController = Get.find<UserAuthController>();
  @override
  Widget build(BuildContext context) {
    final data = AllChatRoomDataInheritedWidget.of(context);
    return GestureDetector(
      onTap: () async {
        Get.find<GroupedViewController>().chatMsgCount = 1000;
        ChatFeedViewReqModel chatFeedViewReqModel = ChatFeedViewReqModel(
          teacherId: userAuthController.userData.value.userId,
          schoolId: userAuthController.userData.value.schoolId,
          classs: data?.classs,
          batch: data?.batch,
          subjectId: data?.subjectId,
          offset: 0,
          limit: Get.find<GroupedViewController>().chatMsgCount,
        );
        print("message number = id = ${replyData.messageId}");
        // print(
        //     "message number = userAuthController.userData.value.userId = ${userAuthController.userData.value.userId}");
        // print(
        //     "message number = userAuthController.userData.value.schoolId = ${userAuthController.userData.value.schoolId}");
        // print(
        //     "message number =  data?.msgData?.classTeacherClass = ${data?.msgData?.classTeacherClass}");
        // print(
        //     "message number = data?.msgData?.batch = ${data?.msgData?.batch}");
        // print(
        //     "message number = data?.msgData?.subjectId = ${data?.msgData?.subjectId}");

        int? index = await Get.find<GroupedViewController>().findMessageIndex(
            reqBody: chatFeedViewReqModel, msgId: replyData.messageId);

        print("message number = index = $index");

        if (index != null) {
          await Get.find<GroupedViewController>()
              .chatGroupedViewScrollController
              .value
              .scrollToIndex(
                index,
                preferPosition: AutoScrollPosition.middle,
              );
          await Get.find<GroupedViewController>()
              .chatGroupedViewScrollController
              .value
              .highlight(index,
                  highlightDuration: const Duration(seconds: 1),
                  animated: true);
        } else {
          snackBar(
              context: context,
              message: "Message not found",
              color: Colorutils.Classcolour1);
        }
      },
      child: Padding(
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
                      color: senderId ==
                              Get.find<UserAuthController>()
                                  .userData
                                  .value
                                  .userId
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
      ),
    );
  }
}

class AllChatRoomDataInheritedWidget extends InheritedWidget {
  final String? classs;
  final String? batch;
  final String? subjectId;
  const AllChatRoomDataInheritedWidget({
    this.classs,
    this.batch,
    this.subjectId,
    required Widget child,
  }) : super(child: child);

  static AllChatRoomDataInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AllChatRoomDataInheritedWidget>();
  }

  @override
  bool updateShouldNotify(AllChatRoomDataInheritedWidget oldWidget) {
    // return int1 != oldWidget.int1 || int2 != oldWidget.int2;
    return classs != oldWidget.classs ||
        batch != oldWidget.batch ||
        subjectId != oldWidget.subjectId;
  }
}
