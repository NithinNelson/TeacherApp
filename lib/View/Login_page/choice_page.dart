import 'dart:convert';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/Home_Page/home_page.dart';
import 'package:teacherapp/View/Login_page/Leadership.dart';
import 'package:teacherapp/View/Login_page/choice_page.dart';
import 'package:teacherapp/View/Menu_Drawer/Drawer.dart';

class ChoicePage extends StatefulWidget {
  var role_id;

  ChoicePage({Key? key, this.role_id, r})
      : super(key: key);

  @override
  _ChoicePageState createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  TextEditingController? _usernameController;
  TextEditingController? _passwordController;

  bool isSpinner = false;
  bool googleSignIn = false;
  FocusNode? _usernameFocusNode;
  FocusNode? _passwordFocusNode;
  bool _obscureText = true;
  String? employeeNumbers;
  String? userIds;
  String? names;
  String? schoolIds;
  String? images;
  var designation = [];

  List<String> rolename = [];

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    initialize();
    // _progressDialog = ProgressDialog(context);
  }

  @override
  void dispose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    _usernameFocusNode?.dispose();
    _passwordFocusNode?.dispose();
    super.dispose();
  }

  Future<void> initialize() async {
    setState(() {
      isSpinner = true;
    });
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      isSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.93,
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 180.w,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.w),
                              bottomRight: Radius.circular(12.w)),
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
                      margin:
                          EdgeInsets.only(left: 20.w, top: 85.h, right: 20.w),
                      // width: 550.w,
                      height: 545.h,
                      decoration: BoxDecoration(
                        color: Colorutils.Whitecolor,
                        // Container color
                        borderRadius: BorderRadius.circular(20.r),
                        // Border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colorutils.userdetailcolor.withOpacity(0.3),
                            // Shadow color
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: isSpinner
                          ? Center(
                              child: _Loader(),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset("assets/images/select_role.json"),
                                SizedBox(
                                  height: 60.h,
                                ),
                                Center(
                                  child: SizedBox(
                                    child: Text(
                                      "Select your role",
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.cyan),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                // teacherData == null || teacherData.isEmpty
                                //     ? Text("")
                                GestureDetector(
                                    onTap: () async {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomeScreen()));
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/hoslogin.svg")),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => leader()));


                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/teacherLogin.svg")),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Padding(
                                   padding: const EdgeInsets.only(right: 20,top: 20),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       CircleAvatar(
                                         radius: 15,
                                       backgroundColor: Colors.white,
                                         child: SvgPicture.asset(
                                             "assets/images/logout.svg",color: Colors.red,),
                                       ),
                                     ],
                                   ),
                                 ),
                               )
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

// _checkInternet(context) {
//   return Alert(
//     onWillPopActive: true,
//     context: context,
//     type: AlertType.warning,
//     title: "Please Check Your Internet Connection",
//     style: AlertStyle(
//         isCloseButton: false,
//         titleStyle: TextStyle(color: Color.fromRGBO(66, 69, 147, 7))),
//     buttons: [
//       DialogButton(
//         child: Text(
//           "OK",
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         // print(widget.academicyear);
//         //width: 120,
//       )
//     ],
//   ).show();
// }
//
// _notAuthorized(context) {
//   return Alert(
//     context: context,
//     type: AlertType.warning,
//     title: "You are not authorized to access this application",
//     style: AlertStyle(
//         isCloseButton: false,
//         titleStyle: TextStyle(color: Color.fromRGBO(66, 69, 147, 7))),
//     buttons: [
//       DialogButton(
//         child: Text(
//           "Try again",
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         onPressed: () async {
//           Navigator.pop(context);
//           designation.clear();
//           await GoogleSignInApi.logout();
//         },
//         // print(widget.academicyear);
//         //width: 120,
//       )
//     ],
//   ).show();
// }
//
// _submitFailed(context) {
//   return Alert(
//     context: context,
//     type: AlertType.warning,
//     title: "Invalid Username/Password! Please Try Again",
//     style: AlertStyle(
//         isCloseButton: false,
//         titleStyle: TextStyle(color: Color.fromRGBO(66, 69, 147, 7))),
//     buttons: [
//       DialogButton(
//         child: Text(
//           "Try again",
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         onPressed: () async {
//           Navigator.pop(context);
//           designation.clear();
//           await GoogleSignInApi.logout();
//         },
//         // print(widget.academicyear);
//         //width: 120,
//       )
//     ],
//   ).show();
// }
}

Widget _Loader() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Image.asset("assets/images/loader1.gif"),
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      SizedBox(
        width: 300.w,
        child: Container(
          height: 70.w,
          child: DefaultTextStyle(

            style: const TextStyle(
              color: Colorutils.userdetailcolor,
              fontSize: 13.0,
              fontFamily: 'Agne',
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                    'Teaching is a calling too. And I have always thought that teachers in their way are holy-angels leading their flocks out of the darkness. \n :- Jeannette Walls'),
                TypewriterAnimatedText(
                    'Better than a thousand days of diligent study is one day with a great Teacher. \n :- Japanese Proverb'),
                TypewriterAnimatedText(
                    'Education does not mean teaching people what they do not know. It means teaching them to behave as they do not behave. \n :- Abraham Lincoln'),
                TypewriterAnimatedText(
                    'Education is not the filling of a pail, but the lighting of a fire. \n :- William Butler Yeats'),
                TypewriterAnimatedText(
                    'The function of education is to teach one to think intensively and to think critically. Intelligence plus character - that is the goal of true Education. \n :- Martin Luther King Jr'),
                TypewriterAnimatedText(
                    'One child, one teacher, one book, and one pen change the world. \n :- Malala Yousafzai'),
                TypewriterAnimatedText(
                    'The fact that you worry about being a good teacher, means that you already are one. \n :- Jodi Picoult'),
                TypewriterAnimatedText(
                    'A well educated mind will always have more questions than answers. \n :- Helen Keller'),
              ],

              onTap: () {
                print("Tap Event");
              },
            ),

          ),
        ),

      ),
      SizedBox(height: 100),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(right: 20,top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){

                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    "assets/images/logout.svg",color: Colors.red,),
                ),
              ),
            ],
          ),
        ),
      )
    ],

  );
}
