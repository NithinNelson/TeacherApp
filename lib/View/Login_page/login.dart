import 'dart:convert';
import 'dart:io';

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
import 'package:teacherapp/View/Login_page/choice_page.dart';




class LoginPage extends StatefulWidget {
  var role_id;
  LoginPage({Key? key, this.role_id, }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
            backgroundColor:Colors.white,
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
                          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(12.w),bottomRight: Radius.circular(12.w)),
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
                      right:10,
                      top: 140,
                      child: SvgPicture.asset(
                        'assets/images/stars1.svg',
                        color: Colorutils.Whitecolor.withOpacity(0.9),
                        width: 25.w,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      right:0,
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
                        color:Colorutils.Whitecolor, // Container color
                        borderRadius: BorderRadius.circular(20.r), // Border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colorutils.userdetailcolor.withOpacity(0.3), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 200.w,
                              height: 180.h,

                              child:
                              Lottie.asset("assets/images/loginimage.json"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 30.w),
                                child:Text(
                                  'Hello !',
                                  style: GoogleFonts.roboto(
                                      color:Colors.black,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30.w),
                                child: Text(
                                  'Sign in to your account',
                                  style: GoogleFonts.roboto(
                                      color:Colors.grey,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),

                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.h, vertical: 2.w),
                            child: TextFormField(
                              cursorColor: Colorutils.userdetailcolor,

                              controller: _usernameController,
                              autofillHints: [AutofillHints.username],
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder:  UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colorutils.userdetailcolor,width: 2)),
                                enabledBorder:  UnderlineInputBorder(borderSide: BorderSide(color: Colorutils.userdetailcolor)),
                                // border: UnderlineInputBorder(),
                                labelText: 'Username',
                                labelStyle: TextStyle(color: Colorutils.userdetailcolor)
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.h, vertical: 5.w),
                            child: TextFormField(
                              cursorColor: Colorutils.userdetailcolor,
                              textInputAction: TextInputAction.done,
                              obscureText: _obscureText,
                              controller: _passwordController,
                              autofillHints: [AutofillHints.password],
                              onEditingComplete: () =>
                                  TextInput.finishAutofillContext(),

                              decoration: InputDecoration(focusedBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colorutils.userdetailcolor,width: 2)),
                                  enabledBorder:  UnderlineInputBorder(borderSide: BorderSide(color: Colorutils.userdetailcolor)),
                                  // border: UnderlineInputBorder(borderSide: BorderSide(color: Colorutils.userdetailcolor)),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colorutils.userdetailcolor),
                                  suffixIcon: _obscureText
                                      ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = false;
                                        });
                                      },
                                      child: Icon(Icons.visibility_off))
                                      : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = true;
                                        });
                                      },
                                      child: Icon(Icons.visibility))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(left: 205.w, top: 10.h),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.w,),
                          Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  ChoicePage()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colorutils.userdetailcolor,
                                    borderRadius: BorderRadius.circular(30.r),

                                  ),
                                  width: 250.w,
                                  height: 50.w,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20,top: 5,bottom: 5),
                                    child: Row(
                                      children: [
                                        Spacer(flex: 2,),
                                        Text(
                                          'LOGIN',
                                          style: GoogleFonts.inter(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Spacer(),

                                        Icon(Icons.arrow_forward_ios,color: Colors.white70 ,),

                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  indent: 40,
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                  endIndent: 40,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: isSpinner
                                    ? Container(
                                  width: 100.w,
                                  height: 100.h,
                                  margin: EdgeInsets.only(top: 10.h),
                                  child: Image.asset(
                                      ""),
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    border: Border.all(
                                      color: Colorutils.userdetailcolor,
                                      width: 0.8,
                                    ),
                                  ),
                                  width: 250.w,
                                  height: 50.w,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20,top: 5,bottom: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 25.w,
                                            width: 25.w,
                                            child: Image.asset(
                                                "assets/images/google_logo.png")),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Sign in with Google',
                                            style: GoogleFonts.inter(
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),)),
                          SizedBox(
                            height: 10.h,
                          ),

                          Center(
                            child: Text(
                              'Version 1.0.0',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 10.sp),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    )
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
