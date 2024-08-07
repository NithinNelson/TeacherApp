import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/api_controllers/parentChatListController.dart';
import 'package:teacherapp/Services/snackBar.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/Chat_List/chat_list_widgets/group_chat_list.dart';
import 'package:teacherapp/View/Chat_List/chat_list_widgets/parent_chat_list.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
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
        if(!chatClassGroupController.searchEnabled.value) {
          await chatClassGroupController.fetchClassGroupListPeriodically();
        }
        if(!parentChatListController.searchEnabled.value) {
          await parentChatListController.fetchParentChatListPeriodically();
        }
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
              width: MediaQuery.of(context).size.width,
              color: Colorutils.userdetailcolor,
              padding: const EdgeInsets.symmetric(horizontal: 16).w,
              alignment: Alignment.bottomLeft,
              child: GetX<ChatClassGroupController>(
                builder: (ChatClassGroupController controller) {
                  return Row(
                      children: [
                        if(controller.searchEnabled.value)
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)).r,
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.searchEnabled.value = false;
                                      parentChatListController.searchEnabled.value = false;
                                    },
                                    child: Container(
                                      width: 30,
                                        height: 15,
                                        padding: const EdgeInsets.only(left: 10),
                                        child: FittedBox(child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
                                    ),
                                  ),
                                  Expanded(
                                    child: CupertinoSearchTextField(
                                      backgroundColor: Colors.white,
                                      onChanged: (value) {
                                        if(_tabcontroller?.index == 0) {
                                          controller.filterGroupList(text: value);
                                        } else if(_tabcontroller?.index == 1) {
                                          parentChatListController.filterGroupList(text: value);
                                        }
                                      },
                                      // decoration: ,
                                    ),
                                      // child: TextFormField(
                                      //   onTap: () {
                                      //     controller.searchEnabled.value = false;
                                      //   },
                                      //   decoration: InputDecoration(
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderRadius: BorderRadius.circular(20).r,
                                      //       borderSide: BorderSide(
                                      //         color: Colors.grey,
                                      //       ),
                                      //     ),
                                      //     contentPadding: EdgeInsets.all(0)
                                      //   ),
                                      // ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          Expanded(
                            child: Row(
                              // mainAxisSize: MainAxisSize.min,
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
                                InkWell(
                                  onTap: () {
                                    controller.searchEnabled.value = true;
                                    parentChatListController.searchEnabled.value = true;
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/MagnifyingGlass.svg',
                                    width: 27.h,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (controller.currentChatTab.value == 1 && !parentChatListController.searchEnabled.value)
                          Padding(
                          padding: const EdgeInsets.only(left: 6).w,
                          child: InkWell(
                            onTap: () {
                              parentChatListController.setCurrentFilterClass(
                                  currentClass: 'All');
                              parentChatListController.filterParentList(text: '');
                              if(parentChatListController.parentChatList.value.isNotEmpty) {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return const NewParentChat();
                                  },
                                );
                              } else {
                                snackBar(context: context, message: "Parent chat list is empty.", color: Colors.red);
                              }
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
                        ),
                      ],
                    );
                },
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
