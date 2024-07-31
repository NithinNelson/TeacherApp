import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../Utils/Colors.dart';
import '../../Utils/constants.dart';
import '../../Utils/font_util.dart';
import '../CWidgets/AppBarBackground.dart';
import '../Home_Page/Home_Widgets/user_details.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _ObsResultState();
}

class _ObsResultState extends State<MorePage> {
  get questionData => null;

  get isChecked => null;
  var fromDate = 'DD-MM-YYYY';
  var toDate = 'DD-MM-YYYY';
  DateFormat _examformatter = DateFormat('dd-MM-yyyy');
  DateFormat _examFFormatter1 = DateFormat('dd-MM-yyyy');
  DateTime? pickedFrom;
  DateTime? pickedTo;
  String? _fileName;
  String? _filePath;

  Future<void> _selectFromDate(BuildContext context) async
  {
    pickedFrom = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      // lastDate: new DateTime(2025),
      lastDate: DateTime(DateTime
          .now()
          .year + 1),
    );
    fromDate = _examformatter.format(pickedFrom!);
    print(fromDate);
    setState(() {
      toDate = 'DD-MM-YYYY';
    });
  }

  Future<Null> _selectToDate(BuildContext context) async
  {
    pickedTo = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      // lastDate: new DateTime(2025),
      lastDate: DateTime(DateTime
          .now()
          .year + 1),
    );
    toDate = _examFFormatter1.format(pickedTo!);
    print(fromDate);
    setState(() {
      fromDate = 'DD-MM-YYYY';
    });
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      // If the user picked a file
      setState(() {
        _fileName = result.files.single.name;
        _filePath = result.files.single.path;
      });
    } else {
      // User canceled the picker
      setState(() {
        _fileName = null;
        _filePath = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(

      value: systemUiOverlayStyleLight,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.98,
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                        shoBackgroundColor: false, isWelcome: true),
                  ),
                ),
                Container(
                  margin:
                  EdgeInsets.only(left: 10.w, top: 120.h, right: 10.w,),
                  width: 500.w,
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
                  child: ListView(
                      padding: EdgeInsets.only(top: 10),
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text('Leave Apply', style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600),),
                                  SizedBox(
                                    width: 120.w,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     SizedBox(
                                  //       width: 20.w,
                                  //       height: 20.h,
                                  //       child: Image.asset(
                                  //           "assets/images/studentCalender.png"),
                                  //     ),
                                  // SizedBox(
                                  //   width: 5.w,
                                  // ),
                                  // Text(
                                  //   widget.selectedDate.toString(),
                                  //   style: TextStyle(fontSize: 12.sp),
                                  // ),
                                  // SizedBox(
                                  //   width: 5.w,
                                  // ),
                                  // widget.timeString == null ? Text(" ") : Text(
                                  //     widget.timeString.toString().split("-")[0],
                                  //     style: TextStyle(fontSize: 12.sp))
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 20, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width: 120.w,
                                        height: 120.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Color(0xFFD6E4FA)),

                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: CachedNetworkImage(
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.fill,
                                            imageUrl: "ksjk",
                                            placeholder: (context, url) =>
                                                Center(
                                                  child: Text(
                                                    'ben',
                                                    style: TextStyle(
                                                        color: Color(0xFFB1BFFF),
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                            errorWidget: (context, url, error) =>
                                                Center(
                                                  child: Text(
                                                    'bbb',
                                                    style: TextStyle(
                                                        color: Color(0xFFB1BFFF),
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Center(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Fathima Nourin Noufal  Azad',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),

                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text('Admission No'),

                                        ),
                                        Container(
                                          width: 10,
                                          child: Text(':'),

                                        ),
                                        Container(
                                          width: 100,
                                          child: Text('ME2016'),

                                        )

                                      ],
                                    ),),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text('Class'),

                                        ),
                                        Container(
                                          width: 10,
                                          child: Text(':'),

                                        ),
                                        Container(
                                          width: 100,
                                          child: Text('3B'),

                                        )

                                      ],
                                    ),),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('FROM : ${fromDate}', style: TextStyle(
                                              fontSize: 12.sp, fontWeight: FontWeight.w600)),
                                          IconButton(icon: Icon(
                                            Icons.calendar_month, color: Colors.blue[900], size: 20,),
                                            onPressed: () {
                                              _selectFromDate(context);
                                            },),
                                          // SizedBox(
                                          //   width: 5.w,
                                          // ),
                                          Text('TO : ${toDate}', style: TextStyle(
                                              fontSize: 12.sp, fontWeight: FontWeight.w600)),
                                          IconButton(icon: Icon(
                                            Icons.calendar_month, color: Colors.blue[900], size: 20,),
                                            onPressed: () {
                                              _selectToDate(context);
                                            },)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text('Reason', style: TextStyle(
                                        fontSize: 15.sp, fontWeight: FontWeight.w600)),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w,
                                        top: 5.h,
                                        right: 5.w,
                                        bottom: 5),
                                    child: TextFormField(
                                      maxLength: 1000,
                                      validator: (val) =>
                                      val!.isEmpty
                                          ? '  *Fill the Field to Submit'
                                          : null,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                              color: Colors.black26),
                                          contentPadding:
                                          EdgeInsets.symmetric(
                                              vertical: 5.0,
                                              horizontal: 10.0),
                                          hintText: " What went well   ",
                                          counterText: "00/1000",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
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
                                          fillColor: Colorutils.chatcolor
                                              .withOpacity(0.3),
                                          filled: true),
                                      maxLines: 5,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 0),
                                        child: OutlinedButton.icon(
                                          onPressed: () {
                                            _pickFile();
                                          },
                                          icon: Icon(Icons.attach_file_outlined, size: 15,color: Colorutils.userdetailcolor ,),
                                          label: Text('Attach File', style: TextStyle(fontSize: 10,color:Colorutils.userdetailcolor ),),
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(width: 1.0, color: Colorutils.chatcolor), // Customize the border color and width
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0), // Customize the border radius if needed
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        width: 5.w,
                                      ),

                                      Row(
                                        children: [
                                          SizedBox(height: 20),
                                          if (_fileName != null) ...[
                                            Container(
                                              width: 150,
                                              child: Text(
                                                '$_fileName',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),

                                            // Text('File Path: $_filePath'),
                                          ] else
                                            Text('No File Selected'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      GestureDetector(
                                        onTap:(){},
                                        child: Container(
                                            height: 40.h,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.all(Radius.circular(50)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Apply',
                                                style:
                                                TextStyle(color: Colors.white, fontSize: 12),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                            height: 40.h,
                                            width: 80.w,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(Radius.circular(50)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Cancel',
                                                style:
                                                TextStyle(color: Colors.white, fontSize: 12),
                                              ),
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: 250.h,
                            // ),
                          ],
                        )

                      ]),
                ),
              ],
            ),
          )),
    );
  }

  rubrics({required rubricslessonob}) {}
}
