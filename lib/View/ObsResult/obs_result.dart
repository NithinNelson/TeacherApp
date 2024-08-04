import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';

import '../../Utils/Colors.dart';
import '../../Utils/api_constants.dart';
import '../../Utils/constants.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';
import '../Notification/Notification.dart';
import 'Obsresult_display.dart';
import 'package:http/http.dart' as http;
class ObsResult extends StatefulWidget {
  var loginedUserName;
  String? images;
  String? name;

  ObsResult({
    Key? key,
    this.loginedUserName,
    this.images,
    this.name,
  }) : super(key: key);

  @override
  State<ObsResult> createState() => _ObsResultState();
}

class _ObsResultState extends State<ObsResult> {
  bool isSpinner = false;
  var nodata = ' ';
  Map<String, dynamic>? ObservationData;
  // Map<String, dynamic>? ObservationDataList;
  var ObservationDataList = [];
  var count;
  int Count = 0;
  var IMAGE;
  Map<String, dynamic>? notificationResult;

  getCount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      count = preferences.get("count");
    });
  }

  Timer? timer;
  void initState() {
    getObservationdata();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getCount());
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();
  }
  Future getObservationdata() async {
    print('callingdetdata');
    setState(() {
      isSpinner = true;
    });
    UserAuthController userAuthController = Get.find<UserAuthController>();
    var userID = userAuthController.userData.value.userId;
    var schoolID = userAuthController.userData.value.schoolId;
    var academicyear = userAuthController.userData.value.academicYear;
    print("____---shared$schoolID");
    print("____---user$userID");
    print("____---academic$academicyear");
    var headers = {
      'x-auth-token': 'tq355lY3MJyd8Uj2ySzm',
      'Content-Type': 'application/json'
    };
    var body = {
      "school_id": schoolID,
      "academic_year": academicyear,
      "teacher_id": userID,
    };
    print('-body__Observation$body');
    var request = await http.post(Uri.parse(ApiConstants.Observationlist),
        headers: headers, body: json.encode(body));
    var response = json.decode(request.body);
    // print('------------api response---------------$response');
    ObservationData = response;
    ObservationDataList = response['data']['details'];
    print('------------api response---------------$ObservationData');
    print('------------ObservationDataList---------------$ObservationDataList');
    if (ObservationDataList.isEmpty ) {
      setState(() {
        isSpinner = false;
      });
      nodata = 'No Data';
    }
    setState(() {
      isSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleLight,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height * 0.98,
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
                      shoBackgroundColor: false,
                      isWelcome: true,
                      bellicon: true,
                      notificationcount: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10.w,
                    top: 120.h,
                    right: 10.w,
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r)),
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Text(
                                'Observation Result',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 580.h,
                          child: isSpinner
                              ? Container(
                            color: Colors.white,
                            height: 580.h,
                          )
                              : ObservationDataList.isEmpty
                              ? Center(
                              child:
                              Image.asset("assets/images/nodata.gif")
                          )
                              :  ListView.builder(
                            itemCount: ObservationDataList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return _resultlist(
                                observer_name: ObservationDataList[index]['observer_name'],
                                date_of_observation: ObservationDataList[index]['date_of_observation'],
                                subject_name: ObservationDataList[index]['subject_name'] ?? '--',
                                id: ObservationDataList[index]['_id'],
                                type: capitalizeFirstLetters(ObservationDataList[index]['type'].toString().replaceAll('_', ' ')),
                              );
                            },

                          ),
                        ),
                        // ListView.builder(
                        //   itemCount:10,
                        //   shrinkWrap: true,
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return _resultlist();
                        //   },
                        //
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _resultlist({
    String? observer_name,
    // int? index,
    String? date_of_observation,
    required String subject_name,
    String? id,
    String? type,
  }) =>
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ObsResultdisplay(
                name: widget.name,
                images: widget.images,
                loginedUserName: widget.loginedUserName,
                Subject_name: subject_name,
                Doneby: observer_name,
                Date: date_of_observation,
                Observerid: id,
              )));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
          child: Container(
            height: 160.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colorutils.chatcolor.withOpacity(0.05),
                border: Border.all(color: Colorutils.chatcolor)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 2),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      type!,
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colorutils.chatcolor),
                        ),
                        child: Center(
                          child:  CachedNetworkImage(
                            imageUrl:
                            ApiConstants.IMAGE_BASE_URL + "--",
                            errorWidget: (context, url, error) => Text(
                              subject_name.toString().substring(0, 1),
                              style: TextStyle(
                                  color: Color(0xFFB1BFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 200.w,
                                child: Text(
                                  subject_name,
                                  // 'Subject',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700),
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                                width: 230.w,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 70.w,
                                      child: Text(
                                        'Done By',
                                        // 'Observer Name',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      width: 10.w,
                                      child: Text(
                                        ':',
                                        // 'Observer',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 140.w,
                                      child: Text(
                                        '${observer_name!}',
                                        // 'Observer',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 70.w,
                                  child: Text(
                                    'On',
                                    // 'Observer Name',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  width: 10.w,
                                  child: Text(
                                    ':',
                                    // 'Observer',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 140.w,
                                  child: Text(
                                    " ${date_of_observation!.split('T')[0].split('-').last}-${date_of_observation.split('T')[0].split('-')[1]}-${date_of_observation.split('T')[0].split('-').first}",
                                    // 'Observer',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
String capitalizeFirstLetters(String sentence) {
  if (sentence == null || sentence.isEmpty) {
    return '';
  }

  List<String> words = sentence.split(' ');
  List<String> capitalizedWords = [];

  for (String word in words) {
    if (word.isNotEmpty) {
      String capitalizedWord =
          word[0].toUpperCase() + word.substring(1).toLowerCase();
      capitalizedWords.add(capitalizedWord);
    }
  }

  return capitalizedWords.join(' ');
}
