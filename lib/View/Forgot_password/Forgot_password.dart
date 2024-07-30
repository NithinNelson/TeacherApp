
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import '../../Utils/Colors.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final forgotPasswordController = TextEditingController();

  bool spinner = false;

  final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.blue : Colors.lightBlueAccent,
        ),
      );
    },
  );
  final spinkitNew = SpinKitWave(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.blue : Colors.lightBlueAccent,
          ));
    },
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            width: ScreenUtil().screenWidth,
            child: Stack(
              children: [
                AppBarBackground(),


                Container(
                  margin: EdgeInsets.only(left: 20.w, top: 120.h, right: 20.w),
                  // width: 550.w,
                  // height: 600.h,
                  // height: ScreenUtil().screenHeight * 0.8,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r),bottomRight:Radius.circular(20.r),bottomLeft: Radius.circular(20.r) ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                           width: 250.w,
                           height: 250.h,
                          margin: EdgeInsets.only(top: 10.h, bottom: 5.h),
                          child: Center(
                              child: Lottie.asset("assets/images/forgot.json",)),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 38.w),
                            child: Text("Forgot Password",
                                style: TextStyle(
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontFamily: "WorkSans")),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 38.w),
                          //   child: Text("Password",
                          //       style: TextStyle(
                          //           fontSize: 26.sp,
                          //           fontWeight: FontWeight.bold,
                          //           color:  Colors.grey,
                          //           fontFamily: "WorkSans")),
                          // ),
                        ],
                      ),
                      Container(
                        margin:
                        EdgeInsets.only(top: 20.h, left: 38.w, bottom: 5.h),
                        child: Text(
                          "Enter Your Email ID",
                          style: TextStyle(
                              color: Colors.black, fontSize: 14.sp),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30.w, right: 30.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colorutils.chatcolor)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.h, vertical: 5.w),
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
                              child: Center(child: spinkitNew))
                              : GestureDetector(
                              onTap: () {
                                print("button pressed");
                                if (forgotPasswordController.text
                                    .toString()
                                    .isEmpty) {
                                  print("empty");
                                  // Utils.showToastError(
                                  //     "Please fill the username to continue")
                                  //     .show(context);
                                } else {
                                  print("submit");
                                  setState(() {
                                    spinner = true;
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                  width: 300.w,
                                  height: 70.h,
                                  margin: EdgeInsets.only(top: 100.h),
                                  child: Image.asset(
                                      "assets/images/submitbutton.png")))),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }


}
