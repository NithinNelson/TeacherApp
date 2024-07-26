
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/Chat_List/chat_widgets.dart';
import '../../Controller/api_controllers/chatClassGroupController.dart';
import '../../Models/api_models/chat_group_api_model.dart';
import '../../Utils/font_util.dart';
import '../Chat_View/Chat_widgets/chatnew.dart';
import 'Mychat/my_chat.dart';

class ChatWithParentsPage extends StatefulWidget {
  const ChatWithParentsPage({super.key});

  @override
  State<ChatWithParentsPage> createState() => _ChatWithParentsPageState();
}

class _ChatWithParentsPageState extends State<ChatWithParentsPage>
    with SingleTickerProviderStateMixin {
  ChatClassGroupController chatClassGroupController = Get.find<ChatClassGroupController>();
  TabController? _tabcontroller;

  @override
  void initState() {
    _tabcontroller = TabController(length: 2, vsync: this);
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    context.loaderOverlay.show();
    await chatClassGroupController.fetchClassGroupList();
    if(!mounted) return;
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ChatAppBar(),
      body: Column(
        children: [
          Container(
            height: 50.w,
            color: Colorutils.userdetailcolor,
            alignment: Alignment.bottomCenter,
            child: TabBar(
              tabAlignment: TabAlignment.center,
              controller: _tabcontroller,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs: <Widget>[
                Container(
                  width: 150.w,
                  height: 30.w,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                          "assets/images/chatting_icon.svg",
                      ),
                      SizedBox(
                          width: 5.w
                      ),
                      Text(
                        "Class List",
                        style: GoogleFonts.inter(
                          color: Colorutils.Whitecolor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: 8.w
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 10,
                        child: Text(
                          "6",
                          style: GoogleFonts.inter(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150.w,
                  height: 30.w,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Chats",
                        style: GoogleFonts.inter(
                          color: Colorutils.Whitecolor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: 8.w
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 10,
                        child: Text(
                          "3",
                          style: GoogleFonts.inter(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabcontroller, children: [
              GetX<ChatClassGroupController>(
                builder: (ChatClassGroupController controller) {
                  List<ClassTeacherGroup> classTeacherGroups = controller.classGroupList.value;
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: classTeacherGroups.length,
                    itemBuilder: (BuildContext context, int index) {
                      LastMessage? lastMsg = controller.classGroupList[index].lastMessage.isNotEmpty ? controller.classGroupList[index].lastMessage.first : LastMessage();
                      DateTime? sentTime = lastMsg.sandAt;
                      String? formattedDate;
                      try {
                        formattedDate = DateFormat('EEE hh:mm a').format(sentTime!);
                      } catch(e) {}
                      return ChatItem(
                        className: classTeacherGroups[index].subjectName ?? '--',
                        time: formattedDate ?? '--',
                        unreadMessages: classTeacherGroups[index].unreadCount ?? 0,
                        classs: '${classTeacherGroups[index].classTeacherClass}${classTeacherGroups[index].batch}',
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
              ),
              mychat()
            ]),
          ),
        ],
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   zoomDrawerController: widget.zoomDrawerController,
      // ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String className;
  final String time;
  final int unreadMessages;
  final String classs;

  ChatItem({
    required this.className,
    required this.time,
    required this.unreadMessages,
    required this.classs,
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
              builder: (context) => ChatScreen(),
            ));
        // Get.find<ChatRoomController>().timer!.cancel();
      },
      child: Padding(
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
            //   height: 50.h,
            //   width: 50.h,
            //   decoration: const BoxDecoration(
            //     shape: BoxShape.circle,
            //     // image: DecorationImage(
            //     //   image: AssetImage("assets/png/Ellipse 2.png"),
            //     // ),
            //   ),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(100.h),
            //     child: Text(
            //       "4 A",
            //       style: TeacherAppFonts.interW600_14sp_textWhite,
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
                                "Can you pls share the pdf adsdaddsf.",
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
                  "Wed 11:30 pm",
                  style: TeacherAppFonts.interW400_12sp_topicbackground,
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 23.h,
                  width: 23.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colorutils.topicbackground),
                  child: Center(
                    child: Text(
                      "0",
                      style: TeacherAppFonts.interW600_14sp_textWhite,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
    // return Container(
    //   height: 60.w,
    //   child: GestureDetector(
    //     onTap: () {
    //       Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => const ChatScreen()));
    //     },
    //     child: ListTile(
    //       leading: CircleAvatar(
    //         backgroundColor: randomElement,
    //         radius: 25.r,
    //         child: Text(
    //           classs,
    //           style: GoogleFonts.inter(
    //               fontSize: 16.0,
    //               fontWeight: FontWeight.w500,
    //               color: Colors.black),
    //         ),
    //       ),
    //       title: Text(
    //         className,
    //         style: GoogleFonts.inter(
    //             fontSize: 16.0,
    //             fontWeight: FontWeight.w500,
    //             color: Colors.black),
    //       ),
    //       subtitle: Text(
    //         message,
    //         style: GoogleFonts.inter(
    //             fontSize: 13.0,
    //             fontWeight: FontWeight.w400,
    //             color: Colors.black),
    //       ),
    //       trailing: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(time),
    //           SizedBox(height: 5),
    //           if (unreadMessages > 0)
    //             CircleAvatar(
    //               radius: 10,
    //               backgroundColor: Colorutils.userdetailcolor,
    //               child: Text(
    //                 unreadMessages.toString(),
    //                 style: TextStyle(color: Colors.white, fontSize: 12),
    //               ),
    //             ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
