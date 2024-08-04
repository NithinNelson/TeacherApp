import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:teacherapp/View/CWidgets/AppBarBackground.dart';
import '../../Controller/api_controllers/lessonObservationController.dart';
import '../../Models/api_models/learning_observation_api_model.dart';
import '../../Utils/Colors.dart';
import '../Home_Page/Home_Widgets/user_details.dart';
import '../Learning_Walk/Learningwalk_apply.dart';
import 'LessonObs_apply.dart';

class LessonObservation extends StatefulWidget {
  const LessonObservation({
    super.key,
  });

  @override
  State<LessonObservation> createState() => _LessonObservationState();
}

class _LessonObservationState extends State<LessonObservation> {
  TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: ScreenUtil().screenWidth,
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
                        shoBackgroundColor: false, isWelcome: false, bellicon: true, notificationcount: true,),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w, top: 120.h, right: 20.w),
                  // width: 550.w,
                  // height: 600.h,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 30),
                            child: Text(
                              "Lesson Observation",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          GetX<LessonObservationController>(
                            builder: (LessonObservationController controller) {
                              List<TeacherData> teacherList =
                                  controller.teacherNameList.value;
                              List<TeacherDetails?> teacherDetails =
                                  controller.teacherClassList.value;
                              List<SubjectDetail> subList =
                                  controller.teacherSubjectList.value;
                              // if (teacherList.isEmpty) {
                              //   return Image.asset(
                              //     "assets/images/nodata.gif",
                              //   );
                              // } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.w, right: 20.w, top: 20.h),
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Colors.black.withOpacity(0.5)),
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 15.0, horizontal: 20.0),
                                            hintText: "Teacher",
                                            counterText: "",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(230, 236, 254, 8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(230, 236, 254, 8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            fillColor: Color.fromRGBO(230, 236, 254, 8),
                                            filled: true),isExpanded: true,
                                        padding: const EdgeInsets.only(left: 10, right: 5).w,
                                        hint: const Text('Teacher'),
                                        validator: (dynamic value) =>
                                        value == null ? 'Field Required' : null,
                                        items: teacherList
                                            .map((teacher) =>
                                            DropdownMenuItem<String>(
                                              value:
                                              teacher.teacherName,
                                              child: Text(teacher.teacherName.toString(), overflow: TextOverflow.ellipsis,),
                                            ))
                                            .toList(),
                                        value: selectedValue,
                                        onChanged: (teacher) {
                                          setState(() {
                                            selectedValue = teacher;
                                            selectedValue1 = null;
                                            selectedValue2 = null;
                                          });
                                          controller.getTeacherClassData(teacherName: teacher.toString());
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.w, right: 20.w, top: 20.h),
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Colors.black.withOpacity(0.5)),
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 15.0, horizontal: 20.0),
                                            hintText: "Class",
                                            counterText: "",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(230, 236, 254, 8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(230, 236, 254, 8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            fillColor: Color.fromRGBO(230, 236, 254, 8),
                                            filled: true),
                                        padding: const EdgeInsets.only(left: 10, right: 5).w,
                                        hint: const Text('Class'),
                                        validator: (dynamic value) =>
                                        value == null ? 'Field Required' : null,
                                        items: teacherDetails.map((batchData) {
                                          String uniqueValue = "${batchData?.className} ${batchData?.batchName}";
                                          return DropdownMenuItem<String>(
                                            value: uniqueValue,
                                            child: SizedBox(
                                              width: 190.w,
                                              child: Text(
                                                "${batchData?.className} ${batchData?.batchName}",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        value: selectedValue1,
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedValue1 = newValue;
                                            selectedValue2 = null;
                                          });
                                          controller.getTeacherSubjectData(classAndBatch: selectedValue1.toString());
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.w, right: 20.w, top: 20.h),
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Colors.black.withOpacity(0.5)),
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 15.0, horizontal: 20.0),
                                            hintText: "Subject",
                                            counterText: "",
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(230, 236, 254, 8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(230, 236, 254, 8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            fillColor: Color.fromRGBO(230, 236, 254, 8),
                                            filled: true),
                                        padding: const EdgeInsets.only(left: 10, right: 5).w,
                                        hint: const Text('Subject'),
                                        validator: (dynamic value) =>
                                        value == null ? 'Field Required' : null,
                                        items: subList
                                            .map((sub) => DropdownMenuItem<String>(
                                          value: sub.subjectName,
                                          child: SizedBox(
                                            width: 190.w,
                                            child: Text(
                                              sub.subjectName.toString(),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )).toList(),
                                        value: selectedValue2,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue2 = value;
                                          });
                                          controller.setTeacherSubjectData(subName: selectedValue2.toString());
                                        },
                                      ),
                                    ),
                                  ],
                                );

                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            child: TextFormField(
                              controller: _controller,
                              validator: (dynamic value) =>
                              value.toString().trim().isEmpty ? 'Field Required' : null,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 20.0),
                                  hintText: "Topics",

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(230, 236, 254, 8),
                                        width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(230, 236, 254, 8),
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  fillColor: Color.fromRGBO(230, 236, 254, 8),
                                  filled: true),
                              cursorColor: Colors.grey,
                              keyboardType: TextInputType.text,
                              maxLength: 100,
                              maxLines: 5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 280, top: 2),
                            child: Text(
                              '',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: GestureDetector(
                              onTap: () {
                                if(_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LessonObservationApply(
                                                teacherName: selectedValue!,
                                                classAndBatch: selectedValue1!,
                                                subjectName: selectedValue2!,
                                                topic: _controller.text,
                                              )));
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, right: 75),
                                child: Container(
                                    height: 50.h,
                                    width: 220.w,
                                    decoration: BoxDecoration(
                                      color: Colorutils.userdetailcolor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Continue',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
