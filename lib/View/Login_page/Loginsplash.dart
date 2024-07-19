
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/Login_page/login.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colorutils.userdetailcolor,
          body: Center(
            child: Container(
              width: 150.w,
              height: 150.h,
              child:  SvgPicture.asset("assets/images/splashscreenmainlogo.svg",),
            ),
          )
      ),
    );
  }
}
