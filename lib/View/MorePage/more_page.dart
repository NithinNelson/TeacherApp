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
                  shoBackgroundColor: false,
                  isWelcome: true,
                  bellicon: true,
                  notificationcount: true,),
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
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "The feature is not in use.",
                      style: (TextStyle(
                      color: Colors.red,
                    )),),
                  ),
          )
      ),
      ],
    ),)
    )
    ,
    );
  }

  rubrics({required rubricslessonob}) {}
}
