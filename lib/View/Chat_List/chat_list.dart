
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

class ChatWithParentsPage extends StatefulWidget {
  const ChatWithParentsPage({super.key});

  @override
  State<ChatWithParentsPage> createState() => _ChatWithParentsPageState();
}

class _ChatWithParentsPageState extends State<ChatWithParentsPage> with TickerProviderStateMixin {
  ChatClassGroupController chatClassGroupController = Get.find<ChatClassGroupController>();
  ParentChatListController parentChatListController = Get.find<ParentChatListController>();
  TabController? _tabcontroller;
  PageController pageController = PageController();

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
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleLight,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const ChatAppBar(),
        body: Column(
          children: [
            Container(
              height: 50.w,
              color: Colorutils.userdetailcolor,
              alignment: Alignment.bottomCenter,
              child: TabBar(
                onTap: (index) {
                  _tabcontroller = TabController(length: 2, vsync: this, initialIndex: index);
                  pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
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
                    width: 140.w,
                    height: 30.w,
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
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(width: 8.w),
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
                    width: 140.w,
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
                        SizedBox(width: 8.w),
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
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  // if(_tabcontroller != null) {
                  _tabcontroller = TabController(length: 2, vsync: this, initialIndex: index);
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
