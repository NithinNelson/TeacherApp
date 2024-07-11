import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../Home_Page/home_page.dart';
import 'menu_page.dart';

class HomeScreen extends StatelessWidget {
  final ZoomDrawerController _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreenWidth: double.infinity,
      controller: _drawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: MenuScreen(),
      mainScreen: Homepage(
        zoomDrawerController: _drawerController,
      ),
      borderRadius: 28.0,
      showShadow: true,
      slideHeight: 10,
      angle: 0,
      menuBackgroundColor: Colors.teal,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}
