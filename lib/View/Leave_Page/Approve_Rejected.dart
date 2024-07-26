import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacherapp/Utils/Colors.dart';

class ApproveRejected extends StatefulWidget {
  const ApproveRejected({super.key});

  @override
  State<ApproveRejected> createState() => _ApproveRejectedState();
}

class _ApproveRejectedState extends State<ApproveRejected> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 6.w, right: 6.w),
          child: TextFormField(
            onChanged: (value) {},
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
        for (int i = 0; i < 10; i++)
          _allleave(
              name: "newResult[index]['studentName']",
              fromdate: "30-08-1998",
              todate: "30-08-1998",
              totaldays: 7,
              classes: "3",
              batches: "B",
              leavereason: "gwdywgdywdgqwud sbghuqwoidhqweiud ",
              admissionNo: "30267",
              applieddate: "5-09-9987",
              academicyear: "2023",
              statusleave: "applied",
              i: i,
              leaveId: "1233",
              studimage: "mjsj",
              document: "sndjiksw",
              mypendings: true)
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

  Widget _allleave(
      {String? studimage,
        int? i,
        String? leaveId,
        String? document,
        bool? mypendings,
        String? academicyear,
        String? admissionNo,
        String? name,
        String? fromdate,
        String? todate,
        var totaldays,
        String? classes,
        String? batches,
        String? leavereason,
        String? statusleave,
        String? applieddate}) =>
      Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          // Divider(color: Colors.black26,height: 2.h,),
          GestureDetector(

            child: Container(
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
                                    imageUrl: "${studimage}",
                                    placeholder: (context, url) => Center(
                                      child: Text(
                                        'brineshben'
                                        // '${name.split(' ')[1].toString()[0]}'
                                        ,
                                        style: TextStyle(
                                            color: Color(0xFFB1BFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Center(
                                      child: Text(
                                        'gg'
                                        // '${name.split(' ')[1].toString()[0]}'
                                        ,
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
                                      'NASRUDHEEN MOHAMMED ALI ',
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
                                  '$totaldays',
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
                              width: 140.w, child: Text("ME27777")),
                          Text('Class: ${classes! + " " + batches!}'),
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
                              "From: ${fromdate!.split('T')[0]}",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Text(
                            "To: ${todate!.split('T')[0]}",
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
                              "Status: ${statusleave!}",
                              style: TextStyle(
                                color: _leaveStatus(statusleave),
                                // color: statusleave == "Approved"
                                //     ? Colors.green
                                //     : Colors.red,
                              ),
                            ),
                            Flexible(flex: 1, child: Container()),
                            (mypendings == true)
                                ? Container(
                                height: 30.h,
                                width: 70.w,
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
                                    )))
                                : GestureDetector(
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
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                                child: Icon(Icons
                                                    .arrow_back_outlined)),
                                            SizedBox(
                                              width: 35.w,
                                            ),
                                            Text(
                                              'Leave Approval',
                                              style: TextStyle(
                                                  fontSize: 22.sp),
                                            ),
                                          ],
                                        ),
                                        content: Container(
                                          height: 80,
                                          // width: 300.w,
                                          child: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text(name!,
                                                    style: TextStyle(
                                                        fontSize: 18.sp)),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                    'Class: ${classes + " " + batches}',
                                                    style: TextStyle(
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                    'Reason : ${leavereason!}',
                                                    style: TextStyle(
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                    "Applied On: ${applieddate!.split('T')[0].split('-').last}-${applieddate.split('T')[0].split('-')[1]}-${applieddate.split('T')[0].split('-').first}",
                                                    style: TextStyle(
                                                        fontSize: 14)),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      // "From: ${fromdate!.split('T')[0]}",
                                                      "From: ${fromdate.split('T')[0].split('-').last}-${fromdate.split('T')[0].split('-')[1]}-${fromdate.split('T')[0].split('-').first}",
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      width: 40.w,
                                                    ),
                                                    Text(
                                                      "To: ${todate.split('T')[0].split('-').last}-${todate.split('T')[0].split('-')[1]}-${todate.split('T')[0].split('-').first}",
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                (document != null)
                                                    ? Row(
                                                  children: [
                                                    Text(
                                                        'Document :',
                                                        style: TextStyle(
                                                            fontSize:
                                                            14)),
                                                    GestureDetector(
                                                      onTap: () {},
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
                            // Flexible(flex: 1, child: Container()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Color _leaveStatus(String status) {
    switch (status) {
      case "Approved":
        return Colors.green;
      case "Rejected":
        return Colors.red;
      case "pending":
        return Colors.yellow.shade800;
      default:
        return Colors.grey;
    }
  }
}
