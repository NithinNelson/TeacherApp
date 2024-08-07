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
import 'package:teacherapp/View/CWidgets/AppBarBackground.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:teacherapp/View/RoleNavigation/choice_page.dart';

import '../CWidgets/commons.dart';
import '../Forgot_password/Forgot_password.dart';
import '../Menu/drawer.dart';
import '../RoleNavigation/hos_listing.dart';
import 'google_signin_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserAuthController userAuthController = Get.find<UserAuthController>();
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

  Future signIn() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setString('GoogleUser', Guser.email.toString());
    // //  print(preferences.getString('GoogleUser'));
    // GoogleUser = preferences.getString('GoogleUser');

    try {
      if (await GoogleSignInApi.isSignedIn()) {
        await GoogleSignInApi.logout();
      }
      final gUser = await GoogleSignInApi.login();
      print(gUser?.email);
      if (gUser!.email.isEmpty) {
        print("No User found");
        TeacherAppPopUps.submitFailed(
            title: 'Failed',
            message: 'Something went wrong.',
            actionName: 'Try again',
            iconData: Icons.error_outline,
            iconColor: Colorutils.svguicolour2,
        );
      } else {
        await userAuthController.googleSignInUser(username: gUser.email);
      }
    } catch (e) {
      print(e);
    }
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
                  const AppBarBackground(),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20.w, top: 120.h, right: 20.w, bottom: 10.h),
                    // width: 550.w,
                    // height: ScreenUtil().screenHeight * 0.85,
                    decoration: themeCardDecoration,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Container(
                                height: 200.h,
                                // height: 180.h,
                                child: Lottie.asset(
                                  "assets/images/loginimage.json",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25.h),
                          Container(
                            margin: EdgeInsets.only(left: 30.w),
                            child: Text(
                              'Hello !',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 30.h,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30.w),
                            child: Text(
                              'Sign in to your account',
                              style: GoogleFonts.roboto(
                                  color: Colors.grey,
                                  fontSize: 13.h,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.w, vertical: 2.h),
                            child: TextFormField(
                              cursorColor: Colorutils.userdetailcolor,
                              controller: _usernameController,
                              autofillHints: const [AutofillHints.username],
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colorutils.userdetailcolor,
                                          width: 2)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colorutils.userdetailcolor)),
                                  // border: UnderlineInputBorder(),
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                      color: Colorutils.userdetailcolor, fontSize: 16.h)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.w, vertical: 5.h),
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
                                  labelStyle: TextStyle(
                                      color: Colorutils.userdetailcolor, fontSize: 16.h),
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
                            padding: EdgeInsets.symmetric(
                                    horizontal: 40.w, vertical: 5.h)
                                .w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPassword() ));
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(fontSize: 10.h,color: Colors.blue[900],fontStyle:FontStyle.italic),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30).w,
                            child: GestureDetector(
                              onTap: () async {
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
                                // _usernameController?.clear();
                                // _passwordController?.clear();
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
                                        fontSize: 18.h,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          )),
                          SizedBox(height: 20.h),
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
                                EdgeInsets.symmetric(horizontal: 8.w),
                                child: Text(
                                  'or',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12.h,
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
                          SizedBox(height: 20.h),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30).w,
                              child: GestureDetector(
                                onTap: () async {
                                  context.loaderOverlay.show();
                                  await signIn().then((_) => context.loaderOverlay.hide());
                                },
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
                                          height: 25.h,
                                          "assets/images/google_logo.png",
                                          fit: BoxFit.fitHeight,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          'Sign in with Google',
                                          style: GoogleFonts.inter(
                                            fontSize: 16.h,
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
                          // const Spacer(),
                          SizedBox(
                            height: ScreenUtil().screenHeight * 0.07,
                          ),
                          Center(
                            child: Text(
                              ApiConstants.appVersion,
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 10.h,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
