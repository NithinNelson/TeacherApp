
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacherapp/View/Learning_Walk/Learning_walk.dart';
import 'package:teacherapp/View/Lesson_Observation/Learning_Observation.dart';
import '../../Utils/Colors.dart';
import '../CWidgets/AppBarBackground.dart';
import 'Home_Widgets/user_details.dart';

class Leader extends StatefulWidget {
  const Leader({super.key});

  @override
  State<Leader> createState() => _LeaderState();
}

class _LeaderState extends State<Leader> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.93,
        child: Stack(
          children: [
            const AppBarBackground(),
            Positioned(
              left: 0,
              top: 15,
              child: Container(
                // height: 100.w,
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(17.0),
                ),
                child: const UserDetails(isLeaderHome: false),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, top: 120.h, right: 20.w, bottom: 20.w),
              // width: 550.w,
              // height: 545.h,
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
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Leadership',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Hos: Abitha',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueAccent),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.w, right: 15.w, top: 20.h),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('Cannot fetch teacher data')));
                        },
                        child: GestureDetector(
                          onTap: (){

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => lessonobs()));
                          },
                          child: Container(
                            height: 120.h,


                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(101, 63, 244, 8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 60.h,
                                  width: 75.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.transparent),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 25.w),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/notebook 1.png')),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: Container(
                                      // height:0.h,
                                      child: const Text(
                                        "Lesson  \nObservation ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromRGBO(
                                                240, 236, 254, 8)),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 35.h),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LessonWalk()));
                        },
                        child: Container(
                          height: 120.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff14C6C6),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 60.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.transparent),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 25.w),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/journalist 1.png' )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Container(
                                    // height: 50.h,
                                    child: Text(
                                      "Learning  \nWalk",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromRGBO(
                                              240, 236, 254, 8)),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(8).w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color.fromRGBO(0, 136, 170, 8),
                            ),
                            // height: 28,
                            // width: 100,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                                  CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/Synclesson.png",
                                  height: 20,
                                  // width: 20,
                                ),
                                const Text(
                                  "Sync Lesson",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(8).w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color.fromRGBO(0, 136, 170, 8),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                                  CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/Synclearning.png",
                                  height: 20,
                                  // width: 20,
                                ),
                                const Center(
                                    child: Text(
                                  "Sync Learning",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
