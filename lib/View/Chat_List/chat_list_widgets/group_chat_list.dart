

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
            return ChatItem(
              className: classTeacherGroups[index].subjectName ?? '--',
              time: formattedDate ?? '',
              unreadMessages: classTeacherGroups[index].unreadCount ?? 0,
              classs: '${classTeacherGroups[index].classTeacherClass}${classTeacherGroups[index].batch}',
              lastMessage: lastMsg,
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
  final LastMessage? lastMessage;

  const ChatItem({super.key,
    required this.className,
    required this.time,
    required this.unreadMessages,
    required this.classs,
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
                            SizedBox(
                              height: 21.h,
                              width: 21.h,
                              child: SvgPicture.asset(
                                  "assets/images/Checks.svg"),
                            ),
                            SizedBox(width: 5.h),
                            Expanded(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                lastMessage?.message ?? '',
                                style: TeacherAppFonts.interW400_14sp_chatSubTitleOp80,
                              ),
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
