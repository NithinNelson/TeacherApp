

import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacherapp/View/Chat_View/Chat_widgets/parent_select_bottomSheet.dart';

import '../../../Controller/api_controllers/feedViewController.dart';
import '../../../Models/api_models/parent_list_api_model.dart';
import '../../../Utils/font_util.dart';

class SelectedParentsList extends StatelessWidget {
  const SelectedParentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedViewController>(
      builder: (FeedViewController controller) {
        List<ParentDataSelected> selectedParents = controller.showSelectedParentDataStack.value;
        int stackLength = controller.showSelectedParentDataStack.value.length > 5 ? 4 : selectedParents.length;
        double stackWidth = stackLength * 44;
        return controller.showSelectedParentDataStack.isEmpty? SizedBox():  Row(
          children: [
            InkWell(
              onTap: () {
                print("object");
                controller.unselectAll();


              },

              child: Container(
                width: 22.w,
                height: 22.w,
                padding: const EdgeInsets.all(2).w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8).r,
                ),
                child: FittedBox(child: Icon(Icons.close, color: Color(0xFF118376))),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              "Selected",
              style: TeacherAppFonts.interW400_14sp_textWhite.copyWith(
                color: Color(0xFF118376),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              // "${selectedParents.length}",
              "${controller.showSelectedParentDataStack.value.length}",
              style: TeacherAppFonts.interW600_14sp_textWhite.copyWith(
                color: Color(0xFF118376),
              ),
            ),
            Text(
              " Parents",
              style: TeacherAppFonts.interW600_14sp_textWhite.copyWith(
                color: Color(0xFF118376),
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              width: stackWidth,
              height: 45,
              child:Stack(
                children: [
                    ...List.generate(controller.showSelectedParentDataStack.length >5 ?4:controller.showSelectedParentDataStack.length, (index) {
                      return Positioned(
                        left: index * 20,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: CachedNetworkImage(
                              imageUrl: controller.showSelectedParentDataStack[index].image ?? '',
                              errorWidget: (context, url, error) {
                                return const Icon(Icons.person, color: Colors.grey);
                              },
                            ),
                          ),
                        ),
                      );
                    },),
                  Positioned(
                    left: (controller.showSelectedParentDataStack.length >5 ?4:controller.showSelectedParentDataStack.length) * 20,
                    child: InkWell(
                      onTap: () {
                        controller.showParentListFilteredToSelectedList();
                        showModalBottomSheet(
                          context: context,
                          backgroundColor:
                          Colors.transparent,
                          isScrollControlled:
                          true,
                          builder: (context) {
                            return ParentSelectionBottomSheet();
                          },
                        );
                      },
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFF118376),
                          child: Icon(Icons.add, color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
