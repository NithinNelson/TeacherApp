

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/api_controllers/groupedViewListController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/View/Chat_List/chat_list_widgets/last_seen_msg.dart';

import '../../../Controller/api_controllers/chatClassGroupController.dart';
import '../../../Models/api_models/chat_group_api_model.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/font_util.dart';
import '../../Chat_View/class_message_view.dart';
import '../../Chat_View/group_msg_screen.dart';

class GroupChatList extends StatelessWidget {
  const GroupChatList({super.key});

  @override
  Widget build(BuildContext context) {
    // int colorInt = 0;
    return GetX<ChatClassGroupController>(
      builder: (ChatClassGroupController controller) {
        List<ClassTeacherGroup> classTeacherGroups = controller.classGroupList.value;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: classTeacherGroups.length,
          padding: const EdgeInsets.all(0),
          itemBuilder: (BuildContext context, int index) {
            LastMessageGroupChat? lastMsg = controller.classGroupList[index].lastMessage!.isNotEmpty ? controller.classGroupList[index].lastMessage?.first : LastMessageGroupChat();
            DateTime? sentTime = lastMsg?.sandAt;
            String? formattedDate;
            // if(colorInt > 4) {
            //   colorInt = 0;
            // }
            // colorInt++;
            // print("-------colorInt---------$colorInt");
            try {
              formattedDate = DateFormat('EEE hh:mm a').format(sentTime!);
            } catch(e) {}
            String? userId = Get.find<UserAuthController>().userData.value.userId;
            return ChatItem(
              // className: classTeacherGroups[index].subjectName ?? '--',
              time: formattedDate ?? '',
              unreadMessages: classTeacherGroups[index].unreadCount ?? 0,
              // classs: '${classTeacherGroups[imkvkosdmvksfmnvbndex].classTeacherClass}${classTeacherGroups[index].batch}',
              lastMessage: lastMsg,
              userId: userId,
              classTeacherGroup: classTeacherGroups[index],
              avatarColor: Colorutils.chatLeadingColors[index % 5],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 0.3,
              indent: 15,
              endIndent: 15,
            );
          },
        );
      },
    );
  }
}

class ChatItem extends StatelessWidget {
  final String time;
  final int? unreadMessages;
  final String? userId;
  final LastMessageGroupChat? lastMessage;
  final ClassTeacherGroup? classTeacherGroup;
  final Color? avatarColor;

  const ChatItem({super.key,
    required this.time,
    required this.unreadMessages,
    required this.userId,
    required this.lastMessage,
    required this.classTeacherGroup,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<GroupedViewListController>().setPayload(
            stdClass: classTeacherGroup?.classTeacherClass ?? '',
            stdBatch: classTeacherGroup?.batch ?? '',
            subId: classTeacherGroup?.subjectId ?? '',
        );
        if(classTeacherGroup?.subjectId == "class_group") {
          Get.find<FeedViewController>().tabControllerIndex.value = 0;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroupMsgScreen(
                  msgData: classTeacherGroup,
                ),
              ));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ClassMessageView(
                  msgData: classTeacherGroup,
                ),
              ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10).w,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: avatarColor,
              radius: 28.r,
              child: FittedBox(
                child: Text(
                  '${classTeacherGroup?.classTeacherClass}${classTeacherGroup?.batch}',
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
                                classTeacherGroup?.subjectName ?? '--',
                                style: TeacherAppFonts.interW700_16sp_black,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
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
                            LastSeenMsgGroupChat(lastMessage: lastMessage),
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
