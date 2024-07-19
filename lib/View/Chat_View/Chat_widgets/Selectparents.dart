import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/Colors.dart';
import '../../../Utils/font_util.dart';



class ParentSelectionBottomSheet extends StatefulWidget {
  @override
  _ParentSelectionBottomSheetState createState() => _ParentSelectionBottomSheetState();
}

class _ParentSelectionBottomSheetState extends State<ParentSelectionBottomSheet> {
  List<Map<String, dynamic>> parents = [

    {"name": "Ali bin Omar", "relation": "Son of Hilal Ibrahim", "selected": true},
    {"name": "Aisha bint Ali", "relation": "Daughter of Hibat Ibrahim", "selected": true},
    {"name": "Youssef bin Khalid", "relation": "Son of Hilal Ibrahim", "selected": true},
    {"name": "Abdullah bin Hassan", "relation": "Son of Hilal Ibrahim", "selected": false},
    {"name": "Ibrahim bin Ahmed", "relation": "Son of Hilal Ibrahim", "selected": false},
    {"name": "Zainab bint Omar", "relation": "Daughter of Hibat Ibrahim", "selected": false},
    {"name": "Noor bint Khalid", "relation": "Daughter of Saeed bin Ibrahim", "selected": false},
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
          color: Colorutils.whitebottom.withOpacity(0.01),
          padding: EdgeInsets.only(left: 16,bottom: 16),
      height: MediaQuery
          .of(context)
          .size
          .height * 0.85,
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel', style: TextStyle(color: Colors.red)),
                    ),
                    Column(
                      children: [
                        Text(
                          'Select Parents',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '5/34',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colorutils.userdetailcolor),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Done', style: TextStyle(color: Colors.green)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child:  TextField(
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
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  children: List.generate(10, (index) {

                    List<Color> colors = [Colorutils.letters1,Colorutils.svguicolour2, Colorutils.Subjectcolor4];

                    Color color = colors[index % colors.length];

                    return Padding(
                      padding: const EdgeInsets.only(left: 15,right: 5),
                      child: Stack(
                        children: [

                          Container(
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
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 15.w,
                              height: 15.w,
                              padding: const EdgeInsets.all(3).w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colorutils.Whitecolor,
                              ),
                              child:SvgPicture.asset('assets/images/cancel.svg',)
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: parents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if(parents[index]['selected'])
                            Icon(Icons.check_circle, color: Colors.green),
                          SizedBox(width: 10.w,),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/profile image.png'),
                          )
                        ],
                      ),
                      title: Text(parents[index]['name']),
                      subtitle: Text(parents[index]['relation']),

                      onTap: () {
                        setState(() {
                          parents[index]['selected'] = !parents[index]['selected'];
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );


  }
}
