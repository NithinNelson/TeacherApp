import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/search_controller/search_controller.dart';
import 'package:teacherapp/Services/common_services.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/Chat_View/Chat_widgets/replay_in_message_widget.dart';

import '../../../Models/api_models/chat_feed_view_model.dart';
import '../../../Utils/font_util.dart';
import '../feed_view _chat_screen.dart';
import 'audio_widget.dart';
import 'file_widget.dart';

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
      required this.index,
      required this.widget});

  late Offset _tapPosition;

  bool? replay;
  String? time;
  String? message;
  MsgData? messageData;
  String? audio;
  String? fileName;
  String? fileLink;
  // String? senderId;+
  final int index;
  final FeedViewChatScreen widget;
  @override
  @override
  Widget build(BuildContext context) {
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
                                HapticFeedback.vibrate();

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

                                // messageMoreShowDialog(
                                //     context, this, position, _tapPosition);

                                print(
                                    "msg ============= id ${Get.find<FeedViewController>().seletedMsgData!.messageId}");
                              },
                              child: IntrinsicWidth(
                                child: Container(
                                  constraints: BoxConstraints(maxWidth: 310.w),
                                  decoration: BoxDecoration(
                                      color: Colorutils.msgBubbleColor1,
                                      borderRadius:
                                          BorderRadius.circular(10.h)),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.h),
                                    child: Column(
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
                                                              FontWeight.w400,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.25))),
                                                ],
                                              )
                                            : const SizedBox(),
                                        messageData!.replyData != null
                                            ? ReplayMessageWidget(
                                                senderId:
                                                    messageData!.messageFromId,
                                                replyData:
                                                    messageData!.replyData!,
                                              )
                                            : const SizedBox(),
                                        fileName != null
                                            ? FileWidget1(
                                                fileType:
                                                    fileName!.split(".").last,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              children: [
                                                // ConstrainedBox(
                                                //   constraints: BoxConstraints(
                                                //     maxWidth: 200.w,
                                                //   ),
                                                //   child: Text(
                                                //     message ?? "",
                                                //     // maxLines: 100,
                                                //     style: TeacherAppFonts
                                                //         .interW400_16sp_letters1
                                                //         .copyWith(color: Colors.black),
                                                //   ),
                                                // ),
                                                ConstrainedBox(
                                                  constraints: BoxConstraints(
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
                                                              children: Get.find<
                                                                      FeedViewController>()
                                                                  .getMessageText(
                                                                      text:
                                                                          message ??
                                                                              "",
                                                                      context:
                                                                          context),
                                                              style: TeacherAppFonts
                                                                  .interW400_16sp_letters1
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .black)),
                                                        );
                                                      } else {
                                                        return RichText(
                                                          text: TextSpan(
                                                            children: Get
                                                                    .find<
                                                                        ChatSearchController>()
                                                                .getCombinedTextSpan(
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
                                                              .withOpacity(
                                                                  .25)),
                                                ),
                                                SizedBox(width: 5.h),
                                                // SizedBox(
                                                //   height: 21.h,
                                                //   width: 21.h,
                                                //   child: SizedBox(
                                                //     height: 21.h,
                                                //     width: 21.h,
                                                //     child: Center(
                                                //       child: Icon(
                                                //         Icons.check,
                                                //         color: Colors.grey,
                                                //         size: 16.h,
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                                SizedBox(
                                                  height: 21.h,
                                                  width: 21.h,
                                                  child: SvgPicture.asset(
                                                      "assets/images/Checks.svg",
                                                      color: messageData
                                                                  ?.read ==
                                                              null
                                                          ? Colors.grey
                                                          : messageData!.read!
                                                              ? Colors.green
                                                                  .shade900
                                                              : Colors.grey),
                                                ),
                                                // SizedBox(
                                                //   height: 21.h,
                                                //   width: 21.h,
                                                //   child: widget.msgData
                                                //               ?.isClassTeacher ==
                                                //           true
                                                //       ? SizedBox(
                                                //           height: 21.h,
                                                //           width: 21.h,
                                                //           child: Center(
                                                //             child: Icon(
                                                //               Icons.check,
                                                //               color: Colors.grey,
                                                //               size: 16.h,
                                                //             ),
                                                //           ),
                                                //         )
                                                //       : SvgPicture.asset(
                                                //           "assets/images/Checks.svg",
                                                //           color:
                                                //               messageData?.read == null
                                                //                   ? Colors.grey
                                                //                   : messageData!.read!
                                                //                       ? Colors.green
                                                //                           .shade900
                                                //                       : Colors.grey),
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
              ),
              messageData?.incomingReact != null
                  ? messageData!.incomingReact!.isEmpty
                      ? const SizedBox()
                      : hSpace(20.h)
                  : const SizedBox()
            ],
          ),
          messageData?.incomingReact != null
              ? messageData!.incomingReact!.isEmpty
                  ? const SizedBox()
                  : Positioned(
                      bottom: 0,
                      // right: isGroup ? 90.w : 50.w,
                      right: 50.w,
                      child: GestureDetector(
                        onTap: () {
                          reactionBottomSheet(
                              context, messageData!.incomingReact!);
                        },
                        child: Card(
                          elevation: 2,
                          child: Container(
                            height: 30.h,
                            // width: 40.h,
                            decoration: BoxDecoration(
                              color: Colorutils.white,
                              borderRadius: BorderRadius.circular(20.h),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Center(
                                  child: FittedBox(
                                      child: Row(
                                children: [
                                  messageData!.incomingReact!.length >= 1
                                      ? Text(
                                          messageData!.incomingReact![0].react!)
                                      : const SizedBox(),
                                  messageData!.incomingReact!.length >= 2
                                      ? Text(
                                          messageData!.incomingReact![1].react!)
                                      : const SizedBox(),
                                  messageData!.incomingReact!.length >= 3
                                      ? Text(
                                          "${messageData!.incomingReact!.length - 2}")
                                      : const SizedBox(),
                                ],
                              ))),
                            ),
                          ),
                        ),
                      ),
                    )
              : const SizedBox(),
        ],
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

