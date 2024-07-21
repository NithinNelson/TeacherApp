
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../Utils/Colors.dart';
import '../../Utils/font_util.dart';
import 'Lesson_obs2.dart';

class lessonobs extends StatefulWidget {

  const lessonobs({super.key, });

  @override
  State<lessonobs> createState() => _lessonobsState();
}

class  _lessonobsState extends State<lessonobs> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.93,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 180.w,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.w),
                            bottomRight: Radius.circular(12.w)),
                        color: Colorutils.userdetailcolor,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 0,
                    top: 40,
                    child: SvgPicture.asset(
                      'assets/images/pencil2.svg',
                      width: 100.w,
                      color: Colorutils.Whitecolor.withOpacity(0.1),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 240,
                    top: 25,
                    child: Transform.rotate(
                      angle: 0.5,
                      child: SvgPicture.asset(
                        'assets/images/stars1.svg',
                        width: 20.w,
                        color: Colorutils.Whitecolor.withOpacity(0.5),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    top: 65,
                    child: SvgPicture.asset(
                      'assets/images/graduation-cap-icon.svg',
                      width: 30.w,
                      color: Colorutils.Whitecolor.withOpacity(0.07),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 140,
                    top: 10,
                    child: SvgPicture.asset(
                      'assets/images/read-book-icon.svg',
                      width: 30.w,
                      color: Colorutils.Whitecolor.withOpacity(0.07),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 115,
                    top: 65,
                    child: SvgPicture.asset(
                      'assets/images/stars1.svg',
                      width: 20.w,
                      color: Colorutils.Whitecolor.withOpacity(0.5),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 10,
                    child: SvgPicture.asset(
                      'assets/images/stars1.svg',
                      width: 20.w,
                      color: Colorutils.Whitecolor.withOpacity(0.5),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 140,
                    child: SvgPicture.asset(
                      'assets/images/stars1.svg',
                      color: Colorutils.Whitecolor.withOpacity(0.9),
                      width: 25.w,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: -90,
                    child: SvgPicture.asset(
                      'assets/images/pencil3.svg',
                      color: Colorutils.Whitecolor.withOpacity(0.2),
                      height: 180.w,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Padding(
                        padding: const EdgeInsets.only( left: 7, right: 10, bottom: 3),
                        child: Container(
                          height: 80.w,
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 12.w),
                              Container(
                                height: 45.w,
                                width: 45.w,
                                padding: const EdgeInsets.symmetric(horizontal: 9).w,

                                child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello!',
                                      style: TeacherAppFonts.interW400_14sp_textWhiteOp60,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Fathima Nourin',
                                            style: TeacherAppFonts.interW600_18sp_textWhite,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5, top: 5).w,
                                    child: SvgPicture.asset(
                                      'assets/images/bell 1.svg',
                                      width: 30.w,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 18.w,
                                      height: 18.w,
                                      padding: const EdgeInsets.all(2).w,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colorutils.Whitecolor,
                                      ),
                                      child: FittedBox(
                                        child: Text(
                                          "4",
                                          style: TeacherAppFonts.interW500_11sp_userdetailcolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 12.w),
                              CircleAvatar(
                                radius: 25.r,
                                backgroundColor: Colorutils.Whitecolor,
                                child: CircleAvatar(
                                  radius: 24.r,
                                  backgroundImage:
                                  AssetImage('assets/images/profile image.png'),
                                ),
                              ),
                              SizedBox(width: 12.w),
                            ],
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, top: 85.h, right: 20.w),
                    // width: 550.w,
                    height: 545.h,
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
      Padding(
        padding: EdgeInsets.only(
            left: 20.w, right: 20.w, top: 30.h),
        child: DropdownButtonFormField(
          validator: (dynamic value) =>
          value == null ? 'Field Required' : null,

          isExpanded: true,
          onChanged: (dynamic newVal) {
            setState(() {});
          },
          decoration: InputDecoration(

              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5)),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 20.0),
              hintText: " Teacher",
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(230, 236, 254, 8),
                    width: 1.0),
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(230, 236, 254, 8),
                    width: 1.0),
                borderRadius:
                BorderRadius.all(Radius.circular(10.0)),
              ),
              fillColor: Color.fromRGBO(230, 236, 254, 8),
              filled: true), items: [],

        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: 20.w, right: 20.w, top: 20.h),
        child: DropdownButtonFormField(
          validator: (dynamic value) =>
          value == null ? 'Field Required' : null,

          isExpanded: true,
          onChanged: (dynamic newVal) {
            setState(() {});
          },
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5)),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 20.0),
              hintText: " Class",
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(230, 236, 254, 8),
                    width: 1.0),
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(230, 236, 254, 8),
                    width: 1.0),
                borderRadius:
                BorderRadius.all(Radius.circular(10.0)),
              ),
              fillColor: Color.fromRGBO(230, 236, 254, 8),
              filled: true), items: [],

        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: 20.w, right: 20.w, top: 20.h),
        child: DropdownButtonFormField(
          validator: (dynamic value) =>
          value == null ? 'Field Required' : null,

          isExpanded: true,
          onChanged: (dynamic newVal) {
            setState(() {});
          },
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5)),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 20.0),
              hintText: " Subject",
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(230, 236, 254, 8),
                    width: 1.0),
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(230, 236, 254, 8),
                    width: 1.0),
                borderRadius:
                BorderRadius.all(Radius.circular(10.0)),
              ),
              fillColor: Color.fromRGBO(230, 236, 254, 8),
              filled: true), items: [],

        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: 20.w, right: 20.w, top: 20.h),
        child: TextFormField(
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5)),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 20.0),
              hintText: " Topics",
              counterText: "0/100",
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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Lessonobs2()));
          },
          child: Padding(
            padding:
            const EdgeInsets.only(left: 75, right: 75),
            child: Container(
                height: 40.h,
                width: 220.w,
                decoration: BoxDecoration(
                  color: Colorutils.userdetailcolor,
                  borderRadius:
                  BorderRadius.all(Radius.circular(12)),
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
                ],
              ),
            ),
          )),
    );
  }
}
