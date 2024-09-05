import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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
        height:double.infinity,
        width: ScreenUtil().screenWidth,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              const AppBarBackground(),
              Container(
height:ScreenUtil().screenHeight ,
                margin: EdgeInsets.only(
                  left: 20.w,
                  top: 120.h,
                  right: 20.w,
                  bottom: 20.h,
                ),
                decoration: themeCardDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                     Padding(
                      padding:  EdgeInsets.only(left: 20,top: 20),
                      child:  GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.arrow_back_ios),
                            Text("Back",style: TextStyle(
                              fontSize: 18,
                            ),)
                          ],
                        ),
                      ),
                    ),
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
                        "Enter Your Username",
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
                    SizedBox(height: 80,),
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
                                  TeacherAppPopUps.submitFailed(
                                    title: "Error",
                                    message: "Please Enter your Username!",
                                    actionName: "Close",
                                    iconData: Icons.info_outline,
                                    iconColor: Colors.red,
                                  );
                                } else {
                                  print("submit");
                                  try {
                                    Map<String, dynamic> resp = await ApiServices.forgotPassword(
                                      userName: forgotPasswordController.text,
                                    );
                                    if(resp['status']['code'] == 200) {
                                      forgotPasswordController.clear();
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      TeacherAppPopUps.submitFailed(
                                        title: resp['status']['message'].toString(),
                                        message: "We have emailed you the instructions to reset the password",
                                        actionName: "Close",
                                        iconData: Icons.done,
                                        iconColor: Colors.green,

                                      );

                                    } else {
                                      TeacherAppPopUps.submitFailed(
                                        title: "${resp['status']['message']}",
                                        message: resp['error']['message'] ?? "Something went wrong.",
                                        actionName: "Close",
                                        iconData: Icons.info_outline,
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
                                margin: EdgeInsets.only(
                                  left: 30.w,
                                  right: 30.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Colorutils.userdetailcolor,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                // width: 250.w,
                                height: 50.h,
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 18.h,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                    ),


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
