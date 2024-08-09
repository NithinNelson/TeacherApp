import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:swipe_to/swipe_to.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/OldScreens/historyOfStudentActivity.dart';
import 'package:teacherapp/View/OldScreens/historyPage.dart';
import '../../Controller/api_controllers/userAuthController.dart';
import '../../Utils/api_constants.dart';
import '../../Utils/constants.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';
import '../My_Class/Myclass.dart';

class StudentListForHOS extends StatefulWidget {
  String? name;
  String? ClassAndBatch;
  String? LoginedUserEmployeeCode;
  var LoginedUserDesignation;
  String? subjectName;
  bool? isTeacher;
  bool? isAClassTeacher;
  String? totalProcessed;
  String? image;
  String? classTeacherName;
  Widget? CustomeImageContainer;

  StudentListForHOS(
      {this.name,
        this.ClassAndBatch,
        this.LoginedUserEmployeeCode,
        this.LoginedUserDesignation,
        this.subjectName,
        this.isTeacher,
        this.isAClassTeacher,
        this.totalProcessed,
        this.image,
        this.classTeacherName,
        this.CustomeImageContainer});

  @override
  _StudentListForHOSState createState() => _StudentListForHOSState();
}

class _StudentListForHOSState extends State<StudentListForHOS> {
  UserAuthController userAuthController = Get.find<UserAuthController>();
  bool currentState = true;
  bool isSpinner = false;
  var _searchController = TextEditingController();
  var className;
  var batchName;
  // stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String? _textSpeech = "Search Here";

  // void onListen() async {
  //   if (!_isListening) {
  //     bool available = await _speech.initialize(
  //         debugLogging: true,
  //         onStatus: (val) => print("the onStatus $val"),
  //         onError: (val) => print("onerror $val"));
  //     if (available) {
  //       setState(() {
  //         _isListening = true;
  //       });
  //       _speech.listen(
  //           onResult: (val) => setState(() {
  //             _textSpeech = val.recognizedWords;
  //             _searchController.text = _textSpeech!;
  //             newResult = uniqueList
  //                 .where((element) =>
  //             element["student_name"]
  //                 .contains("${_textSpeech!.toUpperCase()}") ||
  //                 element["Admn_no"]
  //                     .contains("${_textSpeech!.toUpperCase()}"))
  //                 .toList();
  //           }));
  //     }
  //   } else {
  //     setState(() {
  //       _isListening = false;
  //       _speech.stop();
  //     });
  //   }
  // }

  List searchedStudentName = [];
  List newResult = [];
  Timer? timer;
  List forSearch = [];
  List uniqueList = [];
  List orderedList = [];
  var ClassesOfTeachers;
  var employeeid;

  Map<String, dynamic>? historyOfStudentFees;

  Future<void> getStudentFeeList() async {
    var header = {"API-Key": "525-777-777", "Content-Type": "application/json"};
    var request = http.Request('POST', Uri.parse(ApiConstants.DOCME_URL));
    request.body = json.encode({
      "action": "getEmployeeFeedbackById",
      "token": userAuthController.schoolToken.value,
      "employee_code": widget.LoginedUserEmployeeCode,
      "feedback_type_id": [1, 2, 3, 4, 5, 6, 7]
    });

    request.headers.addAll(header);

    http.StreamedResponse response = await request.send();

    log("${response.statusCode}");
    log("bodyrequest${request.body}");

    if (response.statusCode == 200) {
      var responseJson = await response.stream.bytesToString();
      print('std list-------->$responseJson');
      var studentList = json.decode(responseJson);

      setState(() {
        historyOfStudentFees = studentList;
        orderedList = historyOfStudentFees!["data"];
        print('historyyyyyy-----$historyOfStudentFees');
      });
      var seen = Set<dynamic>();
      uniqueList = orderedList
          .where((element) => seen.add(element["student_name"]))
          .toList();
      log("the student list is $uniqueList");

      var classData = [];
      for (var index = 0;
      index < historyOfStudentFees!["data"].length;
      index++) {
        classData.add({
          "class": historyOfStudentFees!["data"][index]["Class"],
          "batch": historyOfStudentFees!["data"][index]["Division"].trim()
        });
      }

      final jsonList = classData.map((item) => jsonEncode(item)).toList();
      final uniqueJsonList = jsonList.toSet().toList();
      ClassesOfTeachers =
          uniqueJsonList.map((item) => jsonDecode(item)).toList();

      log("hdhdhdh  ${ClassesOfTeachers}");
      log("employeeidemployeeid${employeeid}");
      // log("${classData}");
      //
      // var removeDuplicates = classData.toSet().toList();
      // var newClassTeacherCLass = removeDuplicates.where((element) => element.contansKey("class")).toSet().toList();
      //
      // log(" the class is $newClassTeacherCLass");

      className = historyOfStudentFees!["data"][0]["Class"];
      batchName = historyOfStudentFees!["data"][0]["Division"];

      log('claclassNamessName$className');
      log('batchbatchNameName$batchName');
    } else {
      log("response.reasonPhrasestudentlisthos${response.reasonPhrase}");
    }
  }



