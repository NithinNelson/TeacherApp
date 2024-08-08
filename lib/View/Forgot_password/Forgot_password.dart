import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:teacherapp/Services/api_services.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import '../../Utils/Colors.dart';
import '../CWidgets/AppBarBackground.dart';
import '../CWidgets/commons.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final forgotPasswordController = TextEditingController();

  bool spinner = false;

  final spinKit = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.blue : Colors.lightBlueAccent,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  left: 20.w,
                  top: 120.h,
                  right: 20.w,
                  bottom: 10.h,
                ),
                decoration: themeCardDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 250.w,
                        height: 250.h,
                        margin: EdgeInsets.only(
                          top: 10.h,
                          bottom: 5.h,
                        ),
                        child: Center(
                          child: Lottie.asset(
                            "assets/images/forgot.json",
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 38.w,
                          ),
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              fontSize: 26.h,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontFamily: "WorkSans",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20.h,
                        left: 38.w,
                        bottom: 5.h,
                      ),
                      child: Text(
                        "Enter Your Email ID",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.h,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 30.w,
                        right: 30.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colorutils.chatcolor,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 5.h,
                        ),
                        child: TextFormField(
                          controller: forgotPasswordController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: spinner
                          ? Container(
                              margin: EdgeInsets.only(top: 100.h),
                              child: Center(child: spinKit),
                            )
                          : GestureDetector(
                              onTap: () async {
                                setState(() {
                                  spinner = true;
                                });
                                print("button pressed");
                                if (forgotPasswordController.text
                                    .trim()
                                    .isEmpty) {
                                  print("empty");
                                } else {
                                  print("submit");
                                  try {
                                    Map<String, dynamic> resp = await ApiServices.forgotPassword(
                                      userName: forgotPasswordController.text,
                                    );
                                    if(resp['status']['code'] == 200) {
                                      TeacherAppPopUps.submitFailed(
                                        title: resp['status']['message'].toString(),
                                        message: "We have emailed you the instructions to reset the password",
                                        actionName: "Close",
                                        iconData: Icons.done,
                                        iconColor: Colors.green,
                                      );
                                    } else {
                                      TeacherAppPopUps.submitFailed(
                                        title: "${resp['status']['code']}: ${resp['status']['message']}",
                                        message: resp['error']['message'] ?? "Something went wrong.",
                                        actionName: "Close",
                                        iconData: Icons.block_outlined,
                                        iconColor: Colors.red,
                                      );
                                    }
                                    print("------forgot resp-----------$resp");
                                  } catch(e) {
                                    print("------forgot error-----------${e.toString()}");
                                  }
                                }
                                setState(() {
                                  spinner = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 300.w,
                                height: 70.h,
                                margin: EdgeInsets.only(top: 100.h),
                                child: Image.asset(
                                  "assets/images/submitbutton.png",
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: 200.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
