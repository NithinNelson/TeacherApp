import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:badges/badges.dart' as badges;
import '../../Utils/Colors.dart';
import '../../Utils/font_util.dart';

class myclasses extends StatefulWidget {
  const myclasses({super.key});

  @override
  State<myclasses> createState() => _myclassesState();
}

class _myclassesState extends State<myclasses> {
  get isSpinner => null;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.95,
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
                        padding: const EdgeInsets.only(
                            left: 7, right: 10, bottom: 3),
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
                              GestureDetector(
                                onTap: (){Navigator.pop(context);},
                                child: Container(
                                  height: 45.w,
                                  width: 45.w,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 9).w,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello!',
                                      style: TeacherAppFonts
                                          .interW400_14sp_textWhiteOp60,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Fathima Nourin',
                                            style: TeacherAppFonts
                                                .interW600_18sp_textWhite,
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
                                    padding:
                                        const EdgeInsets.only(right: 5, top: 5)
                                            .w,
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
                                          style: TeacherAppFonts
                                              .interW500_11sp_userdetailcolor,
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
                                  backgroundImage: AssetImage(
                                      'assets/images/profile image.png'),
                                ),
                              ),
                              SizedBox(width: 12.w),
                            ],
                          ),
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: 10.w,
                        top: 85.h,
                        right: 10.w,
                      ),
                      // width: 550.w,
                      height: 700.h,
                      decoration: BoxDecoration(
                        color: Colorutils.Whitecolor,
                        // Container color
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r)),
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
                              padding: const EdgeInsets.only(left: 20, top: 10,right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "10 A Biology",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                            width: 20.w,
                                            height: 20.h,
                                            child: SvgPicture.asset(
                                                'assets/images/studentCalender.svg',color: Colorutils.chatcolor,)),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        SizedBox(
                                          child: Text('30-08-1997'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15.w, right: 15.w),
                              child: TextFormField(
                                onChanged: (value) {},
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter the Topic' : null,
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.grey),
                                    hintText: "Search Here",
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colorutils.userdetailcolor,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2.0),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colorutils.chatcolor,
                                          width: 1.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colorutils.chatcolor,
                                          width: 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    fillColor: Colorutils.chatcolor,
                                    filled: true),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5,top: 5,),
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 50.w),
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return SwipeTo(
                                    rightSwipeWidget: Container(
                                      padding: EdgeInsets.all(30),
                                      color: Colors.green,
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                    ),

                                    // onRightSwipe: () {
                                    //   if(_searchController.text.toString().isEmpty){
                                    //     if(afterAttendanceTaken == null){
                                    //       if(ourStudentList[index].containsKey("mother_details") && ourStudentList[index]["mother_details"].isNotEmpty && ourStudentList[index]["mother_details"].containsKey("mother_name") && ourStudentList[index]["mother_details"].containsKey("mother_mobile")){
                                    //         Dialogbox(
                                    //           context,
                                    //           _searchController.text.isNotEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               newResult[index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : afterAttendanceTaken == null ||
                                    //               afterAttendanceTaken.isEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               ourStudentList[index]
                                    //               ["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : toBeginningOfSentenceCase(
                                    //               afterAttendanceTaken[
                                    //               index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString(),
                                    //           afterAttendanceTaken != null
                                    //               ? (_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["feeDetails"]["image"].replaceAll('"', '') : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               : ApiConstants.IMAGE_BASE_URL +
                                    //               afterAttendanceTaken[index]
                                    //               ["feeDetails"]["image"].replaceAll('"', ''))
                                    //               :_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["image"].replaceAll('"', '') : ourStudentList[index]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               :ApiConstants.IMAGE_BASE_URL +
                                    //               ourStudentList[index]
                                    //               ["image"].replaceAll('"', ''),
                                    //           afterAttendanceTaken == null
                                    //               ? _searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_amount"] :  ourStudentList[index]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : ourStudentList[index]
                                    //           ["fee_amount"]
                                    //               : afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_amount"] :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_amount"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_arrear"] : ourStudentList[index]["fee_arrear"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_arrear"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_arrear"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_name"] : ourStudentList[index]["parent_name"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_name"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_phone"] : ourStudentList[index]
                                    //           ["parent_phone"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_phone"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_phone"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["admission_number"] : ourStudentList[index]
                                    //           ["admission_number"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["admission_number"] :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["admission_number"],
                                    //           studentFeebackList,
                                    //           widget.name.toString(),
                                    //           widget.LoginedUserEmployeeCode.toString(),
                                    //           widget.images.toString(),
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["mother_details"]["mother_name"].toString() : ourStudentList[index]["mother_details"]
                                    //           ["mother_name"]
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["mother_details"]["mother_name"].toString() : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["mother_details"]["mother_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["mother_details"]["mother_mobile"].toString() : ourStudentList[index]["mother_details"]
                                    //           ["mother_mobile"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["mother_details"]["mother_mobile"].toString() :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["mother_details"]
                                    //           ["mother_mobile"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index].containsKey("mother_details") : ourStudentList[index].containsKey("mother_details")
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"].containsKey("mother_details") :  afterAttendanceTaken[index]
                                    //           ["feeDetails"].containsKey("mother_details"),
                                    //         );
                                    //       }else{
                                    //         DialogboxWithoutMotherDetails(
                                    //           context,
                                    //           _searchController.text.isNotEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               newResult[index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : afterAttendanceTaken == null ||
                                    //               afterAttendanceTaken.isEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               ourStudentList[index]
                                    //               ["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : toBeginningOfSentenceCase(
                                    //               afterAttendanceTaken[
                                    //               index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString(),
                                    //           afterAttendanceTaken != null
                                    //               ? (_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["feeDetails"]["image"].replaceAll('"', '') : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               : ApiConstants.IMAGE_BASE_URL +
                                    //               afterAttendanceTaken[index]
                                    //               ["feeDetails"]["image"].replaceAll('"', ''))
                                    //               :_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["image"].replaceAll('"', '') : ourStudentList[index]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               :ApiConstants.IMAGE_BASE_URL +
                                    //               ourStudentList[index]
                                    //               ["image"].replaceAll('"', ''),
                                    //           afterAttendanceTaken == null
                                    //               ? _searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_amount"] :  ourStudentList[index]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : ourStudentList[index]
                                    //           ["fee_amount"]
                                    //               : afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_amount"] :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_amount"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_arrear"] : ourStudentList[index]["fee_arrear"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_arrear"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_arrear"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_name"] : ourStudentList[index]["parent_name"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_name"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_phone"] : ourStudentList[index]
                                    //           ["parent_phone"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_phone"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_phone"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["admission_number"] : ourStudentList[index]
                                    //           ["admission_number"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["admission_number"] :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["admission_number"],
                                    //           studentFeebackList,
                                    //           widget.name.toString(),
                                    //           widget.LoginedUserEmployeeCode.toString(),
                                    //           widget.images.toString(),
                                    //         );
                                    //       }
                                    //     } else {
                                    //       if(afterAttendanceTaken[index]
                                    //       ["feeDetails"].containsKey("mother_details") && afterAttendanceTaken[index]
                                    //       ["feeDetails"]
                                    //       ["mother_details"].isNotEmpty && afterAttendanceTaken[index]
                                    //       ["feeDetails"]
                                    //       ["mother_details"]["mother_name"].isNotEmpty && afterAttendanceTaken[index]
                                    //       ["feeDetails"]
                                    //       ["mother_details"]["mother_mobile"].isNotEmpty){
                                    //         Dialogbox(
                                    //           context,
                                    //           _searchController.text.isNotEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               newResult[index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : afterAttendanceTaken == null ||
                                    //               afterAttendanceTaken.isEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               ourStudentList[index]
                                    //               ["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : toBeginningOfSentenceCase(
                                    //               afterAttendanceTaken[
                                    //               index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString(),
                                    //           afterAttendanceTaken != null
                                    //               ? (_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["feeDetails"]["image"].replaceAll('"', '') : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               : ApiConstants.IMAGE_BASE_URL +
                                    //               afterAttendanceTaken[index]
                                    //               ["feeDetails"]["image"].replaceAll('"', ''))
                                    //               :_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["image"].replaceAll('"', '') : ourStudentList[index]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               :ApiConstants.IMAGE_BASE_URL +
                                    //               ourStudentList[index]
                                    //               ["image"].replaceAll('"', ''),
                                    //           afterAttendanceTaken == null
                                    //               ? _searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_amount"] :  ourStudentList[index]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : ourStudentList[index]
                                    //           ["fee_amount"]
                                    //               : afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_amount"] :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_amount"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_arrear"] : ourStudentList[index]["fee_arrear"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_arrear"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_arrear"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_name"] : ourStudentList[index]["parent_name"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_name"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_phone"] : ourStudentList[index]
                                    //           ["parent_phone"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_phone"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_phone"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["admission_number"] : ourStudentList[index]
                                    //           ["admission_number"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["admission_number"] :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["admission_number"],
                                    //           studentFeebackList,
                                    //           widget.name.toString(),
                                    //           widget.LoginedUserEmployeeCode.toString(),
                                    //           widget.images.toString(),
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["mother_details"]["mother_name"] : ourStudentList[index]["mother_details"]
                                    //           ["mother_name"]
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["mother_details"]["mother_name"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["mother_details"]["mother_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["mother_details"]["mother_mobile"] : ourStudentList[index]["mother_details"]
                                    //           ["mother_mobile"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["mother_details"]["mother_mobile"] :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["mother_details"]
                                    //           ["mother_mobile"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index].containsKey("mother_details") : ourStudentList[index].containsKey("mother_details")
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"].containsKey("mother_details") :  afterAttendanceTaken[index]
                                    //           ["feeDetails"].containsKey("mother_details"),
                                    //         );
                                    //       }else{
                                    //         DialogboxWithoutMotherDetails(
                                    //           context,
                                    //           _searchController.text.isNotEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               newResult[index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : afterAttendanceTaken == null ||
                                    //               afterAttendanceTaken.isEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               ourStudentList[index]
                                    //               ["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : toBeginningOfSentenceCase(
                                    //               afterAttendanceTaken[
                                    //               index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString(),
                                    //           afterAttendanceTaken != null
                                    //               ? (_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["feeDetails"]["image"].replaceAll('"', '') : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               : ApiConstants.IMAGE_BASE_URL +
                                    //               afterAttendanceTaken[index]
                                    //               ["feeDetails"]["image"].replaceAll('"', ''))
                                    //               :_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["image"].replaceAll('"', '') : ourStudentList[index]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               :ApiConstants.IMAGE_BASE_URL +
                                    //               ourStudentList[index]
                                    //               ["image"].replaceAll('"', ''),
                                    //           afterAttendanceTaken == null
                                    //               ? _searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_amount"] :  ourStudentList[index]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : ourStudentList[index]
                                    //           ["fee_amount"]
                                    //               : afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_amount"] :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_amount"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_arrear"] : ourStudentList[index]["fee_arrear"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_arrear"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_arrear"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_name"] : ourStudentList[index]["parent_name"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_name"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_phone"] : ourStudentList[index]
                                    //           ["parent_phone"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_phone"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_phone"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["admission_number"] : ourStudentList[index]
                                    //           ["admission_number"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["admission_number"] :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["admission_number"],
                                    //           studentFeebackList,
                                    //           widget.name.toString(),
                                    //           widget.LoginedUserEmployeeCode.toString(),
                                    //           widget.images.toString(),
                                    //         );
                                    //       }
                                    //     }
                                    //   }else{
                                    //     if(afterAttendanceTaken == null){
                                    //       if(newResult[index].containsKey("mother_details") && newResult[index]["mother_details"].isNotEmpty && newResult[index]["mother_details"].containsKey("mother_name") && newResult[index]["mother_details"].containsKey("mother_mobile")){
                                    //         Dialogbox(
                                    //           context,
                                    //           _searchController.text.isNotEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               newResult[index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : afterAttendanceTaken == null ||
                                    //               afterAttendanceTaken.isEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               ourStudentList[index]
                                    //               ["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : toBeginningOfSentenceCase(
                                    //               afterAttendanceTaken[
                                    //               index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString(),
                                    //           afterAttendanceTaken != null
                                    //               ? (_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["feeDetails"]["image"].replaceAll('"', '') : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               : ApiConstants.IMAGE_BASE_URL +
                                    //               afterAttendanceTaken[index]
                                    //               ["feeDetails"]["image"].replaceAll('"', ''))
                                    //               :_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["image"].replaceAll('"', '') : ourStudentList[index]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               :ApiConstants.IMAGE_BASE_URL +
                                    //               ourStudentList[index]
                                    //               ["image"].replaceAll('"', ''),
                                    //           afterAttendanceTaken == null
                                    //               ? _searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_amount"] :  ourStudentList[index]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : ourStudentList[index]
                                    //           ["fee_amount"]
                                    //               : afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_amount"] :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_amount"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_arrear"] : ourStudentList[index]["fee_arrear"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_arrear"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_arrear"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_name"] : ourStudentList[index]["parent_name"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_name"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_phone"] : ourStudentList[index]
                                    //           ["parent_phone"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_phone"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_phone"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["admission_number"] : ourStudentList[index]
                                    //           ["admission_number"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["admission_number"] :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["admission_number"],
                                    //           studentFeebackList,
                                    //           widget.name.toString(),
                                    //           widget.LoginedUserEmployeeCode.toString(),
                                    //           widget.images.toString(),
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["mother_details"]["mother_name"].toString() : ourStudentList[index]["mother_details"]
                                    //           ["mother_name"]
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["mother_details"]["mother_name"].toString() : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["mother_details"]["mother_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["mother_details"]["mother_mobile"].toString() : ourStudentList[index]["mother_details"]
                                    //           ["mother_mobile"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["mother_details"]["mother_mobile"].toString() :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["mother_details"]
                                    //           ["mother_mobile"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index].containsKey("mother_details") : ourStudentList[index].containsKey("mother_details")
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"].containsKey("mother_details") :  afterAttendanceTaken[index]
                                    //           ["feeDetails"].containsKey("mother_details"),
                                    //         );
                                    //       }else{
                                    //         DialogboxWithoutMotherDetails(
                                    //           context,
                                    //           _searchController.text.isNotEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               newResult[index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : afterAttendanceTaken == null ||
                                    //               afterAttendanceTaken.isEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               ourStudentList[index]
                                    //               ["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : toBeginningOfSentenceCase(
                                    //               afterAttendanceTaken[
                                    //               index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString(),
                                    //           afterAttendanceTaken != null
                                    //               ? (_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["feeDetails"]["image"].replaceAll('"', '') : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               : ApiConstants.IMAGE_BASE_URL +
                                    //               afterAttendanceTaken[index]
                                    //               ["feeDetails"]["image"].replaceAll('"', ''))
                                    //               :_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["image"].replaceAll('"', '') : ourStudentList[index]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               :ApiConstants.IMAGE_BASE_URL +
                                    //               ourStudentList[index]
                                    //               ["image"].replaceAll('"', ''),
                                    //           afterAttendanceTaken == null
                                    //               ? _searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_amount"].toString() :  ourStudentList[index]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : ourStudentList[index]
                                    //           ["fee_amount"]
                                    //               : afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_amount"].toString() :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_amount"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_arrear"]: ourStudentList[index]["fee_arrear"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_arrear"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_arrear"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_name"].toString() : ourStudentList[index]["parent_name"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_name"].toString() : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_phone"].toString() : ourStudentList[index]
                                    //           ["parent_phone"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_phone"].toString() : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_phone"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["admission_number"].toString() : ourStudentList[index]
                                    //           ["admission_number"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["admission_number"].toString() :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["admission_number"],
                                    //           studentFeebackList,
                                    //           widget.name.toString(),
                                    //           widget.LoginedUserEmployeeCode.toString(),
                                    //           widget.images.toString(),
                                    //         );
                                    //       }
                                    //     } else {
                                    //       if(newResult[index]
                                    //       ["feeDetails"].containsKey("mother_details") && newResult[index]
                                    //       ["feeDetails"]
                                    //       ["mother_details"].isNotEmpty && newResult[index]
                                    //       ["feeDetails"]
                                    //       ["mother_details"].containsKey("mother_name") && newResult[index]
                                    //       ["feeDetails"]
                                    //       ["mother_details"].containsKey("mother_mobile")){
                                    //         Dialogbox(
                                    //           context,
                                    //           _searchController.text.isNotEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               newResult[index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : afterAttendanceTaken == null ||
                                    //               afterAttendanceTaken.isEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               ourStudentList[index]
                                    //               ["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : toBeginningOfSentenceCase(
                                    //               afterAttendanceTaken[
                                    //               index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString(),
                                    //           afterAttendanceTaken != null
                                    //               ? (_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["feeDetails"]["image"].replaceAll('"', '') : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               : ApiConstants.IMAGE_BASE_URL +
                                    //               afterAttendanceTaken[index]
                                    //               ["feeDetails"]["image"].replaceAll('"', ''))
                                    //               :_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["image"].replaceAll('"', '') : ourStudentList[index]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               :ApiConstants.IMAGE_BASE_URL +
                                    //               ourStudentList[index]
                                    //               ["image"].replaceAll('"', ''),
                                    //           afterAttendanceTaken == null
                                    //               ? _searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_amount"].toString() :  ourStudentList[index]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : ourStudentList[index]
                                    //           ["fee_amount"]
                                    //               : afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_amount"].toString() :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_amount"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_arrear"] : ourStudentList[index]["fee_arrear"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_arrear"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_arrear"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_name"].toString() : ourStudentList[index]["parent_name"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_name"].toString() : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_phone"].toString() : ourStudentList[index]
                                    //           ["parent_phone"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_phone"].toString() : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_phone"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["admission_number"].toString() : ourStudentList[index]
                                    //           ["admission_number"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["admission_number"].toString() :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["admission_number"],
                                    //           studentFeebackList,
                                    //           widget.name.toString(),
                                    //           widget.LoginedUserEmployeeCode.toString(),
                                    //           widget.images.toString(),
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["mother_details"]["mother_name"].toString() : ourStudentList[index]["mother_details"]
                                    //           ["mother_name"]
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["mother_details"]["mother_name"].toString() : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["mother_details"]["mother_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["mother_details"]["mother_mobile"].toString() : ourStudentList[index]["mother_details"]
                                    //           ["mother_mobile"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["mother_details"]["mother_mobile"].toString() :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["mother_details"]
                                    //           ["mother_mobile"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index].containsKey("mother_details") : ourStudentList[index].containsKey("mother_details")
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"].containsKey("mother_details") :  afterAttendanceTaken[index]
                                    //           ["feeDetails"].containsKey("mother_details"),
                                    //         );
                                    //       }else{
                                    //         DialogboxWithoutMotherDetails(
                                    //           context,
                                    //           _searchController.text.isNotEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               newResult[index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : afterAttendanceTaken == null ||
                                    //               afterAttendanceTaken.isEmpty
                                    //               ? toBeginningOfSentenceCase(
                                    //               ourStudentList[index]
                                    //               ["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString()
                                    //               : toBeginningOfSentenceCase(
                                    //               afterAttendanceTaken[
                                    //               index]["username"]
                                    //                   .toString()
                                    //                   .toLowerCase())
                                    //               .toString(),
                                    //           afterAttendanceTaken != null
                                    //               ? (_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["feeDetails"]["image"].replaceAll('"', '') : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               : ApiConstants.IMAGE_BASE_URL +
                                    //               afterAttendanceTaken[index]
                                    //               ["feeDetails"]["image"].replaceAll('"', ''))
                                    //               :_searchController.text.isNotEmpty
                                    //               ? ApiConstants.IMAGE_BASE_URL + newResult[index]["image"].replaceAll('"', '') : ourStudentList[index]["image"].replaceAll('"', '') ==
                                    //               null
                                    //               ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                    //               :ApiConstants.IMAGE_BASE_URL +
                                    //               ourStudentList[index]
                                    //               ["image"].replaceAll('"', ''),
                                    //           afterAttendanceTaken == null
                                    //               ? _searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_amount"] :  ourStudentList[index]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : ourStudentList[index]
                                    //           ["fee_amount"]
                                    //               : afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["fee_amount"] ==
                                    //               null
                                    //               ? " "
                                    //               : _searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_amount"].toString() :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_amount"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["fee_arrear"] : ourStudentList[index]["fee_arrear"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["fee_arrear"] : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["fee_arrear"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_name"].toString() : ourStudentList[index]["parent_name"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_name"].toString() : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_name"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["parent_phone"].toString() : ourStudentList[index]
                                    //           ["parent_phone"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["parent_phone"].toString() : afterAttendanceTaken[index]
                                    //           ["feeDetails"]["parent_phone"],
                                    //           afterAttendanceTaken == null
                                    //               ?_searchController.text.isNotEmpty
                                    //               ? newResult[index]["admission_number"].toString() : ourStudentList[index]
                                    //           ["admission_number"]
                                    //               :_searchController.text.isNotEmpty
                                    //               ? newResult[index]["feeDetails"]["admission_number"].toString() :  afterAttendanceTaken[index]
                                    //           ["feeDetails"]
                                    //           ["admission_number"],
                                    //           studentFeebackList,
                                    //           widget.name.toString(),
                                    //           widget.LoginedUserEmployeeCode.toString(),
                                    //           widget.images.toString(),
                                    //         );
                                    //       }
                                    //     }
                                    //   }
                                    // },
                                    // leftSwipeWidget:  Container(
                                    //   padding: EdgeInsets.all(30),
                                    //   color: ColorUtils.LOGIN_BUTTON,
                                    //   child: Icon(
                                    //     Icons.contacts,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                    // onLeftSwipe: () {
                                    //   Container(
                                    //     height: 200,
                                    //     color: Colors.red,
                                    //   );
                                    // },
                                    child: Container(
                                        margin: EdgeInsets.only(left: 10.w),
                                        child: Column(
                                          children: [
                                            Theme(
                                              data: ThemeData().copyWith(
                                                  dividerColor:
                                                      Colors.transparent),
                                              child: Row(
                                                children: [
                                                  badges.Badge(
                                                    position:
                                                        badges.BadgePosition
                                                            .bottomEnd(
                                                                end: 0,
                                                                bottom: -5),
                                                    badgeContent: Text(
                                                      "${index + 1}",
                                                      style: TextStyle(
                                                          color: Colorutils.userdetailcolor),
                                                    ),
                                                    badgeStyle:
                                                        badges.BadgeStyle(
                                                      elevation: 0,
                                                      badgeColor: Colorutils.chatcolor,
                                                    ),
                                                    child: Container(
                                                        width: 50.w,
                                                        height: 50.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Color(
                                                                  0xFFD6E4FA)),
                                                          shape:
                                                              BoxShape.circle,
                                                          // image: DecorationImage(
                                                          //     image: NetworkImage( afterAttendanceTaken != null
                                                          //         ? (afterAttendanceTaken[index]["feeDetails"]["image"] ==
                                                          //                 "avathar"
                                                          //             ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                                          //             :_searchController.text.isNotEmpty
                                                          //         ? ApiConstants.IMAGE_BASE_URL + newResult[index]["feeDetails"]["image"].replaceAll('"', '') : ApiConstants
                                                          //                     .IMAGE_BASE_URL +
                                                          //                 afterAttendanceTaken[index]
                                                          //                         ["feeDetails"][
                                                          //                     "image"].replaceAll('"', ''))
                                                          //         : (ourStudentList[index]["image"].replaceAll('"', '') ==
                                                          //                 null
                                                          //             ? "https://raw.githubusercontent.com/abdulmanafpfassal/image/master/profile.jpg"
                                                          //             : _searchController.text.isNotEmpty
                                                          //         ? ApiConstants.IMAGE_BASE_URL + newResult[index]["image"].replaceAll('"', '') : ApiConstants
                                                          //                     .IMAGE_BASE_URL +
                                                          //                 ourStudentList[index]
                                                          //                     ["image"].replaceAll('"', ''))),
                                                          //     fit: BoxFit.fill),
                                                        ),
                                                        child: ClipRRect(

                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          child:
                                                              CachedNetworkImage(
                                                            width: 50,
                                                            height: 50,
                                                            fit: BoxFit.fill,
                                                            imageUrl: "A",
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Center(
                                                              child: Text(
                                                                'A'
                                                                // '${ourStudentList[index]["username"].split(' ')[1].toString()[0]}'
                                                                ,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFB1BFFF),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          width: 150.w,
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Text(
                                                                "Mohhamad Noufal Azad",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.spaceGrotesk(
                                                                    textStyle: TextStyle(
                                                                        fontSize: 14
                                                                            .sp,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold))),
                                                          )),
                                                      SizedBox(
                                                        height: 6.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              "AED :",
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "900.00",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .red,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 15.w,
                                                  ),
                                                  Container(
                                                    child: FlutterSwitch(
                                                        width: 80.w,
                                                        height: 35.h,
                                                        valueFontSize: 16.sp,
                                                        toggleSize: 35.h,
                                                        toggleBorder:
                                                            Border.all(
                                                                color: Color(
                                                                    0xFFD6E4FA),
                                                                width: 2),
                                                        activeText: "  P",
                                                        inactiveText: "  A  ",
                                                        value: status,
                                                        borderRadius: 30.0,
                                                        padding: 0,
                                                        activeColor: Colorutils
                                                            .userdetailcolor,
                                                        inactiveColor:
                                                            Colors.red,
                                                        inactiveTextColor:
                                                            Colors.white,
                                                        activeTextColor:
                                                            Colors.white,
                                                        showOnOff: true,
                                                        onToggle: (val) {
                                                          setState(() {
                                                            status = val;
                                                          });
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.w,
                                                  top: 15.h,
                                                  bottom: 8.h),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 250.w,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () async {
                                                        showDialog(
                                                            context: context,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                                    backgroundColor:
                                                                        Colors.blue[
                                                                            50],
                                                                    title:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(50)),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              SizedBox(
                                                                                width: 80,
                                                                              ),
                                                                              Text(
                                                                                'Remarks',
                                                                                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 45,
                                                                              ),
                                                                              GestureDetector(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  height: 35,
                                                                                  width: 35,
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), border: Border.all(color: Colors.black)),
                                                                                  child: Icon(
                                                                                    Icons.close_rounded,
                                                                                    size: 25,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                10.h,
                                                                          ),
                                                                          Text(
                                                                            "gjzgs",
                                                                            style:
                                                                                TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                10.h,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )));
                                                      },
                                                      child: Container(
                                                          child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .remove_red_eye_outlined,
                                                            size: 18,
                                                          ),
                                                          Text(
                                                            'Late',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                color:
                                                                    Colors.red,
                                                                fontSize:
                                                                    15.sp),
                                                          ),
                                                        ],
                                                      ))
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              indent: 10,
                                              endIndent: 10,
                                              thickness: 0.5,
                                            )
                                          ],
                                        )),
                                  );
                                },
                              ),
                            )
                            ),


                          ])),
                ],
              ),
            ),
          ),
floatingActionButton: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      height: 40.w,
      width: 100.w,
      child: FloatingActionButton(

        onPressed: () {

        },
        child:Text(
          'SUBMIT',
          style: GoogleFonts.inter(
            fontSize: 15,color: Colorutils.chatcolor

          ),
        ),
        backgroundColor:Colorutils.userdetailcolor,
        elevation: 10,
        shape: RoundedRectangleBorder(


          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),
  ],
),
      ),
    );
  }
}
