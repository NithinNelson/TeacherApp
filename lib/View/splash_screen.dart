
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:teacherapp/View/Menu/drawer.dart';
import 'package:teacherapp/View/RoleNavigation/choice_page.dart';
import 'package:teacherapp/View/Login_page/login.dart';
import 'package:teacherapp/View/RoleNavigation/hos_listing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  Future<void> navigate() async {
    UserAuthController userAuthController = Get.find<UserAuthController>();
    await userAuthController.getUserData();
    String? userId = userAuthController.userData.value.userId;
    await Future.delayed(const Duration(seconds: 1));
    if(userId != null) {
      UserRole? userRole = userAuthController.userRole.value;
      if(userRole != null) {
        if(userRole == UserRole.principal) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HosListing()));
        }
        if(userRole == UserRole.hos) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ChoicePage()));
        }
        if(userRole == UserRole.teacher) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DrawerScreen()));
        }
      } else {
        TeacherAppPopUps.submitFailed(
          title: "Error",
          message: "Not fined role",
          actionName: "Close",
          iconData: Icons.cancel_outlined,
          iconColor: Colors.red,
        );
      }
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorutils.userdetailcolor,
        body: Center(
          child: SizedBox(
            width: 150.w,
            height: 150.h,
            child:  SvgPicture.asset("assets/images/splashscreenmainlogo.svg"),
          ),
        )
    );
  }
}

