import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/View/MorePage/scan.dart';
import 'package:teacherapp/View/MorePage/scanData.dart';
import 'package:teacherapp/View/MorePage/viewAll.dart';

import '../../Controller/api_controllers/qrController.dart';
import '../../Models/api_models/qr_clinic_model.dart';
import '../../Utils/Colors.dart';
import '../Home_Page/Home_Widgets/bottom_navigationbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textcontroller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: GetX<Qrcontroller>(
          builder: (Qrcontroller controller) {
            List<QrclinicModel> Studentdetails =
                controller.SearchNameList.value;

            print("..............Studentdetails.....$Studentdetails");
            return Column(
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
                        "Search",
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
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        border: Border(),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: double.infinity,
                    child: TextFormField(
                      controller: _textcontroller,
                      onChanged: (value) async {
                        controller.resetData();
                        // controller.SearchNameList.value=[];
                        if (_textcontroller.text.length >= 3) {
                          await controller.fetchSearchData(searchData: value);
                        }
                        // // Get.find<LeaveApprovalController>().filterLeaveList(text: value);
                      },
                      validator: (val) =>
                          val!.isEmpty ? 'Enter the Topic' : null,
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Search Student Name or Adm.No",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 25,
                                width: 25,
                                child: SvgPicture.asset(
                                    "assets/images/MagnifyingGlass (1).svg")),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0.2)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(230, 236, 254, 8),
                                width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          fillColor: Colorutils.Whitecolor,
                          filled: true),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // for (int i=0;i<Studentdetails.length; i++)
                //    listcontainer(Studentdetails: Studentdetails[i],)
                _textcontroller.text.isEmpty
                    ? Container(
                        height: 250,
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Text(
                            'Please Enter the Student Name or Admission Number to Search...',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                                fontStyle: FontStyle.italic),textAlign: TextAlign.center,
                          ),
                        )))
                    : Expanded(
                        child: controller.isLoading.value
                            ? Center(
                                child: Container(
                                    height: 30,
                                    width: 30,
                                    child: const CircularProgressIndicator(
                                      color: Colorutils.chatcolor,
                                    )))
                            : Studentdetails.isNotEmpty
                                ? ListView.builder(
                                    itemCount: Studentdetails.length,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                            onTap: () {
                                              controller.studentqrdata.value =
                                                  Studentdetails[index];
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Scandata()));
                                            },
                                            child: listcontainer(
                                              Studentdetails:
                                                  Studentdetails[index],
                                            )))
                                : Container(
                                    child: Center(
                                        child: Text(
                                    'No data Found...',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                        fontStyle: FontStyle.italic),
                                  ))))
              ],
            );
          },
        ),
      ),
    );
  }
}

class listcontainer extends StatelessWidget {
  final QrclinicModel Studentdetails;

  const listcontainer({super.key, required this.Studentdetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 4),
      child: Container(
        // height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90.h),
                  child: CachedNetworkImage(
                    imageUrl: "${Studentdetails.profileImage}",
                    placeholder: (context, url) => Text(
                      Studentdetails.studentName?.substring(0, 1) ?? '',
                      style: TextStyle(
                          color: Color(0xFFB1BFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    errorWidget: (context, url, error) => Text(
                      Studentdetails.studentName?.substring(0, 1).trim() ?? '',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 270.w,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text("${Studentdetails.studentName}",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text("${Studentdetails.admnNo}",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey,
                          ))),
                      SizedBox(width: 10,),
                      Text(
                          "|   Grade"
                              " "
                              "${Studentdetails.classCode}"
                              "-"
                              "${mainData("${Studentdetails.batch}")}",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)))

                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
String mainData(String str) {
  List<String> parts = str.split('/');
  String result = parts[1];  // This will be "B"
  return result;
}