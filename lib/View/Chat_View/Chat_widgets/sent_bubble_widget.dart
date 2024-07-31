import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/Chat_View/Chat_widgets/replay_in_message_widget.dart';

import '../../../Models/api_models/chat_feed_view_model.dart';
import '../../../Utils/font_util.dart';
import '../group_msg_screen.dart';
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
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      _tapPosition = details.globalPosition;
                      print(_tapPosition);
                      print(ScreenUtil().screenHeight);
                    },
                    onLongPress: () {
                      Get.find<FeedViewController>().seletedMsgData = messageData;
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
