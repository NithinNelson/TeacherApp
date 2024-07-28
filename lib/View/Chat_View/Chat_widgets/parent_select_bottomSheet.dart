import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/font_util.dart';

class ParentSelectionBottomSheet extends StatefulWidget {
  const ParentSelectionBottomSheet({super.key});

  @override
  State<ParentSelectionBottomSheet> createState() =>
      _ParentSelectionBottomSheetState();
}

class _ParentSelectionBottomSheetState
    extends State<ParentSelectionBottomSheet> {
  List<Map<String, dynamic>> parents = [
    {
      "name": "Ali bin Omar",
      "relation": "Son of Hilal Ibrahim",
      "selected": true
    },
    {
      "name": "Aisha bint Ali",
      "relation": "Daughter of Hibat Ibrahim",
      "selected": true
    },
    {
      "name": "Youssef bin Khalid",
      "relation": "Son of Hilal Ibrahim",
      "selected": true
    },
    {
      "name": "Abdullah bin Hassan",
      "relation": "Son of Hilal Ibrahim",
      "selected": false
    },
    {
      "name": "Ibrahim bin Ahmed",
      "relation": "Son of Hilal Ibrahim",
      "selected": false
    },
    {
      "name": "Zainab bint Omar",
      "relation": "Daughter of Hibat Ibrahim",
      "selected": false
    },
    {
      "name": "Noor bint Khalid",
      "relation": "Daughter of Saeed bin Ibrahim",
      "selected": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10).r,
        ),
        padding: const EdgeInsets.only(left: 16, bottom: 16).w,
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 16).w,
              child: Container(
                width: 50.w,
                height: 5.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100).r,
                    color: Colors.grey.withOpacity(0.5)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 10, bottom: 10).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Select Parents',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        '5 / 34',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colorutils.letters1),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                        'Done',
                      style: TextStyle(
                        color: Colorutils.letters1,
                        fontSize: 16.sp,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16).w,
              child: TextField(
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
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                ),
                style: TextStyle(color: Colors.black), // Text color
                cursorColor: Colors.black, // Cursor color
              ),
            ),
            SizedBox(height: 16.w),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(10, (index) {
                  List<Color> colors = [
                    Colorutils.letters1,
                    Colorutils.svguicolour2,
                    Colorutils.Subjectcolor4
                  ];

                  Color color = colors[index % colors.length];

                  return Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5).w,
                    child: Stack(
                      children: [
                        Image.asset("assets/images/profile image.png"),
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
                              child: SvgPicture.asset(
                                'assets/images/cancel.svg',
                              )),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 16.w),
            Expanded(
              child: ListView.builder(
                itemCount: parents.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(0),
                    minVerticalPadding: 0,
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (parents[index]['selected'])
                          Icon(Icons.check_circle, color: Colors.green)
                        else
                          Icon(Icons.check_circle, color: Colors.transparent),
                        SizedBox(
                          width: 10.w,
                        ),
                        CircleAvatar(
                          radius: 25.r,
                          backgroundImage:
                          AssetImage('assets/images/profile image.png'),
                        )
                      ],
                    ),
                    title: Text(
                      parents[index]['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      parents[index]['relation'],
                      style: TeacherAppFonts.poppinsW500_12sp_lightGreenForParent,
                    ),
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
      ),
    );
  }
}
