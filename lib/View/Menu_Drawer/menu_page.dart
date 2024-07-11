import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacherapp/Utils/Colors.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 20.0,
              top: 0.0,
              child: Container(
                height: 350,
                width: 350,
                child: SvgPicture.asset(
                  'assets/images/pencil1.svg',
                  color: Colorutils.Whitecolor,
                  fit: BoxFit
                      .fill, // Make sure the SVG file is located in the assets folder
                ),
              ),
            ),
            Positioned(
              left: 0.w,
              bottom: 0,
              child: Container(
                height: 170.w,
                width: 170.w,
                child: SvgPicture.asset(
                  'assets/images/pencil2.svg',
                  color: Colorutils.Whitecolor.withOpacity(0.06),
                  fit: BoxFit
                      .fill, // Make sure the SVG file is located in the assets folder
                ),
              ),
            ),
            Positioned(
             right:0,
              bottom: 0,
              child: Container(
                height: 280.w,
                width: 130.w,
                child: SvgPicture.asset(
                  'assets/images/pencil3.svg',
                  color: Colorutils.Whitecolor.withOpacity(0.06),
                  fit: BoxFit
                      .fill, // Make sure the SVG file is located in the assets folder
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/profile2.png'),
                      ),
                      SizedBox(width: 130.w,),
                      ClassIndicator(className: '4A', isActive: true),
                      ClassIndicator(className: '4B', isActive: false),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Fathima Nourin',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Text(
                    'fathima@school.com',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),

                  SizedBox(height: 10),
                  MenuItem(icon: "assets/images/house-bottom.svg", title: 'Home'),
                  MenuItem(icon: "assets/images/classes.svg", title: 'Classes'),
                  MenuItem(icon: "assets/images/timetable.svg", title: 'Timetable'),
                  MenuItem(icon: "assets/images/clock-three 1.svg", title: 'Leave'),
                  MenuItem(icon: "assets/images/chart-pie-alt.svg", title: 'OBS Result'),
                  MenuItem(icon:"assets/images/logout.svg", title: 'Logout'),
                  SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset('assets/images/newchat.png', // replace with your SVG file path


                  width: 26,
                  height: 26,
                ),
                label: Text('Chat with Parents'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.teal,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // set your desired border radius
                  ),
                ),
              )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String icon;
  final String title;

  MenuItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(icon, color: Colorutils.Whitecolor.withOpacity(0.6)),
      title: Text(
        title,
        style: TextStyle(color: Colorutils.Whitecolor.withOpacity(0.8),fontSize: 15),
      ),
      onTap: () {
        // Handle navigation
      },
    );
  }
}

class ClassIndicator extends StatelessWidget {
  final String className;
  final bool isActive;

  ClassIndicator({required this.className, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5,bottom: 15),
      child: CircleAvatar(
        backgroundColor: isActive ? Colorutils.Whitecolor: Colorutils.Whitecolor,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              className,
              style: TextStyle(
                color: Colorutils.userdetailcolor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
