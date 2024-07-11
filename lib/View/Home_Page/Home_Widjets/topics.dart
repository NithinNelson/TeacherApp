import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacherapp/Utils/Colors.dart';

class topic extends StatelessWidget {
  const topic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: Colorutils.topicbackground2,
        ),
        height: 180.w,



child: Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(26),
    color: Colorutils.topicbackground.withOpacity(0.3), // You can change this color as needed
  ),
  margin: EdgeInsets.only(bottom: 23), // Adjust the margin as ne/ Adjust the height and width as needededed
child: Row(
  children: [
    Container(height: 160,width: 200,

    child: Container(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                height: 70.w,

                child:  Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/calculator 1.svg',
                      fit: BoxFit.contain,
                    ),
                  ],
                ),

              ),
            ),
              Padding(
                padding: const EdgeInsets.only(top: 16,left: 4),
                child: Container(height: 70.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mathematics',
                      style: TextStyle(
                        fontSize: 16.0,

                        color: Colors.black,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      '4A',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),),
              )
            ],
          ),
          Text('Linear Algebra Equations'),
          SizedBox(height: 3,),
          Container(
            height: 50.w,
            width: 100.w,
            child:  Stack(
              children: [
                Positioned(
                  left: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.cyanAccent,
                    radius: 15,
                  ),
                ),
                Positioned(
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 15,
                  ),
                ),
                Positioned(
                  left: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    radius: 15,
                  ),
                ),
                Positioned(
                  left: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                  ),
                ),],
            ),

          )
        ],
      ),

    ),),
    Container(
      child: Image.asset("assets/images/book2.png",
       fit: BoxFit.fitWidth,
      ),
    )
  ],
),
),


      ),
    );
  }
}