String chatRoomFormatTime(String? dateTime) {
  // Check if the input date-time string is null
  if (dateTime == null) {
    return "";
  }
  // Parse the input date-time string
  DateTime parsedDateTime = DateTime.parse(dateTime);

  // Format the parsed DateTime to the desired format
  String formattedDateTime = DateFormat('E h:mm a').format(parsedDateTime);

  return formattedDateTime;
}

String messageInfoformatDate(String? dateTimeString) {
  if (dateTimeString == null) {
    return "--";
  }
  // Parse the given date time string
  DateTime givenTime = DateTime.parse(dateTimeString);
  // Get the current time
  DateTime now = DateTime.now();

  // Calculate the difference in time
  Duration difference = now.difference(givenTime);

  // If the given time is today
  if (givenTime.year == now.year &&
      givenTime.month == now.month &&
      givenTime.day == now.day) {
    if (difference.inMinutes < 1) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Today';
    }
  }

  // If the given time was yesterday
  DateTime yesterday = now.subtract(Duration(days: 1));
  if (givenTime.year == yesterday.year &&
      givenTime.month == yesterday.month &&
      givenTime.day == yesterday.day) {
    return 'Yesterday';
  }

  // Otherwise, return the date in "MMM dd" format
  return DateFormat('MMM dd').format(givenTime);
}

String messageInfoformatTime(String? dateTimeString) {
  if (dateTimeString == null) {
    return "--";
  }
  // Parse the given date time string
  DateTime givenTime = DateTime.parse(dateTimeString);

  // Format the given time to "h:mm a" format
  String formattedTime = DateFormat('h:mma').format(givenTime);

  return formattedTime;
}

reactionBottomSheet(BuildContext context, List<IncomingReact> reactionList) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        width: double.infinity,
        height: ScreenUtil().screenHeight / 2,
        color: Colorutils.white,
        child: Column(
          children: [
            hSpace(15.h),
            Container(
              height: 5.h,
              width: 80.w,
              decoration: BoxDecoration(
                  color: Colorutils.grey,
                  borderRadius: BorderRadius.circular(100.h)),
            ),
            hSpace(15.h),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reacted by",
                  style: TeacherAppFonts.interW600_18sp_textWhite
                      .copyWith(color: Colors.teal),
                ),
              ),
            ),
            const Divider(
              height: 0,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            reactionList[index].reactBy ?? "--",
                            style: TeacherAppFonts.interW500_16sp_textWhiteOp60
                                .copyWith(color: Colorutils.black),
                          ),
                          const Spacer(),
                          Text(reactionList[index].react ?? "--",
                              style: TextStyle(fontSize: 20.h))
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 0,
                    );
                  },
                  itemCount: reactionList.length),
            )
          ],
        ),
      );
    },
  );
}
