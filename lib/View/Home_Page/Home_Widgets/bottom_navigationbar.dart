import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';
import '../../../Controller/ui_controllers/page_controller.dart';
import '../../../Models/ui_models/menu_item_model.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.w,
      child: Theme(
        data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
        child: GetX<PageIndexController>(
          builder: (PageIndexController controller) {
            int currentIndex = controller.pageIndex.value;
            List<MenuItemsModel> menuItems = controller.menuItemsPerRole;
            return BottomNavigationBar(
                currentIndex: 4,
                selectedLabelStyle: const TextStyle(
                    fontSize: 0
                ),
                backgroundColor: Colorutils.Whitecolor,
                type: BottomNavigationBarType.fixed,
                items:  <BottomNavigationBarItem>[
                  for(int i = 0; i < 5; i++)
                    if(menuItems[i].index == 2)
                      BottomNavigationBarItem(
                        icon: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            controller.changePage(currentPage: menuItems[i].index);
                          },
                          child: CircleAvatar(
                            radius: 25.r,
                            backgroundColor: Colorutils.userdetailcolor,
                            child: SvgPicture.asset(
                              currentIndex == menuItems[i].index ? "assets/images/chat_selected_icon.svg" : "assets/images/chat_icon.svg",
                              alignment: Alignment.center,
                              height: 21.w,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        label: "",
                      )
                  else
                    BottomNavigationBarItem(
                      icon: GestureDetector(
                        onTap: () {
                          controller.changePage(currentPage: menuItems[i].index);
                          },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              menuItems[i].svg,
                              height: 26.w,
                              fit: BoxFit.fitHeight,
                              color: currentIndex == menuItems[i].index ? Colorutils.letters1 : Colorutils.bottomiconcolor,
                            ),
                            SizedBox(height: 3.w),
                            Text(
                              menuItems[i].title,
                              style: currentIndex == menuItems[i].index ? TeacherAppFonts.poppinsW500_13sp_letters1 : TeacherAppFonts.poppinsW400_12sp_bottomiconcolor,
                            )
                          ],
                        ),
                      ),
                      label: "",
                    ),
                  // BottomNavigationBarItem(
                  //   icon: GestureDetector(
                  //     onTap: () {
                  //       controller.changePage(currentPage: 1);
                  //       // showModalBottomSheet(
                  //       //   context: context,
                  //       //   isScrollControlled: true,
                  //       //   shape: RoundedRectangleBorder(
                  //       //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  //       //   ),
                  //       //   builder: (context) => ParentSelectionBottomSheet(),
                  //       // );
                  //     },
                  //     child: Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         SvgPicture.asset(
                  //           'assets/images/clock-three 1.svg',
                  //           height: 26.w,
                  //           fit: BoxFit.fitHeight,
                  //           color: currentIndex == 1 ? Colorutils.letters1 : Colorutils.bottomiconcolor,
                  //         ),
                  //         SizedBox(height: 3.w),
                  //         Text(
                  //           'Leave',
                  //           style: currentIndex == 1 ? TeacherAppFonts.poppinsW500_13sp_letters1 : TeacherAppFonts.poppinsW400_12sp_bottomiconcolor,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   label: '',
                  // ),
                  // BottomNavigationBarItem(
                  //   icon: GestureDetector(
                  //     onTap: () {
                  //       controller.changePage(currentPage: 2);
                  //       // Navigator.pushReplacement(
                  //       //     context,
                  //       //     MaterialPageRoute(builder: (context) =>  ChatWithParentsPage(zoomDrawerController:zoomDrawerController,)));
                  //     },
                  //     child: CircleAvatar(
                  //       radius: 25.r,
                  //       backgroundColor: Colorutils.userdetailcolor,
                  //       child: SvgPicture.asset(
                  //         currentIndex == 2 ? "assets/images/chat_selected_icon.svg" : "assets/images/chat_icon.svg",
                  //         alignment: Alignment.center,
                  //         height: 21.w,
                  //         fit: BoxFit.fitHeight,
                  //       ),
                  //     ),
                  //   ),
                  //   label: "",
                  // ),
                  // BottomNavigationBarItem(
                  //   icon: GestureDetector(
                  //     onTap: () {
                  //       controller.changePage(currentPage: 3);
                  //     },
                  //     child: Column(
                  //       children: [
                  //         SvgPicture.asset(
                  //           'assets/images/chart-pie-alt.svg',
                  //           height: 26.w,
                  //           fit: BoxFit.fitHeight,
                  //           color: currentIndex == 3 ? Colorutils.letters1 : Colorutils.bottomiconcolor,
                  //         ),
                  //         SizedBox(height: 3.w),
                  //         Text(
                  //           'OBS Result',
                  //           style: currentIndex == 3 ? TeacherAppFonts.poppinsW500_13sp_letters1 : TeacherAppFonts.poppinsW400_12sp_bottomiconcolor,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   label: '',
                  // ),
                  // BottomNavigationBarItem(
                  //   icon: GestureDetector(
                  //     onTap: (){
                  //       controller.changePage(currentPage: 4);
                  //       // showModalBottomSheet(
                  //       //   context: context,
                  //       //   isScrollControlled: true,
                  //       //   shape: RoundedRectangleBorder(
                  //       //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  //       //   ),
                  //       //   builder: (context) => BottomSheetContent(),
                  //       // );
                  //     },
                  //     child: Column(
                  //       children: [
                  //         SvgPicture.asset(
                  //           'assets/images/apps 2.svg',
                  //           height: 26.w,
                  //           fit: BoxFit.fitHeight,
                  //           color: currentIndex == 4 ? Colorutils.letters1 : Colorutils.bottomiconcolor,
                  //         ),
                  //         SizedBox(height: 3.w),
                  //         Text(
                  //           'More',
                  //           style: currentIndex == 4 ? TeacherAppFonts.poppinsW500_13sp_letters1 : TeacherAppFonts.poppinsW400_12sp_bottomiconcolor,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   label: '',
                  // ),
                ],
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colorutils.userdetailcolor
            );
          },
        ),
      ),
    );
  }
}

