import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/api_constants.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:teacherapp/View/RoleNavigation/choice_page.dart';

import '../Menu/drawer.dart';
import '../RoleNavigation/hos_listing.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? _usernameController;
  TextEditingController? _passwordController;
  FocusNode? _usernameFocusNode;
  FocusNode? _passwordFocusNode;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    _usernameFocusNode?.dispose();
    _passwordFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  SizedBox(
                    width: ScreenUtil().screenWidth,
                    height: 180.h,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ).r,
                        color: Colorutils.userdetailcolor,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 40,
                    child: SvgPicture.asset(
                      'assets/images/pencil2.svg',
                      width: 100.w,
                      color: Colorutils.Whitecolor.withOpacity(0.1),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 240,
                    top: 25,
                    child: Transform.rotate(
                      angle: 0.5,
                      child: SvgPicture.asset(
                        'assets/images/stars1.svg',
                        width: 20.w,
                        color: Colorutils.Whitecolor.withOpacity(0.5),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    top: 65,
                    child: SvgPicture.asset(
                      'assets/images/graduation-cap-icon.svg',
                      width: 30.w,
                      color: Colorutils.Whitecolor.withOpacity(0.07),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 140,
                    top: 10,
                    child: SvgPicture.asset(
                      'assets/images/read-book-icon.svg',
                      width: 30.w,
                      color: Colorutils.Whitecolor.withOpacity(0.07),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 115,
                    top: 65,
                    child: SvgPicture.asset(
                      'assets/images/stars1.svg',
                      width: 20.w,
                      color: Colorutils.Whitecolor.withOpacity(0.5),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 10,
                    child: SvgPicture.asset(
                      'assets/images/stars1.svg',
                      width: 20.w,
                      color: Colorutils.Whitecolor.withOpacity(0.5),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 140,
                    child: SvgPicture.asset(
                      'assets/images/stars1.svg',
                      color: Colorutils.Whitecolor.withOpacity(0.9),
                      width: 25.w,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: -90,
                    child: SvgPicture.asset(
                      'assets/images/pencil3.svg',
                      color: Colorutils.Whitecolor.withOpacity(0.2),
                      height: 180.w,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20.w, top: 100.h, right: 20.w, bottom: 20.w),
                    // width: 550.w,
                    height: ScreenUtil().screenHeight * 0.8,
                    decoration: BoxDecoration(
                      color: Colorutils.Whitecolor,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colorutils.userdetailcolor.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Container(
                            width: 200.w,
                            // height: 180.h,
                            child: Lottie.asset(
                              "assets/images/loginimage.json",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          margin: EdgeInsets.only(left: 30.w),
                          child: Text(
                            'Hello !',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30.w),
                          child: Text(
                            'Sign in to your account',
                            style: GoogleFonts.roboto(
                                color: Colors.grey,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 2.w),
                          child: TextFormField(
                            cursorColor: Colorutils.userdetailcolor,
                            controller: _usernameController,
                            autofillHints: const [AutofillHints.username],
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colorutils.userdetailcolor,
                                        width: 2)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colorutils.userdetailcolor)),
                                // border: UnderlineInputBorder(),
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    color: Colorutils.userdetailcolor)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 5.w),
                          child: TextFormField(
                            cursorColor: Colorutils.userdetailcolor,
                            textInputAction: TextInputAction.done,
                            obscureText: _obscureText,
                            controller: _passwordController,
                            autofillHints: const [AutofillHints.password],
                            onEditingComplete: () =>
                                TextInput.finishAutofillContext(),
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colorutils.userdetailcolor,
                                        width: 2)),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colorutils.userdetailcolor)),
                                // border: UnderlineInputBorder(borderSide: BorderSide(color: Colorutils.userdetailcolor)),
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                    color: Colorutils.userdetailcolor),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(_obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5)
                              .w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30).w,
                          child: GestureDetector(
                            onTap: () async {
                              UserAuthController userAuthController = Get.find<UserAuthController>();
                              String? user = _usernameController?.text != "" ? _usernameController?.text : null;
                              String? psw = _passwordController?.text != "" ? _passwordController?.text : null;
                              if(user != null && psw != null) {
                                context.loaderOverlay.show();
                                await userAuthController.fetchUserData(
                                    username: user,
                                  password: psw,
                                );
                                context.loaderOverlay.hide();
                                if(userAuthController.isLoaded.value) {
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
                                }
                              } else {
                                TeacherAppPopUps.submitFailed(
                                    title: "Failed",
                                    message: "Invalid Username/Password! Please Try Again",
                                    actionName: "Try again",
                                  iconData: Icons.error_outline,
                                  iconColor: Colorutils.svguicolour2,
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colorutils.userdetailcolor,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              // width: 250.w,
                              height: 50.h,
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )),
                        SizedBox(height: 10.h),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Divider(
                                indent: 30.w,
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'or',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                                endIndent: 30.w,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30).w,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(
                                    color: Colorutils.userdetailcolor,
                                    width: 0.8,
                                  ),
                                ),
                                // width: 250.w,
                                height: 50.h,
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        height: 25.w,
                                        "assets/images/google_logo.png",
                                        fit: BoxFit.fitHeight,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        'Sign in with Google',
                                        style: GoogleFonts.inter(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        const Spacer(),
                        Center(
                          child: Text(
                            ApiConstants.appVersion,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
