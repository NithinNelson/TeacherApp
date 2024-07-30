
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:teacherapp/Controller/api_controllers/parentChatListController.dart';
import 'package:teacherapp/View/Chat_View/parent_msg_screen.dart';
import '../../../Controller/api_controllers/userAuthController.dart';
import '../../../Models/api_models/parent_chat_list_api_model.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/font_util.dart';

class ParentChatList extends StatelessWidget {
  const ParentChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GetX<ParentChatListController>(
            builder: (ParentChatListController controller) {
              int currentIndex = controller.currentTab.value;
              return Container(
                height: 50.w,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.setTab(0);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14).w,
                        decoration: BoxDecoration(
                          color: currentIndex == 0 ? Colorutils.buttoncolor : Colorutils.unselectedTab,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.1),
                            ),
                          ],
                        ),
                        child: Text(
                          'All',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 5.w
                    ),

                    InkWell(
                      onTap: () {
                        controller.setTab(1);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12).w,
                        decoration: BoxDecoration(
                          color: currentIndex == 1 ? Colorutils.buttoncolor : Colorutils.unselectedTab,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.1),
                            ),
                          ],
                        ),
                        child: Text(
                          'Unread',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //     width: 5.w
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12).w,
                    //   decoration: BoxDecoration(
                    //     color: Colorutils.buttoncolor,
                    //     borderRadius: BorderRadius.circular(15),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(
                    //             0.1),
                    //       ),
                    //     ],
                    //   ),
                    //   child: Text(
                    //     'By Class',
                    //     style: GoogleFonts.inter(
                    //       color: Colors.black,
                    //       fontSize: 13.sp,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
        GetX<ParentChatListController>(
          builder: (ParentChatListController controller) {
            List<Datum> chatParentList = controller.parentChatList.value;
            print("---------sentTime----------${controller.parentChatList.value.first.lastMessage?.sandAt}");
            return Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: chatParentList.length,
                itemBuilder: (BuildContext context, int index) {
                  LastMessage? lastMsg = chatParentList[index].lastMessage ?? LastMessage();
                  DateTime? sentTime = lastMsg.sandAt;
                  String? formattedDate;
                  try {
                    formattedDate = DateFormat('EEE hh:mm a').format(sentTime!);
                  } catch(e) {}
                  String? userId = Get.find<UserAuthController>().userData.value.userId;
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ParentMsgScreen();
                          },
                      ),
                      );
                    },
                    child: ChatItem(
                      parentName: chatParentList[index].parentName ?? '--',
                      time: formattedDate ?? '',
                      unreadMessages: chatParentList[index].unreadCount,
                      classs: '${chatParentList[index].datumClass}${chatParentList[index].batch}',
                      lastMessage: chatParentList[index].lastMessage,
                      studentName: chatParentList[index].studentName ?? '',
                      relation: chatParentList[index].relation,
                      userId: userId,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 0.3,
                    indent: 8,
                    endIndent: 8,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  final String parentName;
  final String studentName;
  final String? relation;
  final String time;
  final String? unreadMessages;
  final String classs;
  final LastMessage? lastMessage;
  final String? userId;
  // final String Parentdetail;
  // final String classsdetail;

  const ChatItem({super.key,
    required this.parentName,
    required this.studentName,
    required this.relation,
    required this.time,
    required this.unreadMessages,
    required this.classs,
    required this.lastMessage,
    required this.userId,
    // required this.Parentdetail,
    // required this.classsdetail,
  });

  @override
  Widget build(BuildContext context) {
    final random = Random();
    int randomIndex = random.nextInt(Colorutils.chatLeadingColors.length);
    Color randomElement = Colorutils.chatLeadingColors[randomIndex];
    return Padding(
      padding: EdgeInsets.all(15.h),
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
          // Container(
          //   padding: const EdgeInsets.all(1).w,
          //   decoration: BoxDecoration(
          //     color: Colors.grey,
          //     borderRadius: BorderRadius.circular(100).r,
          //   ),
          //   child: Container(
          //     padding: const EdgeInsets.all(10).w,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(100).r,
          //     ),
          //     child: CachedNetworkImage(
          //       imageUrl: '--',
          //       errorWidget: (context, txt, obj) => const Icon(Icons.person, color: Colors.grey),
          //     ),
          //   ),
          // ),
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
                              studentName,
                              style: TeacherAppFonts.interW700_16sp_black,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              relation != null ? "$relation of $parentName" : parentName,
                              overflow: TextOverflow.ellipsis,
                              style: TeacherAppFonts.poppinsW400_12sp_lightGreenForParent,
                            ),
                          ),
                        ],
                      ),
                      if(userId != null && lastMessage != null)
                        if(userId == lastMessage!.messageFromId)
                          SizedBox(width: 5.h),
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
                          ),
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5).w,
                decoration: BoxDecoration(
                  color: Colorutils.Whitecolor,
                  borderRadius: BorderRadius.circular(20).r,
                  border: Border.all(
                    color: randomElement,
                  ),
                ),
                child: Text(
                  "Class $classs",
                  style: TeacherAppFonts.interW500_12sp_textWhite.copyWith(
                    color: randomElement,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                time,
                style: TeacherAppFonts.interW400_12sp_topicbackground,
              ),
              SizedBox(height: 5.h),
              if(unreadMessages != null)
                if(unreadMessages != "0")
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
    );
    // return Container(
    //   height: 60,
    //   child: ListTile(
    //     leading: CircleAvatar(
    //       radius: 25,
    //       child: Text(
    //         classs,
    //         style: GoogleFonts.inter(
    //             fontSize: 16.0,
    //             fontWeight: FontWeight.w500,
    //             color: Colors.black),
    //       ),
    //     ),
    //     title: Text(
    //       className,
    //       style: GoogleFonts.inter(
    //           fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    //     ),
    //     subtitle: Text(
    //       message,
    //       style: GoogleFonts.inter(
    //           fontSize: 13.0, fontWeight: FontWeight.w400, color: Colors.black),
    //     ),
    //     trailing: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(time),
    //         SizedBox(height: 5),
    //         if (unreadMessages > 0)
    //           CircleAvatar(
    //             radius: 10,
    //             backgroundColor: Colorutils.userdetailcolor,
    //             child: Text(
    //               unreadMessages.toString(),
    //               style: TextStyle(color: Colors.white, fontSize: 12),
    //             ),
    //           ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
