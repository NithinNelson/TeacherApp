import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/Colors.dart';

class monday extends StatelessWidget {
  const monday({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 440,

        child: ListView.builder(

            itemCount: 30,
            itemBuilder: (context, index) {
              List<Color> colors = [

                Colorutils.userdetailcolor.withOpacity(0.2),
                Colorutils.Classcolour1.withOpacity(0.4),
                Colorutils.Classcolour3.withOpacity(0.9),
                Colorutils.svguicolour2.withOpacity(0.9),
              ];
              Color color = colors[index % colors.length];
              List<Color> colors1 = [
                Colorutils.userdetailcolor.withOpacity(0.4),
                Colorutils.Classcolour1.withOpacity(0.6),
                Colorutils.Classcolour3.withOpacity(0.8),
                Colorutils.svguicolour2.withOpacity(0.8),
              ];
              Color color1 = colors1[index % colors.length];
              return ListTile(

                  title: Container(
                      height: 60,
                      child: Row(
                        children: [

                          Container(height:50 ,width: 150,child:  Container(
                            height: 40.w,
                            width: 120.w,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5)
                                .w,
                            decoration: BoxDecoration(
                              color: color1,
                              borderRadius:
                              BorderRadius.circular(12.0).r,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: color,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Text("7J",
                                        style: TextStyle(

                                            color: Colors.white,
                                            fontSize: 12
                                        )),
                                  ),
                                ),

                                SizedBox(width: 5.w),
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection:
                                    Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text('Maths',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Container(height:50 ,width: 150,child:   Center(
                            child: Text('10.40AM-11.30PM',
                                style: TextStyle(
                                    color: color1,
                                    fontSize: 12)),
                          ),),
                        ],
                      )
                  )

              );
            }));
  }
}
