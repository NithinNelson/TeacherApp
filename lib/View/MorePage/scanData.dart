import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/View/Home_Page/Home_Widgets/bottom_navigationbar.dart';
import 'package:teacherapp/View/MorePage/trackingPage.dart';

import '../../Utils/Colors.dart';

class Scandata extends StatefulWidget {
  const Scandata({super.key});

  @override
  State<Scandata> createState() => _ScandataState();
}

class _ScandataState extends State<Scandata> {
   bool isClicked = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 60,
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          size: 30,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Text(
                        "Add Students",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, bottom: 8, top: 4),
                child: Container(
                  height: 90.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colorutils.chatcolor,
                          child: Image.asset("assets/images/ben.png"),
                        ),
                      ),
                      Container(
                        width: 210.w,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 6, bottom: 6, left: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: 200.w,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text("Brinesh Elmore martin",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600))),
                                  )),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Grade 2-B",
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "312016fff",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 6,
                          bottom: 6,
                        ),
                        child: Container(
                            width: 70,
                            child: Image.asset("assets/images/Imagez.png")),
                      ),
                    ],
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
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isClicked=true;
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 60,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: isClicked? Colors.red :  Colors.grey, // Border color
                                  width: 2, // Border width
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset(
                                      "assets/images/Vector (3).svg",color: isClicked? Colors.red :  Colors.grey,),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Clinic")
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isClicked=true;
                      });
                    },
                    child: Container(
                      height: 80,
                      width: 90,
                      child: Column(
                        children: [
                          GestureDetector(

                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:isClicked? Colors.red :  Colors.grey, // Border color
                                  width: 2, // Border width
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset(
                                    "assets/images/Group.svg",
                                    color: isClicked? Colors.red :  Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                isClicked=true;
                              });
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Washroom")
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isClicked=true;
                      });
                    },
                    child: Container(
                      height: 80,
                      width: 90,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: isClicked? Colors.red :  Colors.grey, // Border color
                                width: 2, // Border width
                              ),
                            ),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: SvgPicture.asset(
                                  "assets/images/noun-clinic-1886699 2.svg",color: isClicked? Colors.red :  Colors.grey,),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Councellor")
                        ],
                      ),
                    ),
                  )
                ],
              ),
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
                child: TextFormField(

                  validator: (val) => val!.isEmpty
                      ? '  *Fill the Field to Submit'
                      : null,

                  decoration: InputDecoration(
                      hintStyle:
                      const TextStyle(color: Colors.black26),
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
                            color: Color.fromRGBO(
                                230, 236, 254, 8),
                            width: 1.0),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(22)).r,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(
                                230, 236, 254, 8),
                            width: 1.0),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(30.0)).r,
                      ),
                      fillColor:Colors.white
                          .withOpacity(0.3),
                      filled: true),
                  maxLines: 5,
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: GestureDetector(
                    onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingPage()));
                    },
                    child: Container(
                        height: 50.h,
                        width: 220.w,
                        decoration: BoxDecoration(
                          color: Colorutils
                              .userdetailcolor,
                          borderRadius:
                          const BorderRadius.all(
                              Radius.circular(
                                  15))
                              .r,
                        ),
                        child: const Center(
                          child: Text(
                            'SEND',
                            style: TextStyle(
                                color: Colors.white),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),

        ),
    bottomNavigationBar: CustomBottomNavigationBar(),);
  }
}
