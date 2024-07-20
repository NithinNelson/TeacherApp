
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/ui_controllers/page_controller.dart';
import '../Chat_List/chat_list.dart';
import '../Home_Page/Home_Widjets/bottom_navigationbar.dart';
import '../Home_Page/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Widget getScreen({required int pageIndex}) {
    switch(pageIndex) {
      case 0: return const Homepage();
      case 2: return const ChatWithParentsPage();
      default: return const Homepage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness: Brightness.dark, // dark icons
        statusBarBrightness: Brightness.light, // iOS
      ),
      child: Scaffold(
        body: GetX<PageIndexController>(
            builder: (PageIndexController controller) {
              return getScreen(
                  pageIndex: controller.pageIndex.value,
              );
            },
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
