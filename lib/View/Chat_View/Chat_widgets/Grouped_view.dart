import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Models/api_models/chat_group_api_model.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/font_util.dart';
import '../group_msg_screen.dart';
import '../grouped_view_msg_screen.dart';

class GroupedViewChat extends StatelessWidget {
  const GroupedViewChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ChatItem(
          className: 'English',
          time: '10:53 am',
          unreadMessages: 6,
          classs: '4A',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Arabic',
          time: '08:22 am',
          unreadMessages: 3,
          classs: '5A',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Science',
          time: 'Yesterday',
          unreadMessages: 1,
          classs: '6A',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Maths',
          time: '11:30 pm',
          unreadMessages: 0,
          classs: '7B',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Zology',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Science',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '6A',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Maths 2',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Chemistry',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Biology',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Mechanical',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Physics',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: '',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
          lastMessage: LastMessage(
            message: "Hii....this is last message",
            sandAt: DateTime.now(),
          ),
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
      ],
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
              builder: (context) => GroupedViewMsgScreen(),
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
                                'last message',
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
