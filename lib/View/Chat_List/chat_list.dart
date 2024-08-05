import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/api_controllers/parentChatListController.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/Chat_List/chat_list_widgets/group_chat_list.dart';
import 'package:teacherapp/View/Chat_List/chat_list_widgets/parent_chat_list.dart';
import 'package:teacherapp/View/Chat_List/chat_list_widgets/chat_appBar.dart';
import '../../Controller/api_controllers/chatClassGroupController.dart';
import '../../Utils/constants.dart';
import 'chat_list_widgets/new_parentChat_bottomSheet.dart';

class ChatWithParentsPage extends StatefulWidget {
  const ChatWithParentsPage({super.key});

  @override
  State<ChatWithParentsPage> createState() => _ChatWithParentsPageState();
}

class _ChatWithParentsPageState extends State<ChatWithParentsPage>
    with TickerProviderStateMixin {
  ChatClassGroupController chatClassGroupController =
      Get.find<ChatClassGroupController>();
  ParentChatListController parentChatListController =
      Get.find<ParentChatListController>();
  TabController? _tabcontroller;
  PageController pageController = PageController();
  Timer? chatUpdate;

  @override
  void initState() {
    _tabcontroller = TabController(length: 2, vsync: this);
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    context.loaderOverlay.show();
    await chatClassGroupController.fetchClassGroupList();
    await parentChatListController.fetchParentChatList();
    if (!mounted) return;
    Get.find<ParentChatListController>().setTab(0);
    context.loaderOverlay.hide();
    chatUpdate = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await chatClassGroupController.fetchClassGroupListPeriodically();
        await parentChatListController.fetchParentChatListPeriodically();
      },
    );
  }

  @override
  void dispose() {
    chatUpdate!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleLight,
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: const ChatAppBar(),
        body: Column(
          children: [
            Container(
              height: 100.h,
              color: Colorutils.userdetailcolor,
              padding: const EdgeInsets.symmetric(horizontal: 16).w,
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text(
                    'Chat with parents',
                    style: GoogleFonts.inter(
                      fontSize: 25.h,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/images/MagnifyingGlass.svg',
                    width: 27.h,
                    fit: BoxFit.fitWidth,
                  ),
                  GetX<ChatClassGroupController>(
                    builder: (ChatClassGroupController controller) {
                      if (controller.currentChatTab.value == 1) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 6).w,
                          child: InkWell(
                            onTap: () {
                              parentChatListController.setCurrentFilterClass(
                                  currentClass: 'All');
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                builder: (context) {
                                  return const NewParentChat();
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4.0).w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100).w),
                              child: Icon(
                                Icons.add,
                                color: Colorutils.letters1,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          width: 0,
                          height: 0,
                          color: Colorutils.userdetailcolor,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 55.h,
              color: Colorutils.userdetailcolor,
              alignment: Alignment.bottomCenter,
              child: TabBar(
                onTap: (index) {
                  _tabcontroller = TabController(
                      length: 2, vsync: this, initialIndex: index);
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceIn);
                  setState(() {});
                  Get.find<ChatClassGroupController>().setCurrentChatTab(index);
                },
                tabAlignment: TabAlignment.center,
                controller: _tabcontroller,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: <Widget>[
                  Container(
                    width: 180.w,
                    height: 40.h,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/images/chatting_icon.svg",
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "Class List",
                          style: GoogleFonts.inter(
                            color: Colorutils.Whitecolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.h,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GetX<ChatClassGroupController>(
                          builder: (ChatClassGroupController controller) {
                            int count = controller.unreadCount.value;
                            if (count != 0) {
                              return CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 10.r,
                                child: FittedBox(
                                  child: Text(
                                    count.toString(),
                                    style: GoogleFonts.inter(
                                        fontSize: 13.h,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 180.w,
                    height: 40.w,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Chats",
                          style: GoogleFonts.inter(
                            color: Colorutils.Whitecolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.h,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GetX<ParentChatListController>(
                          builder: (ParentChatListController controller) {
                            int count = controller.unreadCount.value;
                            if (count != 0) {
                              return CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 10.r,
                                child: FittedBox(
                                  child: Text(
                                    count.toString(),
                                    style: GoogleFonts.inter(
                                        fontSize: 13.h,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  // if(_tabcontroller != null) {
                  _tabcontroller = TabController(
                      length: 2, vsync: this, initialIndex: index);
                  setState(() {});
                  Get.find<ChatClassGroupController>().setCurrentChatTab(index);
                  // }
                },
                children: const [
                  GroupChatList(),
                  ParentChatList(),
                ],
              ),
            ),
          ],
        ),
        // bottomNavigationBar: CustomBottomNavigationBar(
        //   zoomDrawerController: widget.zoomDrawerController,
        // ),
      ),
    );
  }
}
