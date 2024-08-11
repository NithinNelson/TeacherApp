import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Services/common_services.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/font_util.dart';
import '../../../Models/api_models/parent_list_api_model.dart';

class ParentSelectionBottomSheet extends StatelessWidget {
  const ParentSelectionBottomSheet({super.key});

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
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10).r,
        ),
        padding: const EdgeInsets.only(left: 16, bottom: 16).w,
        height: MediaQuery.of(context).size.height * 0.85,
        child: GetBuilder<FeedViewController>(
          builder: (FeedViewController controller) {
            int count = controller.parentListApiData.value.data?.count ?? 0;
            // List<ParentData> parentList = controller.parentDataList.value;
            List<ParentDataSelected> selectedParentList = controller.selectedParentDataList.value;
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
                            '${selectedParentList.length} / $count',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colorutils.letters1),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          controller.selectedDoneFunction();
                          // controller.takeSelectedListForSubmit();
                          Navigator.of(context).pop();
                        },
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
                    onChanged: (value) {
                      controller.search(value);
                    },
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
                SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(selectedParentList.length, (index) {
                        List<Color> colors = [
                          Colorutils.letters1,
                          Colorutils.svguicolour2,
                          Colorutils.Subjectcolor4
                        ];

                        Color color = colors[index % colors.length];

                        if(selectedParentList[index].isSelected) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5).w,
                            child: Stack(
                              children: [
                                Container(
                                  width: 55.w,
                                  height: 55.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: color,
                                      )
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100).r,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10).w,
                                      child: FittedBox(
                                        child: CachedNetworkImage(
                                          imageUrl: selectedParentList[index].image ?? '',
                                          errorWidget: (context, url, error) {
                                            return const Icon(Icons.person, color: Colors.grey);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Image.asset("assets/images/profile image.png"),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () => controller.removeParentList(selectedParentList[index]),
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
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 16.w),
                Expanded(
                  child: ListView.builder(
                    itemCount: selectedParentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<Color> colors = [
                        Colorutils.letters1,
                        Colorutils.svguicolour2,
                        Colorutils.Subjectcolor4
                      ];

                      Color color = colors[index % colors.length];
                      return ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        minVerticalPadding: 0,
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (selectedParentList[index].isSelected)
                              const Icon(Icons.check_circle, color: Colors.green)
                            else
                              const Icon(Icons.circle_outlined, color: Colors.green),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              width: 55.w,
                              height: 55.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: color,
                                  )
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100).r,
                                child: FittedBox(
                                  child: CachedNetworkImage(
                                    imageUrl: selectedParentList[index].image ?? '',
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10).w,
                                        child: const Icon(Icons.person, color: Colors.grey),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        title: Text(
                          capitalizeEachWord(selectedParentList[index].studentName) ?? '--',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          selectRelation(selectedParentList[index]),
                          style: TeacherAppFonts.poppinsW500_12sp_lightGreenForParent,
                        ),
                        onTap: () {
                          controller.addParentList(selectedParentList[index]);
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

  String selectRelation(ParentDataSelected parentData) {
    String? gender = parentData.gender?.substring(0, 1).toUpperCase();
    if(gender != null) {
      if(gender == "F") {
        return "Daughter of ${capitalizeEachWord(parentData.name) ?? '--'}";
      } else if(gender == "M") {
        return "Son of ${capitalizeEachWord(parentData.name) ?? '--'}";
      }
    }
    return "--";
  }
}
