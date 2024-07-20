
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:teacherapp/View/Login_page/login.dart';
import '../../Utils/Colors.dart';

class HosListing extends StatefulWidget {
  const HosListing({super.key});

  @override
  State<HosListing> createState() => _HosListingState();
}

class _HosListingState extends State<HosListing> {
  String? _hosNameSelected;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    context.loaderOverlay.show();
    await Get.find<UserAuthController>().fetchHosList();
    if(!mounted) return;
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 180.h,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.w),
                          bottomRight: Radius.circular(12.w)),
                      color: Colorutils.userdetailcolor,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 40,
                  child: SvgPicture.asset(
                    'assets/images/pencil2.svg',
                    width: 100.w,
                    color: Colorutils.Whitecolor.withOpacity(0.1),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  left: 240,
                  top: 25,
                  child: Transform.rotate(
                    angle: 0.5,
                    child: SvgPicture.asset(
                      'assets/images/stars1.svg',
                      width: 20.w,
                      color: Colorutils.Whitecolor.withOpacity(0.5),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  left: 220,
                  top: 65,
                  child: SvgPicture.asset(
                    'assets/images/graduation-cap-icon.svg',
                    width: 30.w,
                    color: Colorutils.Whitecolor.withOpacity(0.07),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  left: 140,
                  top: 10,
                  child: SvgPicture.asset(
                    'assets/images/read-book-icon.svg',
                    width: 30.w,
                    color: Colorutils.Whitecolor.withOpacity(0.07),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  left: 115,
                  top: 65,
                  child: SvgPicture.asset(
                    'assets/images/stars1.svg',
                    width: 20.w,
                    color: Colorutils.Whitecolor.withOpacity(0.5),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  left: 5,
                  top: 10,
                  child: SvgPicture.asset(
                    'assets/images/stars1.svg',
                    width: 20.w,
                    color: Colorutils.Whitecolor.withOpacity(0.5),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 140,
                  child: SvgPicture.asset(
                    'assets/images/stars1.svg',
                    color: Colorutils.Whitecolor.withOpacity(0.9),
                    width: 25.w,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: -90,
                  child: SvgPicture.asset(
                    'assets/images/pencil3.svg',
                    color: Colorutils.Whitecolor.withOpacity(0.2),
                    height: 180.w,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w, top: 100.h, right: 20.w, bottom: 20.w),
                  // width: 550.w,
                  height: ScreenUtil().screenHeight * 0.8,
                  decoration: BoxDecoration(
                    color: Colorutils.Whitecolor,
                    // Container color
                    borderRadius: BorderRadius.circular(20.r),
                    // Border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colorutils.userdetailcolor.withOpacity(0.3),
                        // Shadow color
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      const Center(
                          child: Text(
                            'Select HOS',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w800),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 20.h),
                        child: GetX<UserAuthController>(
                          builder: (UserAuthController controller) {
                            return DropdownButtonFormField(
                              validator: (dynamic value) =>
                              value == null ? 'Field Required' : null,
                              value: _hosNameSelected,
                              isExpanded: true,
                              onChanged: (dynamic newVal) {
                                setState(() async {
                                  _hosNameSelected = newVal;
                                  //
                                  // _hosListSelectedIndex =
                                  //     int.parse(newVal.toString());
                                  // hosname =
                                  // _hosnameSelected.toString().split('-')[0];
                                  // hosId =
                                  // _hosnameSelected.toString().split('-')[1];
                                  // await getUserLoginCredentials();
                                  // hosId = hosdata![
                                  // _hosListSelectedIndex!]['user_id'];
                                  // print(teacherName);
                                  // print(
                                  //     'hosId---------------------------------->$hosId');
                                  print(
                                      'newVal---------------------------------->$newVal');
                                  // print(
                                  //     'hosname---------------------------------->$hosname');
                                  setState(() {});
                                });
                              },
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.3)),
                                  contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 20).w,
                                  hintText: " Select a HOS ",
                                  counterText: "",
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(230, 236, 254, 8),
                                        width: 1.0),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(230, 236, 254, 8),
                                        width: 1.0),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                  ),
                                  fillColor: const Color.fromRGBO(230, 236, 254, 8),
                                  filled: true),
                              items: controller.hosList
                                  .map<DropdownMenuItem<dynamic>>((item) {
                                return DropdownMenuItem<dynamic>(
                                  value: '${item.hosName}-${item.userId.toString()}',
                                  child: Text(
                                    item.hosName ?? '--',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 75, right: 75, top: 20),
                        child: GestureDetector(
                          onTap: () async {
                            // // await getUserLoginCredentials();
                            // if (_formKey.currentState!.validate()) {
                            //   print('validation success');
                            //   // if (_formKey.currentState!.validate()) {
                            //   //   print('validation success');
                            //   if (lessonData != null) {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 DrawerPageForHos(
                            //                   loginname: loginname,
                            //                   userId: hosId,
                            //                   HOSID: hosId,
                            //                   HOSNAME: hosname,
                            //                   loginedUserEmployeeNo:
                            //                   widget.loginEmployeeID,
                            //                   designation: widget.designation,
                            //                   schoolId: widget.schoolID,
                            //                   loginedUserName: widget.name,
                            //                   images: widget.images,
                            //                   academic_year:
                            //                   widget.academic_year,
                            //                   roleUnderHos: employeeUnderHOS,
                            //                   Empcodee: employeeUnderHOS,
                            //                   isAClassTeacher: newTeacherData,
                            //                   role_id:
                            //                   widget.role_id ?? roles,
                            //                 )));
                            //   } else {
                            //     // setState(() {
                            //     //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cannot fetch teacher data')));
                            //     // });
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //         SnackBar(
                            //             content: Text(
                            //                 'Cannot fetch teacher data')));
                            //   }
                            //   // } else {
                            //   //   print('validation failed');
                            //   // }
                            // } else {
                            //   print('validation failed');
                            // }
                          },
                          child: Container(
                              height: 60.h,
                              width: 220.w,
                              decoration: BoxDecoration(
                                color: Color(0xff42C614),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                              )),
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15, right: 15).w,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/logout.svg",
                                color: Colors.red,
                              ),
                            ),
                            onPressed: () {
                              TeacherAppPopUps.logOutPopUp(context: context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