  @override
  void initState() {
    getStudentFeeList().then((value) {
      print('historyOfStudentFees${historyOfStudentFees}');
      print('LoginedUserEmployeeCode${widget.LoginedUserEmployeeCode}');
      print('orderedList${orderedList}');
    });
    // timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getCount());
    // print('countcountcount${count}');
    print('classTeacherName${widget.classTeacherName}');
    print('namename${widget.name}');

    // getNotification();
    log("LoginedUserEmployeeCodeLoginedUserEmployeeCode${widget.LoginedUserEmployeeCode}");

    // _speech = stt.SpeechToText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleLight,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  const AppBarBackground(),
                  Positioned(
                    left: 0,
                    top: -10,
                    child: Container(
                      // height: 100.w,
                      width: ScreenUtil().screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      child: const UserDetails(
                        shoBackgroundColor: false, isWelcome: false,bellicon: true, notificationcount: true,),
                    ),
                  ),
                  // const UserDetails(shoBackgroundColor: false, isWelcome: true, bellicon: true, notificationcount: true),

                  Container(
                    margin: EdgeInsets.only(left: 10.w, top: 120.h, right: 10.w),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(

                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colorutils.userdetailcolor.withOpacity(0.2),
                            // Shadow color
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3), // Shadow position
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Theme(
                              data: ThemeData()
                                  .copyWith(dividerColor: Colors.transparent),
                              child: Container(
                                margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(0xFFEEF1FF)),
                                          color: Color(0xFFEEF1FF)),
                                      child: widget.CustomeImageContainer,
                                    ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                            child: Text(
                                                toBeginningOfSentenceCase(widget
                                                    .classTeacherName
                                                    .toString()
                                                    .toLowerCase())
                                                    .toString(),
                                                style: GoogleFonts.inter(
                                                    textStyle: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.w600)))),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        IntrinsicHeight(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                child: Text(
                                                  "Total Processed :",
                                                  style:
                                                  TextStyle(fontSize: 14.sp),
                                                ),
                                              ),
                                              SizedBox(
                                                child: Text(
                                                  widget.totalProcessed
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.red,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ),
                                              ClassesOfTeachers == []
                                                  ? const Text("")
                                                  : const VerticalDivider(
                                                thickness: 1,
                                                width: 10,
                                                color: Colors.blueGrey,
                                              ),
                                              ClassesOfTeachers == null
                                                  ? Text("")
                                                  : ClassesOfTeachers.length > 1
                                                  ? Row(
                                                children: [
                                                  for (var i = 0;
                                                  i <
                                                      ClassesOfTeachers
                                                          .length;
                                                  i++)
                                                    SizedBox(
                                                      child:
                                                      ClassesOfTeachers ==
                                                          []
                                                          ? const Text(
                                                          "")
                                                          : Text(
                                                        ClassesOfTeachers[i]["class"] +
                                                            "" +
                                                            ClassesOfTeachers[i]["batch"] +
                                                            " ",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: Colors.green,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                ],
                                              )
                                                  : SizedBox(
                                                child: className == null
                                                    ? const Text("")
                                                    : Text(
                                                  className +
                                                      " " +
                                                      batchName,
                                                  style: TextStyle(
                                                      fontSize:
                                                      14.sp,
                                                      color: Colors.green,
                                                      fontWeight:
                                                      FontWeight
                                                          .bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            )
                            // const Divider(
                            //   indent: 20,
                            //   endIndent: 20,
                            //   height: 20,
                            // )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: TextFormField(
                            controller: _searchController,
                            onChanged: (value) {
                              setState(() {
                                newResult = uniqueList
                                    .where((element) =>
                                element["student_name"]
                                    .contains("${value.toUpperCase()}") ||
                                    element["Admn_no"]
                                        .contains("${value.toUpperCase()}"))
                                    .toList();
                                print(newResult);
                                print(_searchController.text);
                              });
                            },
                            validator: (val) =>
                            val!.isEmpty ? 'Enter the Topic' : null,
                            cursorColor: Colorutils.userdetailcolor ,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colorutils.userdetailcolor.withOpacity(0.5)),
                                hintText:
                                _isListening ? "Listening..." : "Search Here",
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colorutils.userdetailcolor.withOpacity(0.5),
                                ),
                                // suffixIcon: GestureDetector(
                                //   onTap: () => onListen(),
                                //   child: AvatarGlow(
                                //     animate: _isListening,
                                //     glowColor: Colors.blue,
                                //     endRadius: 20.0,
                                //     duration: Duration(milliseconds: 2000),
                                //     repeat: true,
                                //     showTwoGlows: true,
                                //     repeatPauseDuration:
                                //         Duration(milliseconds: 100),
                                //     child: Icon(
                                //       _isListening == false
                                //           ? Icons.keyboard_voice_outlined
                                //           : Icons.keyboard_voice_sharp,
                                //       color: ColorUtils.SEARCH_TEXT_COLOR,
                                //     ),
                                //   ),
                                // ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2.0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:Colorutils.chatcolor.withOpacity(0.4),
                                      width: 1.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:Colorutils.chatcolor.withOpacity(0.2),
                                      width: 1.0),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                                ),
                                fillColor: Colorutils.chatcolor.withOpacity(0.2),
                                filled: true),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        historyOfStudentFees == null
                            ? Expanded(
                          child: Center(
                            child: Text(
                              "Loading....",
                            ),
                          ),
                        )
                            : Expanded(
                            child: ListView.builder(
                              itemCount:
                              _searchController.text.toString().isNotEmpty
                                  ? newResult.length
                                  : uniqueList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SwipeTo(
                                  rightSwipeWidget: Padding(
                                    padding: const EdgeInsets.only(bottom:12,left: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colorutils.userdetailcolor.withOpacity(0.5),
                                        // Container color
                                        borderRadius: BorderRadius.circular(15),
                                        // Border radius
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colorutils.chatcolor.withOpacity(0.1),

                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0, 2), // Shadow position
                                          ),
                                        ],
                                      ),                                    // Container color

                                      padding: EdgeInsets.all(30),
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onRightSwipe: (_) {
                                    showDialog(
                                      context,
                                      _searchController.text
                                          .toString()
                                          .isNotEmpty
                                          ? toBeginningOfSentenceCase(
                                          newResult[index]
                                          ["student_name"]
                                              .toString()
                                              .toLowerCase())
                                          .toString()
                                          : toBeginningOfSentenceCase(
                                          uniqueList[index]
                                          ["student_name"]
                                              .toString()
                                              .toLowerCase())
                                          .toString(),
                                      " ",
                                      true,
                                      _searchController.text
                                          .toString()
                                          .isNotEmpty
                                          ? newResult[index]["Parent_name"]
                                          .toString()
                                          : uniqueList[index]["Parent_name"],
                                      _searchController.text
                                          .toString()
                                          .isNotEmpty
                                          ? newResult[index]["Parent_contact"]
                                          .toString()
                                          : uniqueList[index]["Parent_contact"],
                                      _searchController.text
                                          .toString()
                                          .isNotEmpty
                                          ? newResult[index]["Admn_no"]
                                          : uniqueList[index]["Admn_no"],
                                      _searchController.text
                                          .toString()
                                          .isNotEmpty
                                          ? newResult[index]
                                      ["Followup_fee_amount"]
                                          : uniqueList[index]
                                      ["Followup_fee_amount"],
                                    );
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10.w),
                                      child: Column(
                                        children: [
                                          Theme(
                                            data: ThemeData().copyWith(
                                                dividerColor:
                                                Colors.transparent),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 50.w,
                                                  height: 50.h,
                                                  decoration:
                                                  const BoxDecoration(
                                                      shape:
                                                      BoxShape.circle,
                                                      color: Color(
                                                          0xFFEEF1FF)),
                                                  child: Image.asset(
                                                      "assets/images/profile.png"),
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        width: 300.w,
                                                        child: Text(
                                                            _searchController
                                                                .text
                                                                .toString()
                                                                .isNotEmpty
                                                                ? toBeginningOfSentenceCase(newResult[index]["student_name"]
                                                                .toString()
                                                                .toLowerCase())
                                                                .toString()
                                                                .toUpperCase()
                                                                : toBeginningOfSentenceCase(uniqueList[index]["student_name"]
                                                                .toString()
                                                                .toLowerCase())
                                                                .toString()
                                                                .toUpperCase(),
                                                            style: GoogleFonts.inter(
                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                    16.sp,
                                                                    color: Colors.black,
                                                                    fontWeight:
                                                                    FontWeight.bold)))),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              child: Text(
                                                                "AED :",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    14.sp),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              child: Text(
                                                                _searchController
                                                                    .text
                                                                    .toString()
                                                                    .isNotEmpty
                                                                    ? newResult[
                                                                index]
                                                                [
                                                                "Followup_fee_amount"]
                                                                    : uniqueList[
                                                                index]
                                                                [
                                                                "Followup_fee_amount"],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    14.sp,
                                                                    color: Colors.red,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        VerticalDivider(
                                                          thickness: 1,
                                                          width: 10,
                                                          color:
                                                          Colors.black,
                                                        ),
                                                        SizedBox(
                                                          child: Text(
                                                            _searchController
                                                                .text
                                                                .toString()
                                                                .isNotEmpty
                                                                ? newResult[index]
                                                            [
                                                            "Class"] +
                                                                newResult[
                                                                index]
                                                                [
                                                                "Division"]
                                                                : uniqueList[
                                                            index]
                                                            [
                                                            "Class"] +
                                                                uniqueList[
                                                                index]
                                                                [
                                                                "Division"],
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: Colors.green,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          const Divider(
                                            indent: 5,
                                            endIndent: 20,
                                            height: 5,

                                            thickness: 0.3,
                                            color: Colorutils.chatcolor,
                                          )
                                        ],
                                      )),
                                );
                              },
                            )),
                        SizedBox(
                          height: 210.h,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future showDialog(
      BuildContext context,
      String studentName,
      String image,
      bool is_fees_paid,
      String parentName,
      String ParentContact,
      String AdmissionNumber,
      String fees) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
        ),
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 2.5,
            margin: EdgeInsets.all(30),
            child: ListView(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFEEF1FF)),
                      child: Image.asset("assets/images/profile.png"),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 240.w,
                            child: Text(studentName,
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)))),
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              child: Text(
                                "AED :",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                fees,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  indent: 5,
                  endIndent: 5,
                  height: 20,
                  color: Colorutils.chatcolor,

                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.h,
                          child: SvgPicture.asset(
                            "assets/images/profileOne.svg",
                            color: Color(0xFF88A9FF),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 150.w,
                                child: Text(parentName,
                                    style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)))),
                            SizedBox(
                              height: 6.h,
                            ),
                            SizedBox(
                              child: Text(
                                ParentContact,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Utils.call(ParentContact),
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        child: SvgPicture.asset(
                          "assets/images/callButtonTwo.svg",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),

                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 25.h,
                ),

                SizedBox(
                  height: 10.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        {
                          print("thee  ddd ${parentName}");
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return HistoryOfStudentActivity(
                              mobileNumber: ParentContact,
                              loginUserName: widget.name,
                              classOfStudent: className + " " + batchName,
                              parentName: parentName,
                              TeacherProfile: widget.image,
                              studentName: studentName,
                              logedinEmployeecode: employeeid,
                              admissionNumber: AdmissionNumber,
                              StudentImage: image,
                              studentFees: fees,
                            );
                          }));
                        };
                      },
                      child: Container(
                        width: 150.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                          color:  Colorutils.bottomnaviconcolor,
                          borderRadius: BorderRadius.circular(15),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color:  Colorutils.bottomnaviconcolor,
                          //
                          //     // Shadow color
                          //     spreadRadius: 0.2,
                          //     blurRadius: 1,
                          //     offset: Offset(0, 1), // Shadow position
                          //   ),
                          // ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/icon.svg",
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Call Status",
                                style: TextStyle(fontSize: 15.sp,color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    is_fees_paid == false
                        ? Text(""):
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return HistoryPage(
                            mobileNumber: ParentContact,
                            loginUserName: widget.name,
                            classOfStudent: className + " " + batchName,
                            parentName: parentName,
                            TeacherProfile: widget.image,
                            studentName: studentName,
                            logedinEmployeecode: employeeid,
                            admissionNumber: AdmissionNumber,
                            StudentImage: image,
                            studentFees: fees,
                          );
                        }));
                      },
                      child: CircleAvatar(
                          backgroundColor: Colorutils.bottomnaviconcolor,
                          radius: 25,

                          child:Icon(Icons.add,color: Colors.white,shadows: [
                            BoxShadow(blurRadius: 1,color: Colorutils.userdetailcolor)
                          ],)

                      ),
                    )

                  ],
                ),

              ],
            ),
          );
        });
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
  //         color: Colors.blue,
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

  // Widget _getCallButton(String phoneNumber) => GestureDetector(
  //   onTap: () {
  //     Utils.call(phoneNumber);
  //     print("button presses");
  //   },
  //   child: Container(
  //     child: Image.asset("assets/images/callbutton.png"),
  //   ),
  // );
}
