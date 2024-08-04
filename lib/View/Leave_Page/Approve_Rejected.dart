import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/leaveApprovalController.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/api_constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Models/api_models/leave_approval_api_model.dart';

class ApproveRejected extends StatelessWidget {
  const ApproveRejected({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 6.w, right: 6.w),
          child: TextFormField(
            onChanged: (value) {
              Get.find<LeaveApprovalController>().filterLeaveList(text: value);
            },
            validator: (val) => val!.isEmpty ? 'Enter the Topic' : null,
            cursorColor: Colors.grey,
            keyboardType: TextInputType.text,
            decoration:InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Search Here",
                prefixIcon: Icon(
                  Icons.search,
                  color:Colors.grey,
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
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(

                  borderRadius: BorderRadius.all(

                    Radius.circular(2.0),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(230, 236, 254, 8), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                fillColor: Colorutils.Whitecolor,
                filled: true),
          ),
        ),
        GetX<LeaveApprovalController>
          (builder: (LeaveApprovalController controller) {
          List<ApprovedOrRejected> leaveList = controller.filteredApprovedOrRejectedLeaves.value;
            return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                // Divider(color: Colors.black26,height: 2.h,),
                for (int i = 0; i < leaveList.length; i++)
                  Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 5),
                  padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
                  width: MediaQuery.of(context).size.width,
                  // height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color:Colorutils.chatcolor),
                  ),
                  child: Row(
                    children: [
                      Column(

                        children: [
                          Container(
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2,left: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(

                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color:Colorutils.chatcolor),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CachedNetworkImage(
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.fill,
                                        imageUrl: "${leaveList[i].profileImage}",
                                        errorWidget: (context, url, error) => Center(
                                          child: Text(
                                            "${leaveList[i].studentName?.substring(0, 2).toUpperCase()}",
                                            style: TextStyle(
                                                color: Color(0xFFB1BFFF),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: 200.w,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text(
                                          leaveList[i].studentName ?? '--',
                                          style: TextStyle(fontSize: 13),
                                        ),

                                      ],
                                    ),
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.red),
                                ),
                                child: Center(
                                    child: Text(
                                      "${leaveList[i].days ?? '--'}",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12.sp),
                                    )),
                              )
                            ],

                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 140.w, child: Text(leaveList[i].admissionNumber ?? '--')),
                              Text('Class: ${leaveList[i].classs ?? '-'} ${leaveList[i].batch ?? '-'}'),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 100.w,
                                child: Text(
                                  "From: ${leaveList[i].startDate}",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Text(
                                "To: ${leaveList[i].endDate}",
                                style: TextStyle(fontSize: 12),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 8.w,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.60,
                            height: 40.h,
                            child: Row(
                              children: [
                                // Flexible(flex: 1, child: Container()),
                                Text(
                                  "Status: ${leaveList[i].status ?? '--'}",
                                  style: TextStyle(
                                    color: _leaveStatus(leaveList[i].status?.toLowerCase() ?? ''),
                                    // color: statusleave == "Approved"
                                    //     ? Colors.green
                                    //     : Colors.red,
                                  ),
                                ),
                                Flexible(flex: 1, child: Container()),
                                Padding(
                                  padding: const EdgeInsets.only(left: 45),
                                  child: GestureDetector(
                                    onTap: () async {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Icon(
                                                          Icons.arrow_back_outlined)),
                                                  SizedBox(
                                                    width: 35.w,
                                                  ),
                                                  Text(
                                                    'Leave Approval',
                                                    style: TextStyle(fontSize: 22.sp),
                                                  ),
                                                ],
                                              ),
                                              content: Container(
                                                height: attchIconsize(type: leaveList[i].documentPath.toString().split(".").last),
                                                // width: 300.w,
                                                child: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      Text(leaveList[i].studentName ?? '--',
                                                          style: TextStyle(
                                                              fontSize: 18.sp)),
                                                      SizedBox(
                                                        height: 8.h,
                                                      ),
                                                      Text(
                                                          'Class: ${leaveList[i].classs ?? '-'} ${leaveList[i].batch ?? '-'}',
                                                          style:
                                                          TextStyle(fontSize: 14)),
                                                      SizedBox(
                                                        height: 8.h,
                                                      ),
                                                      Text('Reason : ${leaveList[i].reason ?? '--'}',
                                                          style:
                                                          TextStyle(fontSize: 14)),
                                                      SizedBox(
                                                        height: 8.h,
                                                      ),
                                                      Text(
                                                          "Applied On: ${leaveList[i].applyDate.toString().split('T')[0].split('-').last}-${leaveList[i].applyDate.toString().split('T')[0].split('-')[1]}-${leaveList[i].applyDate.toString().split('T')[0].split('-').first}",
                                                          style:
                                                          TextStyle(fontSize: 14)),
                                                      SizedBox(
                                                        height: 8.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            // "From: ${fromdate!.split('T')[0]}",
                                                            "From: ${leaveList[i].startDate.toString().split('T')[0].split('-').last}-${leaveList[i].startDate.toString().split('T')[0].split('-')[1]}-${leaveList[i].startDate.toString().split('T')[0].split('-').first}",
                                                            style:
                                                            TextStyle(fontSize: 14),
                                                          ),
                                                          SizedBox(
                                                            width: 40.w,
                                                          ),
                                                          Text(
                                                            "To: ${leaveList[i].endDate.toString().split('T')[0].split('-').last}-${leaveList[i].endDate.toString().split('T')[0].split('-')[1]}-${leaveList[i].endDate.toString().split('T')[0].split('-').first}",
                                                            style:
                                                            TextStyle(fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      (leaveList[i].documentPath != null)
                                                          ? Row(
                                                        children: [
                                                          Text('Document :',
                                                              style: TextStyle(
                                                                  fontSize: 14)),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              try {
                                                                await launchUrl(Uri.parse("${ApiConstants.baseUrl}${leaveList[i].documentPath}"));
                                                              } catch(e) {}
                                                            },
                                                            child: attchIcon(
                                                                type: leaveList[i].documentPath.toString().split(".").last,
                                                                document: leaveList[i].documentPath.toString().toString()),
                                                          ),
                                                        ],
                                                      )
                                                          : Container(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                      );
                                    },
                                    child: Container(
                                        height: 40.h,
                                        width: 90.w,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(
                                              'Details',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ))),
                                  ),
                                ),
                                // Flexible(flex: 1, child: Container()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
        },
        ),
        // Container(
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     itemCount: 10,
        //     itemBuilder:
        //   (BuildContext context, int index) {
        // return _allleave(
        //   name: "newResult[index]['studentName']",
        //   fromdate: "30-08-1998",
        //   todate: "30-08-1998",
        //   totaldays: 7,
        //   classes: "3",
        //   batches:"B",
        //   leavereason:"gwdywgdywdgqwud sbghuqwoidhqweiud ",
        //   admissionNo: "30267",
        //   applieddate: "5-09-9987",
        //   academicyear: "2023",
        //   statusleave:"applied",
        //   i: index,
        //   leaveId: "1233",
        //   studimage:"mjsj",
        //   document: "sndjiksw",
        //   mypendings:true
        // );
        //     },
        //   ),
        // )
      ],
    );
  }

  Color _leaveStatus(String status) {
    switch (status) {
      case "approved":
        return Colors.green;
      case "rejected":
        return Colors.red;
      case "pending":
        return Colors.yellow.shade800;
      default:
        return Colors.grey;
    }
  }

  double attchIconsize({String? type, String? document}) {
    if (type == 'jpg' || type == 'jpeg' || type == 'png') {
      return 500.h;
    } else if (type == 'pdf') {
      return 400.h;
    } else {
      return 400.h;
    }
  }

  Widget attchIcon({String? type, String? document}) {
    if (type == 'jpg' || type == 'jpeg' || type == 'png') {
      return Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("${ApiConstants.baseUrl}$document")),
            borderRadius: BorderRadius.circular(10)),
      );
    } else if (type == 'pdf') {
      return const Icon(Icons.picture_as_pdf, color: Colors.red,);
    } else {
      return Icon(Icons.attach_file, color: Colors.lightBlue.shade100,);
    }
  }
}
