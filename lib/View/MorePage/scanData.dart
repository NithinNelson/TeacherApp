import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/View/Home_Page/Home_Widgets/bottom_navigationbar.dart';
import 'package:teacherapp/View/MorePage/supervisorSearch.dart';
import 'package:teacherapp/View/MorePage/trackingPage.dart';

import '../../Controller/api_controllers/hierarchController.dart';
import '../../Controller/api_controllers/qrController.dart';
import '../../Controller/api_controllers/recentListApiController.dart';
import '../../Controller/api_controllers/studentModelController.dart';
import '../../Models/api_models/HierarchyModel.dart';
import '../../Models/api_models/qr_clinic_model.dart';
import '../../Models/api_models/recentlist_model.dart';
import '../../Models/api_models/student_add_Model.dart';
import '../../Utils/Colors.dart';
import '../CWidgets/TeacherAppPopUps.dart';
import 'all_Students.dart';

class Scandata extends StatefulWidget {

  const Scandata({
    super.key,
  });

  @override
  State<Scandata> createState() => _ScandataState();
}

class _ScandataState extends State<Scandata> {
  bool spinner = false;
  bool isClicked = true;
  bool onTaped = true;
  bool isClicked1 = false;
  bool isClicked2 = false;
  bool isClicked3 = false;
  Users selectedName = Users(name: "Select HOD/HOS");
  TextEditingController _Remarkscontroller = TextEditingController();
  ValueNotifier<String?> _hosNameSelected = ValueNotifier(null);

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    context.loaderOverlay.show();
    await Get.find<Hierarchcontroller>().fetchHierarchyList();
    if (!mounted) return;
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: GetX<Qrcontroller>(
          builder: (Qrcontroller controller) {
            QrclinicModel Studentdetail = controller.studentqrdata.value;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 18),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_outlined,
                                size: 30,
                              ),
                            )),
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          "Add Students",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 8, top: 4),
                    child: Container(
                      height: 90.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 3),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 32.r,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90.h),
                                child: CachedNetworkImage(
                                  imageUrl: "${Studentdetail.profileImage}",
                                  placeholder: (context, url) => Text(
                                    Studentdetail.studentName
                                            ?.substring(0, 1) ??
                                        '',
                                    style: TextStyle(
                                        color: Color(0xFFB1BFFF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  errorWidget: (context, url, error) => Text(
                                    Studentdetail.studentName
                                            ?.substring(0, 1) ??
                                        '',
                                    style: TextStyle(
                                        color: Color(0xFFB1BFFF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 230.w,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 6,
                                  bottom: 6,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 230.w,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                              "${Studentdetail.studentName?.trim()}",
                                              style: GoogleFonts.inter(
                                                  textStyle: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600))),
                                        )),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Grade ${Studentdetail.batch?.split("/")[0]}"
                                      "-"
                                      "${Studentdetail.batch?.split("/")[1]}",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      "${Studentdetail.admnNo}",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 80.h,
                              child: QrImageView(
                                data: "${Studentdetail.classCode}",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Send To',
                            style: TextStyle(
                                fontSize: 16.w, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked = true;
                            isClicked1 = false;
                            isClicked2 = false;
                            isClicked3 = false;
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 80,
                          child: Column(
                            children: [
                              Container(
                                  height: 45,
                                  width: 45,
                                  child: isClicked
                                      ? Image.asset(
                                          "assets/images/2Clinic Selected.png")
                                      : Image.asset(
                                          "assets/images/1Clinic .png")),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Clinic",
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked1 = true;
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 80,
                          child: Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                    height: 45,
                                    width: 45,
                                    child: isClicked1
                                        ? Image.asset(
                                            "assets/images/2Washroom selecetd.png")
                                        : Image.asset(
                                            "assets/images/1Washroom.png")),
                                onTap: () {
                                  setState(() {
                                    isClicked1 = true;
                                    isClicked = false;
                                    isClicked2 = false;
                                    isClicked3 = false;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Washroom",
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked2 = true;
                            isClicked = false;
                            isClicked1 = false;
                            isClicked3 = false;
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 80,
                          child: Column(
                            children: [
                              Container(
                                  height: 45,
                                  width: 45,
                                  child: isClicked2
                                      ? Image.asset(
                                          "assets/images/2Counsellor selected.png")
                                      : Image.asset(
                                          "assets/images/1Counsellor.png")),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Counsellor",
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked2 = false;
                            isClicked = false;
                            isClicked1 = false;
                            isClicked3 = true;
                          });
                        },
                        child: Container(
                          height: 70,
                          width: 80,
                          child: Column(
                            children: [
                              Container(
                                  height: 45,
                                  width: 45,
                                  child: isClicked3
                                      ? Image.asset(
                                          "assets/images/Counsellor (2).png")
                                      : Image.asset(
                                          "assets/images/Counsellor (1).png")),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "HOD/HOS",
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  isClicked3
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 18,top: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Select HOD/HOS',
                                    style: TextStyle(
                                        fontSize: 16.w,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 18.w, right: 18.w, top: 10.h),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Supervisorsearch(selectedName: (Users user) {
                                                setState(() {
                                                  selectedName = user;
                                                });
                                              },)));
                                },
                                child: Container(
                                  height: 60.w,
                                  decoration: BoxDecoration(
                                    color:Colorutils.chatcolor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 15,right: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          selectedName.name ?? "",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colorutils.black, ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Icon(
                                            Icons.arrow_drop_down,

                                            // Change icon based on ontap value
                                            color: Colorutils.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       left: 10.w, right: 15.w, top: 20.h),
                            //   child: GetX<Hierarchcontroller>(
                            //     builder: (Hierarchcontroller controller) {
                            //       return DropdownButtonFormField(
                            //         decoration: InputDecoration(
                            //             hintStyle: TextStyle(
                            //                 color:
                            //                     Colors.black.withOpacity(0.3)),
                            //             contentPadding: EdgeInsets.symmetric(
                            //                 vertical: 15.0, horizontal: 20.0),
                            //             hintText: " Select a HOD/HOS ",
                            //             counterText: "",
                            //             border: OutlineInputBorder(
                            //               borderRadius: BorderRadius.all(
                            //                 Radius.circular(10.0),
                            //               ),
                            //             ),
                            //             enabledBorder: OutlineInputBorder(
                            //               borderSide: BorderSide(
                            //                 color: Colorutils.chatcolor,
                            //                 width: 1.0,
                            //               ),
                            //               borderRadius: BorderRadius.all(
                            //                   Radius.circular(10.0)),
                            //             ),
                            //             focusedBorder: OutlineInputBorder(
                            //               borderSide: BorderSide(
                            //                 color: Colorutils.chatcolor,
                            //                 width: 1.0,
                            //               ),
                            //               borderRadius: BorderRadius.all(
                            //                   Radius.circular(10.0)),
                            //             ),
                            //             fillColor: Colorutils.chatcolor
                            //                 .withOpacity(0.5),
                            //             filled: true),
                            //
                            //         padding: const EdgeInsets.only(
                            //                 left: 10, right: 5)
                            //             .w,
                            //         hint: const Text(" Select a HOD/HOS "),
                            //         validator: (dynamic value) =>
                            //             value == null ? 'Field Required' : null,
                            //         items: controller.hosdata
                            //             .map<DropdownMenuItem<dynamic>>((item) {
                            //           print(
                            //               "....bendcncdn........${controller.hosdata}");
                            //           return DropdownMenuItem<dynamic>(
                            //             value: item.sId,
                            //             child: Text(
                            //               item.name?.toUpperCase() ?? '--',
                            //               overflow: TextOverflow.ellipsis,
                            //               maxLines: 1,
                            //             ),
                            //           );
                            //         }).toList(),
                            //         value: _hosNameSelected.value,
                            //         isExpanded: false,
                            //         // onChanged: (dynamic newVal) {
                            //         //   newValue=newVal.s
                            //         //   _hosNameSelected.value = newVal;
                            //         //   print(".........._hosNameSelected.value.........${newVal}");
                            //         // },
                            //         onChanged: (dynamic newVal) {
                            //           // String selectedId = newVal.split('-')[1];
                            //
                            //           _hosNameSelected.value = newVal;
                            //           print(
                            //               "...............Selected ID: ${_hosNameSelected.value} ");
                            //         },
                            //       );
                            //     },
                            //   ),
                            // ),
                          ],
                        )
                      : SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Remarks',
                            style: TextStyle(
                                fontSize: 16.w, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      top: 5.h,
                      right: 20.w,
                      bottom: 5.h,
                    ),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        maxLength: 100,
                        controller: _Remarkscontroller,
                        validator: (val) =>
                            val!.isEmpty ? 'Please Enter Remarks.' : null,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black26),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 20.w),
                            hintText: " Enter Remarks   ",
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ).r,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colorutils.chatcolor, width: 1.0),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)).r,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colorutils.chatcolor, width: 1.0),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0))
                                      .r,
                            ),
                            fillColor: Colors.white,
                            filled: true),
                        maxLines: 5,
                      ),
                    ),
                  ),
                  Center(
                    child: spinner
                        ? Container(
                            margin: EdgeInsets.only(top: 15.h),
                            child: Center(child: spinkitNew))
                        : Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: GestureDetector(
                              onTap: () async {
                                onTaped = false;
                                String type = isClicked
                                    ? "clinic"
                                    : isClicked1
                                        ? "washroom"
                                        : isClicked2
                                            ? "counsellor"
                                            : isClicked3
                                                ? "HOD/HOS"
                                                : '';
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    spinner = true;
                                  });

                                  // List<RecentData> recentData = Get.find<RecentListApiController>().recentData.value;
                                  //
                                  // bool isContains = false;
                                  //
                                  // for (var sub in recentData) {
                                  //   if (sub.isprogress == true) {
                                  //
                                  //     isContains = sub.admissionNo != Studentdetail.admnNo;
                                  //     print("..............sub.admissionNo.....${sub.admissionNo}");
                                  //     print("..............Studentdetail.admnNo.....${Studentdetail.admnNo}");
                                  //     print("..............vebebeb.....${isContains}");
                                  //   }
                                  // }
                                  //
                                  // isContains ?
                                  playAlarm(Studentdetail.admnNo ?? "1/22");
                                  StudentAddModel sentData = StudentAddModel(
                                    academicYear: Get.find<UserAuthController>()
                                            .userData
                                            .value
                                            .academicYear ??
                                        '',
                                    admnNo: Studentdetail.admnNo,
                                    age: Studentdetail.age,
                                    batchDetails: Studentdetail.batch,
                                    dob: Studentdetail.dob,
                                    studentName: Studentdetail.studentName,
                                    fatherEmail: Studentdetail.fatherEmail,
                                    fatherName: Studentdetail.fatherName,
                                    fatherPhone: Studentdetail.fatherPhone,
                                    gender: Studentdetail.gender,
                                    profilePic: Studentdetail.profileImage,
                                    instID: Studentdetail.instID,
                                    remarks: _Remarkscontroller.text,
                                    role:selectedName.role ,
                                    sentTo: selectedName.sId,
                                    sentToName:selectedName.name,

                                    sentBy: Get.find<UserAuthController>()
                                            .userData
                                            .value
                                            .name ??
                                        '',
                                    sentById: Get.find<UserAuthController>()
                                            .userData
                                            .value
                                            .userId ??
                                        '',
                                    sentByToken: ' ',
                                    visitStatus:
                                        "Sent to ${type[0].toUpperCase()}${type.substring(1, type.length)}",
                                    appType: type,
                                  );
                                  await Get.find<Studentmodelcontroller>()
                                      .sendStudentData(data: sentData);

                                  await Get.find<RecentListApiController>()
                                      .fetchRecentList();
                                  // playAlarm(Studentdetail.admnNo ?? "1/22");
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  top: 5.h,
                                  right: 20.w,
                                  bottom: 5.h,
                                ),
                                child: Container(
                                    height: 50.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colorutils.userdetailcolor,
                                      borderRadius: const BorderRadius.all(
                                              Radius.circular(15))
                                          .r,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'SEND',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

final spinkitNew = SpinKitWave(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
        decoration: BoxDecoration(
      color: Colorutils.chatcolor,
    ));
  },
);

playAlarm(String admissionId) async {
  print("njjjjjjjjjjjjjjjj...");
  int id = int.parse(admissionId.split("/").first);
  await Alarm.init();
  DateTime alarmTime = DateTime.now().add(const Duration(seconds: 60));
  final alarmSettings = AlarmSettings(
    id: id,
    dateTime: alarmTime,
    assetAudioPath: 'assets/alarm.mp3',
    loopAudio: false,
    vibrate: false,
    volume: 0.5,
    fadeDuration: 5.0,
    // warningNotificationOnKill: Platform.Android,
    notificationSettings: const NotificationSettings(

      title: 'Student Tracking Alert',
      body: '',

    ),
  );
  Alarm.set(alarmSettings: alarmSettings);
}

stopAlarm(String admissionId) async {
  int id = int.parse(admissionId.split("/").first);
  await Alarm.init();
  Alarm.stop(id);
}
