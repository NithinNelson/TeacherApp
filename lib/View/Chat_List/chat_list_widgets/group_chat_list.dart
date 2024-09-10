import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/api_controllers/groupedViewListController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Services/common_services.dart';
import 'package:teacherapp/View/Chat_List/chat_list_widgets/last_seen_msg.dart';

import '../../../Controller/api_controllers/chatClassGroupController.dart';
import '../../../Models/api_models/chat_group_api_model.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/font_util.dart';
import '../../Chat_View/feed_view _chat_screen.dart';

class GroupChatList extends StatelessWidget {
  const GroupChatList({super.key});

  @override
  Widget build(BuildContext context) {
    // int colorInt = 0;
    return GetX<ChatClassGroupController>(
      builder: (ChatClassGroupController controller) {
        List<ClassTeacherGroup> classTeacherGroups = controller.classGroupList;
        if (controller.isLoading.value) {
          return ListView.separated(
              padding: const EdgeInsets.only(bottom: 15),
              itemBuilder: (context, index) => const ChatListShimmer(),
              separatorBuilder: (context, index) => const Divider(
                    color: Colorutils.dividerColor1,
                    height: 0,
                  ),
              itemCount: 10);
        } else if (controller.isError.value) {
          return const Center(child: Text("Error Occurred"));
        } else if (controller.classGroupList.isEmpty) {
          return const Center(child: Text("Empty chat list"));
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              await Get.find<ChatClassGroupController>().fetchClassGroupList();
            },
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: classTeacherGroups.length,
              padding: const EdgeInsets.all(0),
              itemBuilder: (BuildContext context, int index) {
                LastMessageGroupChat? lastMsg =
                    controller.classGroupList[index].lastMessage!.isNotEmpty
                        ? controller.classGroupList[index].lastMessage?.first
                        : LastMessageGroupChat();
                DateTime? sentTime = lastMsg?.sandAt;
                String? formattedDate;
                // if(colorInt > 4) {
                //   colorInt = 0;
                // }
                // colorInt++;
                // print("-------colorInt---------$colorInt");
                try {
                  print("date = $sentTime");
                  formattedDate = DateFormat('EEE hh:mm a').format(sentTime!);
                } catch (e) {}
                String? userId =
                    Get.find<UserAuthController>().userData.value.userId;
                return ChatItems(
                  // className: classTeacherGroups[index].subjectName ?? '--',
                  time: sentTime.toString(),
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
                  thickness: 0.2,
                  indent: 10,
                  endIndent: 10,
                  height: 0,
                  color: Colors.grey,
                );
              },
            ),
          );
        }
      },
    );
  }
}

class ChatItems extends StatelessWidget {
  final String time;
  final int? unreadMessages;
  final String? userId;
  final LastMessageGroupChat? lastMessage;
  final ClassTeacherGroup? classTeacherGroup;
  final Color? avatarColor;

  const ChatItems({
    super.key,
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
        // if(classTeacherGroup?.subjectId == "class_group") {
        Get.find<FeedViewController>().tabControllerIndex.value = 0;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FeedViewChatScreen(
                msgData: classTeacherGroup,
              ),
            ));
        // } else {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => ClassMessageView(
        //           msgData: classTeacherGroup,
        //         ),
        //       ));
        // }
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15).w,
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
                                constraints:
                                    const BoxConstraints(maxWidth: 120),
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
                              if (userId != null && lastMessage != null)
                                if (userId == lastMessage!.messageFromId)
                                  SizedBox(
                                    height: 21.h,
                                    width: 21.h,
                                    child: SvgPicture.asset(
                                      "assets/images/Checks.svg",
                                      color: lastMessage!.read!
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                  ),
                              if (userId != null && lastMessage != null)
                                if (userId == lastMessage!.messageFromId)
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
                    chatRoomDateAndTimeFormat(time),
                    style: TeacherAppFonts.interW400_12sp_topicbackground,
                  ),
                  SizedBox(height: 10.h),
                  if (unreadMessages != null)
                    if (unreadMessages != 0)
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
      ),
    );
  }
}

class ChatListShimmer extends StatelessWidget {
  const ChatListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colorutils.white,
          borderRadius: BorderRadius.circular(20.h),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.h),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                period: const Duration(milliseconds: 2500),
                child: Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colorutils.bgcolor11.withOpacity(.2),
                  ),
                ),
              ),
              wSpace(15.h),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      period: const Duration(milliseconds: 2500),
                      child: Container(
                        // width: ScreenUtil().screenWidth / 2,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: Colorutils.bgcolor11.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                      ),
                    ),
                    hSpace(10.h),
                    Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      period: const Duration(milliseconds: 2500),
                      child: Container(
                        // width: ScreenUtil().screenWidth / 2,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: Colorutils.bgcolor11.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                      ),
                    ),
                    //       hSpace(10.h),
                    //       Shimmer.fromColors(
                    //         baseColor: Colors.grey,
                    //         highlightColor: Colors.white,
                    //         period: const Duration(milliseconds: 2500),
                    //         child: Container(
                    //           // width: ScreenUtil().screenWidth / 2,
                    //           height: 14.h,
                    //           decoration: BoxDecoration(
                    //             color: Colorutils.bgcolor11.withOpacity(.2),
                    //             borderRadius: BorderRadius.circular(20.h),
                    //           ),
                    //         ),
                    //       ),
                  ],
                ),
              ),
              wSpace(15.h),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 50.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        period: const Duration(milliseconds: 2500),
                        child: Container(
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: Colorutils.bgcolor11.withOpacity(.2),
                            borderRadius: BorderRadius.circular(20.h),
                          ),
                        ),
                      ),
                      // Shimmer.fromColors(
                      //   baseColor: Colors.grey,
                      //   highlightColor: Colors.white,
                      //   period: const Duration(milliseconds: 2500),
                      //   child: Container(
                      //     height: 14.h,
                      //     decoration: BoxDecoration(
                      //       color: Colorutils.bgcolor11.withOpacity(.2),
                      //       borderRadius: BorderRadius.circular(20.h),
                      //     ),
                      //   ),
                      // ),
                      // hSpace(15.h),
                      Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        period: const Duration(milliseconds: 2500),
                        child: Container(
                          width: 20.h,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: Colorutils.bgcolor11.withOpacity(.2),
                            borderRadius: BorderRadius.circular(20.h),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
