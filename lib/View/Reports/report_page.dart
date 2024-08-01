import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Models/api_models/learning_observation_api_model.dart';
import 'package:teacherapp/View/Learning_Walk/learning_walk_widgets/question_radio_fields.dart';
import 'package:teacherapp/View/Lesson_Observation/question_radio_obsfields.dart';
import '../../Utils/Colors.dart';
import '../../Utils/font_util.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({
    super.key,
  });

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool _isListening = true;
  bool isChecked = true;
  String? _selectedValue = '';
  Map<String, dynamic>? teacherList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                AppBarBackground(),
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
                        shoBackgroundColor: false, isWelcome: false),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, top: 120.h, right: 10.w),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
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
                      // padding: const EdgeInsets.all(5),
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              15, 10, 10, 10),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reports',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Hos: ben',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueAccent),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 10.w, right: 10.w),
                          child: TextFormField(
                            // controller: _searchController,
                            // validator: (val) =>
                            // val!.isEmpty ? 'Enter the Topic' : null,
                            // controller: _textController,
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {
                                // newReport = newTeacherList
                                //     .where((element) => element["employee_name"]
                                //     .contains("${value.toUpperCase()}"))
                                //     .toList();
                                // print(newReport);
                              });
                            },
                            decoration: InputDecoration(
                                hintStyle:
                                    TextStyle(color: Colors.grey),
                                hintText: _isListening
                                    ? "Listening..."
                                    : "Search Here",
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.cyanAccent,
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
                                      color: Color.fromRGBO(
                                          230, 236, 254, 8),
                                      width: 1.0),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(
                                          230, 236, 254, 8),
                                      width: 1.0),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                fillColor:
                                    Color.fromRGBO(230, 236, 254, 8),
                                filled: true),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            key: Key('builder basb '),
                            itemCount: 10,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return _getProfileOfStudents(
                                  'gzh', "swge", "hah", "ssj", 13);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 140.h,
                        )
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _getProfileOfStudents(String image, String nameOfTeacher,
    String totalProcessed, String employeeCode, int index) {
  return Theme(
    data: ThemeData().copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      key: Key(index.toString()),
      //attention
      initiallyExpanded: false,
      onExpansionChanged: ((newState) {
        print(newState);
        // if (newState)
        //   setState(() {
        //     Duration(seconds: 20000);
        //     selected = index;
        //     commitedCallsDetail(employeeCode);
        //     wrongNumberDetails(employeeCode);
        //     misbehaveDetails(employeeCode);
        //     callNotAnswerDetail(employeeCode);
        //   });
        // else
        //   setState(() {
        //     selected = -1;
        //   });
      }),
      iconColor: Colors.cyanAccent,
      leading: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.r)),
        ),
        margin: EdgeInsets.only(top: 5.h),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFEEF1FF)),
                color: Color(0xFFEEF1FF)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nameOfTeacher.toString()[0],
                    style: TextStyle(
                        color: Color(0xFFB1BFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    nameOfTeacher.toString()[1].toUpperCase(),
                    style: TextStyle(
                        color: Color(0xFFB1BFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      title: Row(
        children: [
          Container(
              width: 200.w,
              child: Text(nameOfTeacher,
                  style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)))),
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            "Total Processed :",
            style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(fontSize: 12.sp, color: Colors.black)),
          ),
          Text(
            totalProcessed,
            style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      children: [
        ProfileContainer(
          12,
          12,
          12,
          12,
          12,
          12,
          12,
          12,
          12,
        ),
      ],
    ),
  );
}

Widget ProfileContainer(
    final int committed,
    final int callnot,
    final int wrong,
    final int misbehave,
    var name,
    var image,
    var employeecode,
    var teachername,
    var processed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFF4F6FB)),
              child: Image.asset("assets/images/vectorthree.png")),
          Text(
            committed.toString(),
            style: TextStyle(
                color: Colors.cyanAccent, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
      SizedBox(
        width: 10.w,
        height: 10.h,
      ),
      Column(
        children: [
          Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFF4F6FB)),
              child: Image.asset("assets/images/vectortwo.png")),
          Text(
            callnot.toString(),
            style: TextStyle(
                color: Colors.cyanAccent, fontWeight: FontWeight.bold),
          )
        ],
      ),
      SizedBox(
        width: 20.w,
        height: 10.h,
      ),
      Column(
        children: [
          Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFF4F6FB)),
              child: Image.asset("assets/images/vectorfour.png")),
          Text(
            wrong.toString(),
            style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
          )
        ],
      ),
      SizedBox(
        width: 20.w,
        height: 10.h,
      ),
      Column(
        children: [
          Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFF4F6FB)),
              child: Image.asset("assets/images/vectorone.png")),
          Text(
            misbehave.toString(),
            style: TextStyle(
                color: Colors.cyanAccent, fontWeight: FontWeight.bold),
          )
        ],
      ),
      SizedBox(
        width: 10.w,
        height: 15.h,
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFF4F6FB)),
            child: SvgPicture.asset("assets/images/next.svg")),
      ),
      SizedBox(
        height: 10.h,
      ),
    ],
  );
}
