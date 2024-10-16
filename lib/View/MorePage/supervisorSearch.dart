
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/MorePage/scanData.dart';

import '../../Controller/api_controllers/hierarchController.dart';
import '../../Models/api_models/HierarchyModel.dart';
import '../../Models/api_models/hos_listing_api_model.dart';
import '../Leave_Page/All_leave.dart';
import '../Leave_Page/Approve_Rejected.dart';
import '../Leave_Page/Approved_leave.dart';

class Supervisorsearch extends StatefulWidget {
  final Function(String) selectedName;

  const Supervisorsearch({super.key, required this.selectedName});

  @override
  State<Supervisorsearch> createState() => _SupervisorsearchState();
}

class _SupervisorsearchState extends State<Supervisorsearch>
    with SingleTickerProviderStateMixin {
  late TabController _tabController1;

  @override
  void initState() {
    super.initState();
    _tabController1 = TabController(length: 3, vsync: this);
    initialize();
    _tabController1.addListener(() {});
  }

  @override
  void dispose() {
    _tabController1.dispose();
    super.dispose();
  }

  Future<void> initialize() async {
    context.loaderOverlay.show();
    // leaveApprovalController.resetStatus();
    if (!mounted) return;
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Column(
            children: [
              Container(
                height: 60,
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_outlined,
                            size: 30,
                          ),
                        )),
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      "Select Hierarchy",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    indicator: BoxDecoration(
                      // color: _tabController1.index == 0 ? Colors.red[500] : Colors.grey[500],
                      // color: Colors.grey[500],
                      color: Colors.red[500],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    indicatorColor: Colors.red,
                    labelColor: Colorutils.white,
                    unselectedLabelColor: Colorutils.white,
                    dividerHeight: 0,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorPadding: EdgeInsets.zero,

                    // indicator: BoxDecoration(),
                    controller: _tabController1,
                    labelPadding: EdgeInsets.symmetric(horizontal: 5),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 40.h,
                          width: (ScreenUtil().screenWidth - 66) * 2 / 6,
                          decoration: BoxDecoration(
                            // color: _tabController1.index == 0 ? Colors.red[500] : Colors.grey[500],
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'HOS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.h,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 40.h,
                          width: (ScreenUtil().screenWidth - 66) * 2 / 6,
                          decoration: BoxDecoration(
                            // color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "HOD",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.h,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 40.h,
                          width: (ScreenUtil().screenWidth - 66) * 2 / 6,
                          decoration: BoxDecoration(
                            // color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "SUPERVISOR",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.h,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),

              Expanded(
                child: GetX<Hierarchcontroller>(

                  builder: (Hierarchcontroller controller) {
                    List<Users> Hoslist = controller.hosdata;
                    List<Users> Hodlist = controller.hoddata;
                    List<Users> Supervisorlist = controller.supervisordata;
                    return TabBarView(
                      controller: _tabController1,
                      children: [Expanded(
                        child: ListView.builder(
                            padding:
                            const EdgeInsets.only(bottom: 70),
                            itemCount:
                            Hoslist.length,
                            itemBuilder: (context, index) =>
                                listcontainer1(
                                    HosList:
                                    Hoslist[
                                    index], text: (p0) {
                                      widget.selectedName(p0);
                                    },)),


                      ),

                        Expanded(
                          child: ListView.builder(
                              padding:
                              const EdgeInsets.only(bottom: 70),
                              itemCount:
                              Hodlist.length,
                              itemBuilder: (context, index) =>
                                  listcontainer2(
                                      HosList:
                                      Hodlist[
                                      index], text: (p0) {
                                    widget.selectedName(p0);
                                  },)),


                        ),
                        Expanded(
                          child: ListView.builder(


                              padding:
                              const EdgeInsets.only(bottom: 70),
                              itemCount:
                              Supervisorlist.length,
                              itemBuilder: (context, index) =>
                                  listcontainer3(
                                      HosList:
                                      Supervisorlist[
                                      index], text: (p0) {
                                    widget.selectedName(p0);
                                  },)
                          ),


                        ),
                      ],
                    );
                  },

                ),
              ),

            ]
        ),
      ),
    );
  }
}

class listcontainer1 extends StatelessWidget {
  final Users HosList;
  final Function(String) text;

  const listcontainer1({super.key, required this.HosList, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
      child: GestureDetector(
        onTap: (){
          text("${HosList.name}");
          Navigator.of(context).pop();
        },
        child: Container(
          // height: 70.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 270.w,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Center(
                          child: Text("${HosList.name?.toUpperCase()}",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                  ],
                ),

              ],
            ),
          ),


        ),
      ),
    );
  }
}

class listcontainer2 extends StatelessWidget {
  final Function(String) text;
  final Users HosList;

  const listcontainer2({super.key, required this.HosList, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
      child: GestureDetector(
        onTap: (){
          text("${HosList.name}");
          Navigator.of(context).pop();
        },
        child: Container(
          // height: 70.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 270.w,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Center(
                          child: Text("${HosList.name}",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                  ],
                ),

              ],
            ),
          ),


        ),
      ),
    );
  }
}

class listcontainer3 extends StatelessWidget {
  final Function(String) text;
  final Users HosList;

  listcontainer3({super.key, required this.HosList, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
      child: GestureDetector(
        onTap: (){
          text("${HosList.name}");
          Navigator.of(context).pop();
        },
        child: Container(
          // height: 70.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 270.w,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Center(
                          child: Text("${HosList.name}",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                  ],
                ),

              ],
            ),
          ),


        ),
      ),
    );
  }
}