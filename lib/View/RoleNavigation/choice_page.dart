
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/Login_page/Leadership.dart';

import '../CWidgets/TeacherAppPopUps.dart';
import '../Menu/drawer.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({super.key});

  @override
  State<ChoicePage> createState() => _ChoicePageState();
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
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isSpinner = false;
    });
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
                    width: MediaQuery.of(context).size.width,
                    height: 180.h,
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
                    margin: EdgeInsets.only(left: 20.w, top: 100.h, right: 20.w, bottom: 20.w),
                    // width: 550.w,
                    height: ScreenUtil().screenHeight * 0.8,
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
                              const Spacer(),
                              Lottie.asset("assets/images/select_role.json"),
                              const Spacer(flex: 2),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DrawerScreen()));
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
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15, right: 15).w,
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        "assets/images/logout.svg",
                                        color: Colors.red,
                                      ),
                                    ),
                                    onPressed: () {
                                      TeacherAppPopUps.logOutPopUp(context: context);
                                    },
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

Widget _Loader() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Image.asset(
          height: 100.h,
            "assets/images/loader1.gif",
          fit: BoxFit.fitHeight,
        ),
      ),
      SizedBox(height: 200.h),
      Container(
        height: 100.h,
        width: 280.w,
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
      SizedBox(height: 10.h),
      Padding(
        padding: const EdgeInsets.only(right: 30, top: 20).w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  "assets/images/logout.svg",
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
