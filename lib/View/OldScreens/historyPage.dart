import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/OldScreens/callNotAnswer.dart';
import 'package:teacherapp/View/OldScreens/committee.dart';
import 'package:teacherapp/View/OldScreens/missBehaviour.dart';
import 'package:teacherapp/View/OldScreens/wrongOrInvalid.dart';
import '../../Utils/constants.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class HistoryPage extends StatefulWidget {
  String? studentName;
  String? parentName;
  String? mobileNumber;
  String? classOfStudent;
  String? loginUserName;
  String? studentFees;
  String? admissionNumber;
  String? logedinEmployeecode;
  String? loginTeacherName;
  String? TeacherProfile;
  String? StudentImage;
  Widget? studentImageWidget;

  HistoryPage(
      {this.parentName,
      this.studentName,
      this.classOfStudent,
      this.mobileNumber,
      this.loginUserName,
      this.studentFees,
      this.admissionNumber,
      this.logedinEmployeecode,
      this.loginTeacherName,
      this.TeacherProfile,
      this.StudentImage,
      this.studentImageWidget});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);

class _HistoryPageState extends State<HistoryPage>
    with TickerProviderStateMixin {
  bool calender = true;
  bool call = false;
  bool invalid = false;
  bool misbe = false;

  double height(BuildContext context) => MediaQuery.of(context).size.height;

  double width(BuildContext context) => MediaQuery.of(context).size.width;

  var _ebiTextController = new TextEditingController();

  String? admissionNum;
  String? empCode;
  String? teacherName;

  Map<String, dynamic>? notificationResult;

  // int Count = 0;
  //
  // getNotification() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var userID = preferences.getString('userID');
  //
  //   var headers = {
  //     'x-auth-token': 'tq355lY3MJyd8Uj2ySzm',
  //     'Content-Type': 'application/json'
  //   };
  //   var request = http.Request(
  //       'GET',
  //       Uri.parse(
  //           '${ApiConstants.Notification}$userID${ApiConstants.NotificationEnd}'));
  //
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     // print(await response.stream.bytesToString());
  //     var responseJson = await response.stream.bytesToString();
  //     setState(() {
  //       notificationResult = json.decode(responseJson);
  //     });
  //
  //     for (var index = 0;
  //     index <
  //         notificationResult!["data"]["details"]["recentNotifications"]
  //             .length;
  //     index++) {
  //       if (notificationResult!["data"]["details"]["recentNotifications"][index]
  //       ["status"] ==
  //           "active") {
  //         Count += 1;
  //       }
  //     }
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     preferences.setInt("count", Count);
  //
  //     print(Count);
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

  // var count;
  // getCount() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     count = preferences.get("count");
  //   });
  // }

  // Timer? timer;

  @override
  void initState() {
    super.initState();
    // timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getCount());
    print("dddggdgd ${widget.StudentImage}");
    print("dddggdgd ${widget.loginTeacherName}");
    print("dddgwidget.logedinEmployeecodegdgd ${widget.logedinEmployeecode}");
    // getNotification();
    selectedbutton = 0;
    admissionNum = widget.admissionNumber;
    empCode = widget.logedinEmployeecode;
    teacherName = widget.loginTeacherName;
  }

  Widget _getMenuItem() {
    if (selectedbutton == 0)
      return CommittedPage(
        admissionNumber: widget.admissionNumber,
        employeeCode: widget.logedinEmployeecode,
        nameOfLoginTeacher: widget.loginUserName.toString(),
        fees: widget.studentFees,
      );
    else if (selectedbutton == 1)
      return CallNotAnswered(
        admissionNumber: widget.admissionNumber,
        employeeCode: widget.logedinEmployeecode,
        nameOfLoginTeacher: widget.loginUserName.toString(),
        fees: widget.studentFees,
      );
    else if (selectedbutton == 2)
      return WrongOrInvalid(
        admissionNumber: widget.admissionNumber,
        employeeCode: widget.logedinEmployeecode,
        nameOfLoginTeacher: widget.loginUserName.toString(),
        fees: widget.studentFees,
      );
    else if (selectedbutton == 3)
      return misbehav(
        admissionNumber: widget.admissionNumber,
        employeeCode: widget.logedinEmployeecode,
        nameOfLoginTeacher: widget.loginUserName.toString(),
        fees: widget.studentFees,
      );
    return Container();
  }

  int? selectedbutton;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleLight,
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(children: [
              Stack(
                children: [
                  const AppBarBackground(),
                  Positioned(

                      child: const UserDetails(
                          shoBackgroundColor: false,
                          isWelcome: false,
                          bellicon: true,
                          notificationcount: true)),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 130.h, left: 10.w, right: 10.w),
                child: Card(
                  child: Container(
                      // margin:
                      //     EdgeInsets.only(left: 50.w, top:100.h, right: 50.w),

                      decoration: BoxDecoration(
                        //border: Border.all(color: ColorUtils.BLUE),
                        color: Colors.white54,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.r),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 14.h, left: 20.w),
                            child: Text(
                              "Call Status Update",
                              style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 18.sp,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50.r)),
                                    side: BorderSide(
                                        width: 1.w, color: Colors.white)),
                                margin: EdgeInsets.all(10),
                                child: widget.StudentImage == " "
                                    ? Container(
                                        width: 60.w,
                                        height: 60.h,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFEEF1FF)),
                                        child: Image.asset(
                                            "assets/images/profile.png"),
                                      )
                                    : Container(
                                        width: 60.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(widget
                                                  .StudentImage.toString()),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                              ),
                              Container(
                                margin: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 240.w,
                                      child: Text(
                                        widget.studentName.toString().toUpperCase(),
                                        style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                fontSize: 18.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    widget.studentFees == null
                                        ? Text("")
                                        : Row(
                                            children: [
                                              const Text(
                                                "Pending Fees:",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Text(
                                                widget.studentFees.toString(),
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )
                                            ],
                                          ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        const Text(
                                          "Class:",
                                          style:
                                              TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          widget.classOfStudent.toString(),
                                          style: TextStyle(
                                              color: Color(0xFF587298)),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        const Text(
                                          "Parent Name:",
                                          style:
                                              TextStyle(color: Colors.grey),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          width: 155.w,
                                          child: Text(
                                            widget.parentName.toString(),
                                            style: TextStyle(
                                                color: Color(0xFF587298),
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        const Text(
                                          "Mobile No:",
                                          style:
                                              TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          widget.mobileNumber.toString(),
                                          style: TextStyle(
                                              color: Color(0xFF587298)),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ]),
            SizedBox(
              height: 10.h,
            ),

            Flexible(
              child: SingleChildScrollView(
                
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //SizedBox(width:15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            foregroundColor:
                                calender ? Colors.blueAccent : Colors.white,
                          ),
                          child: Container(
                              width: 50.w,
                              height: 50.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/vectorthree.png",
                                ),
                              )),
                          onPressed: () {
                            setState(() {
                              call = false;
                              invalid = false;
                              misbe = false;
                              if (calender == false) {
                                calender = true;
                              }
                              selectedbutton = 0;
                            });
                          },
                        ),
                        //SizedBox(width:10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            foregroundColor: call ? Colors.blueAccent : Colors.white,
                          ),
                          child: Container(
                              width: 50.w,
                              height: 50.h,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/vectortwo.png",
                                ),
                              )),
                          onPressed: () {
                            setState(() {
                              calender = false;
                              invalid = false;
                              misbe = false;
                              if (call == false) {
                                call = true;
                              }
                              selectedbutton = 1;
                            });
                          },
                        ),
                        //SizedBox(width:10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            foregroundColor:
                                invalid ? Colors.blueAccent : Colors.white,
                          ),
                          child: Container(
                              width: 50.w,
                              height: 50.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/vectorfour.png",
                                ),
                              )),
                          onPressed: () {
                            setState(() {
                              call = false;
                              calender = false;
                              misbe = false;
                              if (invalid == false) {
                                invalid = true;
                              }
                              selectedbutton = 2;
                            });
                          },
                        ),
                        //SizedBox(width:10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            foregroundColor: misbe ? Colors.blueAccent : Colors.white,
                          ),
                          child: Container(
                              width: 50.w,
                              height: 50.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/vectorone.png",
                                ),
                              )),
                          onPressed: () {
                            setState(() {
                              call = false;
                              invalid = false;
                              calender = false;
                              if (misbe == false) {
                                misbe = true;
                              }
                              selectedbutton = 3;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _getMenuItem(),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

// _logout(context) {
//   return Alert(
//     context: context,
//     type: AlertType.info,
//     title: "Are you sure you want to logout",
//     style: const AlertStyle(
//         isCloseButton: false,
//         titleStyle: TextStyle(color: Color.fromRGBO(66, 69, 147, 7))),
//     buttons: [
//       DialogButton(
//         color: ColorUtils.BLUE,
//         child: const Text(
//           "yes",
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         onPressed: () async {
//           await TimeTableDatabase.instance.delete();
//           SharedPreferences preferences =
//           await SharedPreferences.getInstance();
//           preferences.remove("email");
//           preferences.remove('userID');
//           preferences.remove('employeeNumber');
//           preferences.remove('name');
//           preferences.remove('designation');
//           preferences.remove("classData");
//           preferences.remove("employeeData");
//           preferences.remove("teacherData");
//           preferences.remove("school_id");
//           preferences.remove("images");
//           preferences.remove("teacher");
//           preferences.remove("hos");
//           preferences.remove("wallpaper");
//           NavigationUtils.goNextFinishAll(context, LoginPage());
//         },
//         // print(widget.academicyear);
//         //width: 120,
//       ),
//       DialogButton(
//         color: ColorUtils.BLUE,
//         child: const Text(
//           "No",
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

// @override
// void dispose() {
//   timer!.cancel();
//   super.dispose();
// }
}
String capitalizeFirstLetterOfEachWord(String input) {
  return input
      .trim()
      .split(' ')
      .where((word) => word.isNotEmpty) // Filter out empty strings
      .map((word) {
    print("$input...........input..............");
    String removeSpace = word.trim();
    print("$removeSpace...........removeSpace..............");
    return removeSpace[0].toUpperCase() + removeSpace.substring(1);
  })
      .join(' ');
}