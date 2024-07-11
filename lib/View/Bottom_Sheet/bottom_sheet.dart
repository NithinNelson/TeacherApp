import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Colors.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colorutils.whitebottom.withOpacity(0.3),
      padding: EdgeInsets.all(16),
      height: MediaQuery
          .of(context)
          .size
          .height * 0.85,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:  Text(
                  'Cancel',

                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,


                  ),
                ),
              ),
              Text(
                'New Chat',

                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,


                ),
              ),
              SizedBox(width: 48), // To balance the Cancel button width
            ],
          ),
          SizedBox(height: 16),
           TextField(
            decoration: InputDecoration(

              fillColor: Colors.red,
              hintText: 'Search name...',
              prefixIcon:Container(
                height: 27.w,
                width: 27.w,
                child: SvgPicture.asset(
                  'assets/images/MagnifyingGlass.svg',
                  width: 200,
                  height: 200,
                ),
              ),
              border: InputBorder.none, // Removes the outline border
            ),
          ),

          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            child: Row(
              children: List.generate(10, (index) {
            
                List<Color> colors = [Colorutils.letters1,Colorutils.svguicolour2, Colorutils.Subjectcolor4];
            
                Color color = colors[index % colors.length];

                return Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  child: Container(
                    padding: const EdgeInsets.all(15).w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: color
                    ),

                    child: Text(
                      '4A',
                      style: GoogleFonts.inter(
                        fontSize: 16.0,

                        color: Colors.white,

                      ),
                    ),

                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: List.generate(10, (index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/user.png'), // Change to your image asset
                  ),
                  title: Text('Person $index'),
                  subtitle: Text('Subtitle $index'),
                  trailing: index % 3 == 0
                      ? TextButton(
                    onPressed: () {},
                    child: Text('Invite'),
                  )
                      : null,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}