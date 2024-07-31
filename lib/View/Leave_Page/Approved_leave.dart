import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacherapp/Utils/Colors.dart';

import '../../Utils/api_constants.dart';

class ApprovedLeave extends StatefulWidget {
  const ApprovedLeave({super.key});

  @override
  State<ApprovedLeave> createState() => _ApprovedLeaveState();
}

class _ApprovedLeaveState extends State<ApprovedLeave> {
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
                          padding: const EdgeInsets.only(top: 2,left: 4,bottom: 2),
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
                              width: 230.w,
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
                            width: 150.w,
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
                                ? GestureDetector(
                              onTap: ()
                              async {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child:
                                              Text(
                                                'Leave Approval Details',
                                                style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        content: Container(
                                          height: attchIconsize(type: document.toString().split(".").last),
                                          // width: 300.w,
                                          child: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Row(
                                                  children: [
                                                    Container(width: 80,child: Text('NAME',style: TextStyle(fontWeight: FontWeight.bold),),),
                                                    Container(width: 10,child: Text(':',style: TextStyle(fontWeight: FontWeight.bold),),),

                                                    Container(
                                                      width: 140.w,
                                                      child: SingleChildScrollView(
                                                        child: Text("brineshben",
                                                            style: TextStyle(
                                                                fontSize: 15.sp)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(width: 80,child: Text('CLASS',style: TextStyle(fontWeight: FontWeight.bold),),),
                                                    Container(width: 10,child: Text(':',style: TextStyle(fontWeight: FontWeight.bold),),),

                                                    Text("3 B",
                                                        style: TextStyle(
                                                            fontSize: 15.sp)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(width: 80,child: Text('REASON',style: TextStyle(fontWeight: FontWeight.bold),),),
                                                      ],
                                                    ),
                                                    Container(width: 10,child: Text(':',style: TextStyle(fontWeight: FontWeight.bold),),),

                                                    Container(
                                                      width: 140,
                                                      child: Text("AGHSGHUIKAS ASOIKDASJFKSWD CFFFSWDBDWEUO  JHASDHKJS DHIASDGAQS ASJIKDAS DDHIASDH ASDIKASH   FJHUK CSDAFUOI9UJCD"
                                                          ,
                                                          style: TextStyle(
                                                              fontSize: 12.sp)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(width: 80,child: Text('APPLIED ON',style: TextStyle(fontWeight: FontWeight.bold),),),
                                                    Container(width: 10,child: Text(':',style: TextStyle(fontWeight: FontWeight.bold),),),

                                                    Text("30-08-1999",
                                                        style: TextStyle(
                                                            fontSize: 15.sp)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(width: 80,child: Text('FROM DATE',style: TextStyle(fontWeight: FontWeight.bold),),),
                                                    Container(width: 10,child: Text(':',style: TextStyle(fontWeight: FontWeight.bold),),),

                                                    Text("30-08-1999",
                                                        style: TextStyle(
                                                            fontSize: 15.sp)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(width: 80,child: Text('TO DATE',style: TextStyle(fontWeight: FontWeight.bold),),),
                                                    Container(width: 10,child: Text(':',style: TextStyle(fontWeight: FontWeight.bold),),),

                                                    Text("30-08-1999",
                                                        style: TextStyle(
                                                            fontSize: 15.sp)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                (document != null)
                                                    ?
                                                Row(
                                                  children: [
                                                    Container(width: 80,child: Text('DOCUMENT',style: TextStyle(fontWeight: FontWeight.bold),),),
                                                    Container(width: 10,child: Text(':',style: TextStyle(fontWeight: FontWeight.bold),),),
                                                    Container(width: 10,child: GestureDetector(
                                                      onTap: () async {


                                                      },
                                                      child: attchIcon(
                                                          type: document
                                                              .toString()
                                                              .split(".")
                                                              .last,
                                                          document: document
                                                              .toString()),
                                                    ),
                                                    ),
                                                  ],
                                                )
                                                    :Container(),
                                                SizedBox(
                                                  height: 50.w,
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.pop(context);
                                                  },
                                                  child: Center(
                                                    child: Container(
                                                      height: 40.h,
                                                      width: 80.w,
                                                      child: Center(child: Text('OK')


                                                      ),
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),

                                                    ),
                                                  ),
                                                )
















                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                );
                              },
                              child: Container(
                                  height: 35.h,
                                  width: 80.w,
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
                            )
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
  Widget attchIcon({String? type, String? document}) {
    if (type == 'jpg' || type == 'jpeg' || type == 'png') {
      return Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("ben")),
            borderRadius: BorderRadius.circular(10)),
      );
    } else if (type == 'pdf') {
      return const Icon(Icons.picture_as_pdf, color: Colors.red,);
    } else {
      return Icon(Icons.attach_file, color: Colors.lightBlue.shade100,);
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
}
