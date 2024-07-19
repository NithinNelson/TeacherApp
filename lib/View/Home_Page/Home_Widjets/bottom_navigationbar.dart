import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'dart:math';

import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/Login_page/login.dart';

import '../../Bottom_Sheet/bottom_sheet.dart';
import '../../Chat_List/chat_list.dart';
import '../../Chat_View/Chat_view.dart';
import '../../Chat_View/Chat_widgets/Selectparents.dart';
import '../../Chat_View/Chat_widgets/chatnew.dart';
import '../home_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;
  const CustomBottomNavigationBar({super.key, required this.zoomDrawerController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.w,
      child: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          fontSize: 0
        ),


          backgroundColor: Colorutils.Whitecolor,
          type: BottomNavigationBarType.fixed,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>  Homepage(zoomDrawerController: zoomDrawerController,)));
                },
                child: Column(
                
                  children: [
                    SvgPicture.asset(
                      'assets/images/house-bottom.svg',
                      color:  Colorutils.bottomiconcolor,
                    ),
                    SizedBox(height: 3.w,),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 13.0, // Adjust the font size as needed
                        color: Colorutils.bottomiconcolor, // Choose your desired color
                
                      ),
                    )
                
                  ],
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: (){
    showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => ParentSelectionBottomSheet(),
    );
    },
                child: Column(


                  children: [
                    SvgPicture.asset(
                      'assets/images/clock-three 1.svg',
                      color:  Colorutils.bottomiconcolor,
                    ),
                    SizedBox(height: 3.w,),
                    Text(
                      'Leave',
                      style: TextStyle(
                        fontSize: 13.0, // Adjust the font size as needed
                        color: Colorutils.bottomiconcolor, // Choose your desired color

                      ),
                    )
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(

              icon: GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>  ChatWithParentsPage(zoomDrawerController:zoomDrawerController,)));
                //   chatview
                //   ChatWithParentsPage

                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colorutils.userdetailcolor, // Replace with your desired color
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/ChatText.png', // Add your asset image here
                      fit: BoxFit.contain,
                      width: 30, // Ensure this matches the diameter of the CircleAvatar
                      height: 30,
                    ),
                  ),
                ),
              ),
              label: "",
            ),




            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: (){ },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/chart-pie-alt.svg',
                      color:  Colorutils.bottomiconcolor,
                    ),
                    SizedBox(height: 3.w,),
                    Text(
                      'OBS Result',
                      style: TextStyle(
                        fontSize: 13.0, // Adjust the font size as needed
                        color: Colorutils.bottomiconcolor, // Choose your desired color

                      ),
                    )
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => BottomSheetContent(),
                  );
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/apps 2.svg',
                      color:  Colorutils.bottomiconcolor,
                      fit: BoxFit.none,
                    ),
                    SizedBox(height: 3.w,),
                    Text(
                      'More',
                      style: TextStyle(
                        fontSize: 13.0, // Adjust the font size as needed
                        color: Colorutils.bottomiconcolor, // Choose your desired color

                      ),
                    )
                  ],
                ),
              ),
              label: '',
            ),
          ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colorutils.userdetailcolor


      ),
    );
  }
}


