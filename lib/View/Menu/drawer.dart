import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:teacherapp/View/Chat_List/chat_list.dart';
import 'package:teacherapp/View/Menu/main_page.dart';
import 'menu_page.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final ZoomDrawerController _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.Style1,
      menuScreen: const MenuScreen(),
      mainScreen: const MainScreen(),
      borderRadius: 28.0,
      showShadow: true,
      angle: 0,
      mainScreenScale: 0.5,
      drawerStyleBuilder:
          (context, percentOpen, slideWidth, menuScreen, mainScreen) {
        double slide = (slideWidth * 0.8) * percentOpen;
        double layerSlide = (slideWidth * 0.6) * percentOpen;
        double scaleFactor = 1.0 - (percentOpen * 0.3);
        double layerScaleFactor = 1.0 - (percentOpen * 0.4);
        return Stack(
          children: [
            menuScreen,
            Transform(
              transform: Matrix4.identity()..translate(layerSlide, 0, 0)..scale(layerScaleFactor, layerScaleFactor, 1.0),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30).w,
                  child: Stack(
                    children: [
                      const ChatWithParentsPage(),
                      Container(
                        color: Colors.teal.withOpacity(0.5),
                      ),
                    ],
                  ),
              ),
            ),
            Transform(
              transform: Matrix4.identity()..translate(slide, 0, 0)..scale(scaleFactor, scaleFactor, 1.0),
              alignment: Alignment.center,
              child: mainScreen,
            ),
          ],
        );
      },
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      shadowLayer2Color: Colors.transparent,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.easeInBack,
    );
  }
}
