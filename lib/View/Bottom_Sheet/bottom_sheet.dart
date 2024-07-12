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
      color: Colorutils.whitebottom.withOpacity(0.01),
      padding: EdgeInsets.only(left: 16,right: 16,bottom: 16),
      height: MediaQuery
          .of(context)
          .size
          .height * 0.80,
      child: Column(
        children: [
          Divider(
            thickness: 3,
            color: Colors.grey,
            indent: 130,
            endIndent: 130,
          ),
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
                    fontSize: 15.0,
                    decoration: TextDecoration.underline,

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
              fillColor: Colors.white,
              filled: true,
              hintText: 'Search name..',

              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    'assets/images/MagnifyingGlass.svg',
                    color: Colors.grey,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0), // Border radius
                borderSide: BorderSide.none, // Removes the outline border
              ),              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            ),
            style: TextStyle(color: Colors.black), // Text color
            cursorColor: Colors.black, // Cursor color
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
                    radius: 24,
                    backgroundImage: AssetImage(
                        'assets/images/profile image.png'),
                  ),
                  title:Text(
                    'Ali Bin Omar',
                    style: TextStyle(
                      fontSize: 18.0, // Adjust the font size as needed
                      color: Colorutils.bottomiconcolor, // Choose your desired color

                    ),
                  ),
                  subtitle: Text(
                    'Son of Alibin omar',
                    style: TextStyle(
                      fontSize: 14.0, // Adjust the font size as needed
                      color: Colorutils.topicbackground, // Choose your desired color

                    ),
                  ),
                  trailing: index % 3 == 0
                      ? TextButton(
                    onPressed: () {},
                    child:Text(
                      'invite',
                      style: TextStyle(
                        fontSize: 14.0, // Adjust the font size as needed
                        color: Colorutils.topicbackground, // Choose your desired color

                      ),
                    ),
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