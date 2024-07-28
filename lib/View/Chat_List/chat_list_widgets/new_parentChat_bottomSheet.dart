import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Controller/api_controllers/parentChatListController.dart';
import 'package:teacherapp/Utils/font_util.dart';
import 'package:teacherapp/View/Chat_View/parent_msg_screen.dart';
import '../../../Models/api_models/parent_chat_list_api_model.dart';
import '../../../Utils/Colors.dart';

class NewParentChat extends StatefulWidget {
  const NewParentChat({super.key});

  @override
  State<NewParentChat> createState() => _NewParentChatState();
}

class _NewParentChatState extends State<NewParentChat> {
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
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Colorutils.Whitecolor.withOpacity(0.1),
          //     Colorutils.newChatBottom.withOpacity(0.97),
          //   ],
          // ),
        ),
        padding: const EdgeInsets.only(left: 16, bottom: 16).w,
        height: MediaQuery.of(context).size.height * 0.85,
        child: GetX<ParentChatListController>(
          builder: (ParentChatListController controller) {
            controller.filterByClass('All');
            List<String> classNameList = controller.allClasses.value;
            List<Datum> filteredChatList = controller.filteredChatList.value;
            return Column(
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
                  padding: const EdgeInsets.only(right: 16, top: 5, bottom: 5).w,
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
                      Text(
                        'New Chat',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          shadowColor: WidgetStateColor.transparent,
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.transparent,
                            fontSize: 16.sp,
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: List.generate(classNameList.length, (index) {
                        List<Color> colors = [
                          Colorutils.letters1,
                          Colorutils.svguicolour2,
                          Colorutils.Subjectcolor4
                        ];

                        Color color = colors[index % colors.length];

                        return Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5).w,
                          child: InkWell(
                            onTap: () {
                              controller.filterByClass(classNameList[index]);
                            },
                            child: Container(
                              width: 55.w,
                              height: 55.w,
                              padding: const EdgeInsets.all(15).w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100).r,
                                color: color,
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2.w
                                ),
                              ),
                              child: FittedBox(
                                child: Text(
                                  classNameList[index],
                                  style: GoogleFonts.inter(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 16.w),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredChatList.length,
                    padding: EdgeInsets.only(bottom: View.of(context).viewInsets.bottom * 0.5),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        minVerticalPadding: 0,
                        leading: CircleAvatar(
                          radius: 25.r,
                          backgroundImage:
                          AssetImage('assets/images/profile image.png'),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(right: 16).w,
                          child: Text(
                            filteredChatList[index].studentName ?? '--',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(right: 16).w,
                          child: Text(
                            filteredChatList[index].parentName ?? '--',
                            overflow: TextOverflow.ellipsis,
                            style: TeacherAppFonts.poppinsW500_12sp_lightGreenForParent,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParentMsgScreen()));
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
