// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../Utils/Colors.dart';
// import '../Home_Page/Home_Widgets/bottom_navigationbar.dart';
//
// class AllStudents extends StatelessWidget {
//   const AllStudents({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white.withOpacity(0.95),
//       // appBar: AppBar(
//       //   leading: IconButton(
//       //     icon: Icon(Icons.arrow_back),
//       //     onPressed: () {
//       //       // Navigator.push(context, MaterialPageRoute(builder: (context) =>HOM ))
//       //     },
//       //   ),
//       //   title: Padding(
//       //     padding: const EdgeInsets.only(left: 80),
//       //     child: Text(
//       //       "Add Students",
//       //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//       //     ),
//       //   ),
//       //
//       //   backgroundColor: Colors.white.withOpacity(0.95),
//       //
//       // ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               height: 60,
//               child: Row(
//                 children: [
//
//                   Padding(padding: EdgeInsets.only(left: 18),
//                   child: Icon(Icons.arrow_back_outlined,size: 30,)),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 70),
//                     child: Text("Add Students",style: TextStyle(
//                       fontSize: 20,fontWeight: FontWeight.w600
//                     ),),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 12,right: 12),
//               child: Container(
//                 height: 55.h,
//                 decoration: BoxDecoration(
//
//                     border: Border(
//
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(10))
//                 ),
//                 width: double.infinity,
//                 child: TextFormField(
//                   onChanged: (value) {
//                     // Get.find<LeaveApprovalController>().filterLeaveList(text: value);
//                   },
//                   validator: (val) => val!.isEmpty ? 'Enter the Topic' : null,
//                   cursorColor: Colors.grey,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                       hintStyle: TextStyle(color: Colors.grey),
//                       hintText: "Student Name or Scan",
//                       prefixIcon:Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(height:40,width:40,child: SvgPicture.asset("assets/images/MagnifyingGlass (1).svg")),
//                       ),
//                       suffixIcon: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(height:35,width:35,child: SvgPicture.asset("assets/images/Scanner 3.svg")),
//                       ),
//                       contentPadding:
//                       EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                       border: OutlineInputBorder(
//
//                         borderRadius: BorderRadius.all(
//
//                           Radius.circular(2.0),
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Colors.grey.withOpacity(0.2)),
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color.fromRGBO(230, 236, 254, 8), width: 1.0),
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                       fillColor: Colorutils.Whitecolor,
//                       filled: true),
//                 ),
//
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.only(left: 18,right: 18),
//               child: Container(
//                 height: 50,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                    Text('Recent List',style: TextStyle(
//                      fontSize: 18.w,fontWeight: FontWeight.bold
//                    ),),
//                     Text('View All',style: TextStyle(
//             fontSize: 18.w,fontWeight: FontWeight.bold,color: Colorutils.userdetailcolor
//             ),),
//
//
//                   ],
//                 ),
//               ),
//             ),
//         Expanded(child: ListView.builder(  itemCount: 10,  itemBuilder: (context, index) =>  listcontainer()))
//           ],
//         ),
//       )
//     ,
//       bottomNavigationBar: CustomBottomNavigationBar(),
//
//       floatingActionButton: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5)
//
//         ),
//         width: 150,
//         height: 50,
//         child: FloatingActionButton.small(
//
//           onPressed: (){},
//           child: Padding(
//             padding: const EdgeInsets.only(left: 15),
//             child: Row(
//               children: [
//                 Text("SCAN QR CODE",style: TextStyle(color: Colors.white),),
//             SizedBox(width: 5,),
//             Container(height:25,width:25,child: SvgPicture.asset("assets/images/Scanner 3.svg",color: Colors.white,))
//               ],
//             ),
//           ),
//           backgroundColor: Colorutils.userdetailcolor,
//         ),
//       ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
// class listcontainer extends StatelessWidget {
//   const listcontainer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 12,right: 12,bottom: 8,top: 4),
//       child: Container(
//         height: 75.h,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//
//
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 5),
//                 child: CircleAvatar(
//                   radius: 25,
//                   backgroundColor: Colorutils.chatcolor,
//                 ),
//               ),
//             ),
//             Container(
//              width: 210.w,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 6,bottom: 6,left: 2),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                         width: 200.w,
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Text(
//                               "Brinesh Elmore martin",
//                               overflow: TextOverflow.ellipsis,
//                               style: GoogleFonts.inter(
//                                   textStyle: TextStyle(
//                                       fontSize:
//                                       18.sp,
//                                       color: Colors.black,
//                                       fontWeight:
//                                       FontWeight
//                                           .w600))),
//                         )),
//                     SizedBox(height: 3,),
//                     Padding(
//                       padding: const EdgeInsets.only(top:4,bottom: 4),
//                       child: Container(
//                           width: 130.w,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: Colors.red.withOpacity(0.5),
//
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 8),
//                             child: Text(
//                                 "Sent to Clinic",
//                                 overflow: TextOverflow.ellipsis,
//                                 style: GoogleFonts.inter(
//                                     textStyle: TextStyle(
//                                         fontSize:
//                                         16.sp,
//                                         color: Colors.black,
//                                         ))),
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//
//
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 6,bottom: 6,),
//               child: Container(
//                 width: 100,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//
//                         child: Text(
//                             "10-Dec-2024",
//
//                             overflow: TextOverflow.ellipsis,
//                             style: GoogleFonts.inter(
//                                 textStyle: TextStyle(
//                                     fontSize:
//                                     16.sp,
//                                     color: Colors.grey,
//                                     fontWeight:
//                                     FontWeight
//                                         .bold)))),
//                     SizedBox(height: 3,),
//                     Padding(
//                       padding: const EdgeInsets.only(top:4,bottom: 4),
//                       child: Container(
//                           width: 130.w,
//
//
//
//                           child: Text(
//                               "Grade 2-B",
//
//                               style: GoogleFonts.inter(
//                                   textStyle: TextStyle(
//                                       fontSize:
//                                       16.sp,
//                                       color: Colors.black,
//                                       fontWeight:
//                                       FontWeight
//                                           .bold)))),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
