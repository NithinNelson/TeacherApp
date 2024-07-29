

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';

import '../../../Controller/api_controllers/chatClassGroupController.dart';
import '../../../Models/api_models/chat_group_api_model.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/font_util.dart';
import '../../Chat_View/group_msg_screen.dart';

class GroupChatList extends StatelessWidget {
  const GroupChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ChatClassGroupController>(
      builder: (ChatClassGroupController controller) {
        List<ClassTeacherGroup> classTeacherGroups = controller.classGroupList.value;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: classTeacherGroups.length,
          padding: const EdgeInsets.all(0),
          itemBuilder: (BuildContext context, int index) {
            LastMessage? lastMsg = controller.classGroupList[index].lastMessage!.isNotEmpty ? controller.classGroupList[index].lastMessage?.first : LastMessage();
            DateTime? sentTime = lastMsg?.sandAt;
            String? formattedDate;
            try {
              formattedDate = DateFormat('EEE hh:mm a').format(sentTime!);
            } catch(e) {}
            String? userId = Get.find<UserAuthController>().userData.value.userId;
            return ChatItem(
              className: classTeacherGroups[index].subjectName ?? '--',
              time: formattedDate ?? '',
              unreadMessages: classTeacherGroups[index].unreadCount ?? 0,
              classs: '${classTeacherGroups[index].classTeacherClass}${classTeacherGroups[index].batch}',
              lastMessage: lastMsg,
              userId: userId,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 0.3,
              indent: 8,
              endIndent: 8,
            );
          },
        );
      },
    );
  }
}

class ChatItem extends StatelessWidget {
  final String className;
  final String time;
  final int? unreadMessages;
  final String classs;
  final String? userId;
  final LastMessage? lastMessage;

  const ChatItem({super.key,
    required this.className,
    required this.time,
    required this.unreadMessages,
    required this.classs,
    required this.userId,
    required this.lastMessage,
  });

  @override
  Widget build(BuildContext context) {
    final random = Random();
    int randomIndex = random.nextInt(Colorutils.chatLeadingColors.length);
    Color randomElement = Colorutils.chatLeadingColors[randomIndex];
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroupMsgScreen(),
            ));
        // Get.find<ChatRoomController>().timer!.cancel();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10).w,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: randomElement,
              radius: 25.r,
              child: FittedBox(
                child: Text(
                  classs,
                  style: TeacherAppFonts.interW600_14sp_textWhite,
                ),
              ),
            ),
            SizedBox(width: 15.h),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              constraints: const BoxConstraints(
                                  maxWidth: 120),
                              child: Text(
                                // "English",
                                className,
                                style: TeacherAppFonts.interW700_16sp_black,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            if(userId != null && lastMessage != null)
                              if(userId == lastMessage!.messageFromId)
                                SizedBox(
                                  height: 21.h,
                                  width: 21.h,
                                  child: SvgPicture.asset(
                                    "assets/images/Checks.svg",
                                    color: lastMessage!.read! ? Colors.green : Colors.grey,
                                  ),
                                ),

                            if(userId != null && lastMessage != null)
                              if(userId == lastMessage!.messageFromId)
                                SizedBox(width: 5.h),
                            Expanded(
                              child: Builder(builder: (context) {
                                if (lastMessage != null) {
                                  if (lastMessage!.type == "file") {
                                    return Row(
                                      children: [
                                        Container(
                                          width: 17,
                                          height: 18,
                                          decoration:
                                          const BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  "assets/images/new-document.png"),
                                            ),
                                          ),
                                          child: Center(
                                            child: SizedBox(
                                              height: 8,
                                              width: 12,
                                              child: FittedBox(
                                                child: Text(
                                                  lastMessage!.fileName!
                                                      .split(".")
                                                      .last,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        Expanded(
                                          child: Text(
                                            lastMessage!
                                                .fileName!,
                                            style: TeacherAppFonts.interW400_14sp_textWhite.copyWith(
                                              color: Color(0xff535353).withOpacity(0.8),
                                            ),
                                            overflow: TextOverflow
                                                .ellipsis,
                                          ),
                                        )
                                      ],
                                    );
                                  } else if (lastMessage!
                                      .type ==
                                      "text") {
                                    return Text(
                                      // "Can you pls share the pdf adsdaddsf.",
                                      lastMessage?.message ?? "--",
                                      overflow:
                                      TextOverflow.ellipsis,

                                      style: TeacherAppFonts.interW400_14sp_textWhite.copyWith(
                                        color: Color(0xff535353).withOpacity(0.8),
                                      ),
                                    );
                                  } else if (lastMessage!.type ==
                                      "audio") {
                                    return Row(
                                      children: [
                                        SizedBox(
                                          width: 22,
                                          height: 15.h,
                                          child: SvgPicture.asset(
                                              "assets/images/Record Audio.svg"),
                                        ),
                                        SizedBox(width: 1.w),
                                        Expanded(
                                          child: Text(
                                            "Audio",
                                            style: TeacherAppFonts.interW400_14sp_textWhite.copyWith(
                                              color: Color(0xff535353).withOpacity(0.8),
                                            ),
                                            overflow: TextOverflow
                                                .ellipsis,
                                          ),
                                        )
                                      ],
                                    );
                                  } else if (lastMessage!.type ==
                                      "text_file" || lastMessage!.type == "text_audio") {
                                    return Text(
                                      // "Can you pls share the pdf adsdaddsf.",
                                      lastMessage!.message ?? "--",
                                      overflow:
                                      TextOverflow.ellipsis,

                                      style: TeacherAppFonts.interW400_14sp_textWhite.copyWith(
                                        color: Color(0xff535353).withOpacity(0.8),
                                      ),
                                    );
                                  }
                                }
                                return const SizedBox();
                              }),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TeacherAppFonts.interW400_12sp_topicbackground,
                ),
                SizedBox(height: 10.h),
                if(unreadMessages != null)
                  if(unreadMessages != 0)
                    Container(
                      height: 23.h,
                      width: 23.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colorutils.topicbackground),
                      child: Center(
                        child: Text(
                          unreadMessages.toString(),
                          style: TeacherAppFonts.interW600_14sp_textWhite,
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      height: 23.h,
                      width: 23.h,
                    )
                else
                  SizedBox(
                    height: 23.h,
                    width: 23.h,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
