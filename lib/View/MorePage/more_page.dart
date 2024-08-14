import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';

import '../../Utils/Colors.dart';
import '../../Utils/constants.dart';
import 'all_Students.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>HOM ))
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Text(
              "More",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>AllStudents() ));
                },
                child: Stack(
                  children: [
                    Container(
                      height: 120.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colorutils.morebrown,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(

                            child: SvgPicture.asset(
                              'assets/images/Routing 4.svg',
                              width: 42.w,
                              color: Colorutils.Whitecolor,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Text('Student Tracking',style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,

                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: SvgPicture.asset(
                        'assets/images/Union.svg',
                        width: 100.w,
                        color: Colorutils.Whitecolor,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  rubrics({required rubricslessonob}) {}
}
