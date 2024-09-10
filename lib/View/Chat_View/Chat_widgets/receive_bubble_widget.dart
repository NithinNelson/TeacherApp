import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/search_controller/search_controller.dart';
import 'package:teacherapp/Models/api_models/chat_feed_view_model.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/api_constants.dart';
import 'package:teacherapp/View/Chat_View/Chat_widgets/replay_in_message_widget.dart';
import 'package:teacherapp/View/Chat_View/Chat_widgets/sent_bubble_widget.dart';

import '../../../Utils/font_util.dart';
import '../feed_view _chat_screen.dart';
import 'audio_widget.dart';
import 'file_widget.dart';

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
      this.subject,
      required this.index,
      required this.widget});

  late Offset _tapPosition;

  bool? replay;
  String? time;
  String? message;
  String? audio;
  String? fileName;
  String? fileLink;
  String? senderName;
  String? subject;
  MsgData? messageData;
  final int index;
  final FeedViewChatScreen widget;

  @override
  Widget build(BuildContext context) {
    List<StudentData> student = messageData?.studentData ?? [];
    StudentData? relation = student.isNotEmpty ? student.first : StudentData();
    String msgLeftSideTitle = student.isNotEmpty
        ? student.first.studentName ?? "--"
        : messageData?.messageFrom ?? "--";
    // String relationData =
    //     "${relation.relation ?? ''} ${relation.relation != null ? 'of' : ''} ${messageData?.messageFrom ?? '--'}";
    String msgRightSideTitle = student.isNotEmpty
        ? "${relation.relation ?? ''} ${relation.relation != null ? 'of' : ''} ${messageData?.messageFrom ?? '--'}"
        : messageData?.subjectName ?? "--";
    return AutoScrollTag(
      index: index,
      highlightColor: Colors.teal.shade200,
      controller:
          Get.find<FeedViewController>().chatFeedViewScrollController.value,
      key: ValueKey(index),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      widget.msgData?.isClassTeacher == true
                          ? Container(
                              height: 40.h,
                              width: 40.h,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colorutils.white),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.h),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${ApiConstants.downloadUrl}${messageData!.userImage}',
                                  placeholder: (context, url) => SizedBox(
                                    height: 27.h,
                                    width: 27.h,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      SizedBox(
                                    height: 27.h,
                                    width: 27.h,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      Stack(
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
                                Get.find<FeedViewController>().seletedMsgData =
                                    messageData;
                                final renderObject =
                                    context.findRenderObject() as RenderBox;
                                final position =
                                    renderObject.localToGlobal(Offset.zero);

                                if (Get.find<FeedViewController>()
                                        .isShowDialogShow ==
                                    false) {
                                  Get.find<FeedViewController>()
                                      .seletedMsgData = messageData;

                                  messageMoreShowDialog(
                                      context, this, position, _tapPosition);
                                  Get.find<FeedViewController>()
                                      .isShowDialogShow = true;
                                }

                                print(
                                    "msg ============= id ${Get.find<FeedViewController>().seletedMsgData!.messageId}");
                                print(
                                    "msg ============= parent id ${Get.find<FeedViewController>().seletedMsgData!.messageFromId}");
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
                                            messageData!.isForward ?? false
                                                ? Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 14.h,
                                                        width: 14.h,
                                                        child: SvgPicture.asset(
                                                          "assets/images/ArrowBendUpRight.svg",
                                                          color: Colors.black
                                                              .withOpacity(.25),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text("Forwarded",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.25))),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                      maxWidth: 70.w),
                                                  child: Text(
                                                    "~ ${msgLeftSideTitle}",
                                                    // ",",
                                                    // senderName == null
                                                    //     ? "--"
                                                    //     : "~ ${senderName?.split(" ").first ?? ""}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TeacherAppFonts
                                                        .interW500_12sp_textWhite
                                                        .copyWith(
                                                            color: Colorutils
                                                                .fontColor5),
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                Container(
                                                  constraints: BoxConstraints(
                                                      maxWidth: 150.w),
                                                  child: Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.right,
                                                    // "Arabic",
                                                    msgRightSideTitle,

                                                    style: TeacherAppFonts
                                                        .interW400_12sp_textWhite_italic
                                                        .copyWith(
                                                            color: Colorutils
                                                                .fontColor10),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            messageData!.replyData != null
                                                ? ReplayMessageWidget(
                                                    senderId: messageData!
                                                        .messageFromId,
                                                    replyData:
                                                        messageData!.replyData!,
                                                  )
                                                : const SizedBox(),
                                            fileName != null
                                                ? FileWidget2(
                                                    fileType: fileName!
                                                        .split(".")
                                                        .last,
                                                    fileName: fileName!,
                                                    fileLink: fileLink!,
                                                  )
                                                : const SizedBox(),
                                            audio != null
                                                ? AudioWidget(content: audio!)
                                                : const SizedBox(),
                                            message != null &&
                                                        fileName != null ||
                                                    audio != null
                                                ? SizedBox(height: 5.h)
                                                : const SizedBox(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  children: [
                                                    // ConstrainedBox(
                                                    //   constraints: BoxConstraints(
                                                    //     maxWidth: 210.w,
                                                    //   ),
                                                    //   child: Text(
                                                    //     message ?? "",
                                                    //     maxLines: 100,
                                                    //     style: TeacherAppFonts
                                                    //         .interW400_16sp_letters1
                                                    //         .copyWith(
                                                    //             color:
                                                    //                 Colors.black),
                                                    //   ),
                                                    // ),
                                                    ConstrainedBox(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 210.w,
                                                      ),
                                                      child: GetX<
                                                          ChatSearchController>(
                                                        builder:
                                                            (chatSerchController) {
                                                          if (chatSerchController
                                                              .searchValue
                                                              .value
                                                              .isEmpty) {
                                                            return RichText(
                                                              text: TextSpan(
                                                                  children: Get
                                                                          .find<
                                                                              FeedViewController>()
                                                                      .getMessageText(
                                                                          text: message ??
                                                                              "",
                                                                          context:
                                                                              context),
                                                                  style: TeacherAppFonts
                                                                      .interW400_16sp_letters1
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.black)),
                                                            );
                                                          } else {
                                                            return RichText(
                                                              text: TextSpan(
                                                                children: Get.find<ChatSearchController>().getCombinedTextSpan(
                                                                    searchTerm:
                                                                        chatSerchController
                                                                            .searchValue
                                                                            .value,
                                                                    text:
                                                                        message ??
                                                                            "",
                                                                    context:
                                                                        context),
                                                                style: TeacherAppFonts
                                                                    .interW400_16sp_letters1
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .black),
                                                              ),
                                                            );
                                                          }
                                                        },
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
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  .25)),
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
                    ],
                  ),
                ),
              ),
              messageData!.myReact == null
                  ? const SizedBox()
                  : SizedBox(height: 20.h),
            ],
          ),
          messageData!.myReact == null
              ? const SizedBox()
              : Positioned(
                  bottom: 0,
                  left: widget.msgData?.isClassTeacher == true ? 90.w : 50.w,
                  child: Card(
                    elevation: 2,
                    child: Container(
                      height: 30.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.h),
                      ),
                      child: Center(
                          child: FittedBox(child: Text(messageData!.myReact!))),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
