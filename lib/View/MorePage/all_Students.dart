import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/Colors.dart';
import '../Home_Page/Home_Widgets/bottom_navigationbar.dart';

class AllStudents extends StatelessWidget {
  const AllStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) =>HOM ))
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            "Add Students",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.white,

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18,right: 18),
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(

                  border: Border(

                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              width: double.infinity,
              child: TextFormField(
                onChanged: (value) {
                  // Get.find<LeaveApprovalController>().filterLeaveList(text: value);
                },
                validator: (val) => val!.isEmpty ? 'Enter the Topic' : null,
                cursorColor: Colors.grey,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "Enter Student Name or Scan",
                    prefixIcon:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height:40,width:40,child: SvgPicture.asset("assets/images/MagnifyingGlass (1).svg")),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height:35,width:35,child: SvgPicture.asset("assets/images/Scanner 3.svg")),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.all(

                        Radius.circular(2.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(230, 236, 254, 8), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    fillColor: Colorutils.Whitecolor,
                    filled: true),
              ),
              //  child: Row(
              //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //  children: [
              //  Container(
              // width: 50,
              //    child: Padding(
              //      padding: const EdgeInsets.all(8.0),
              //      child: SvgPicture.asset(
              //        'assets/images/MagnifyingGlass (1).svg',
              //        width: 42.w,
              //
              //        fit: BoxFit.fitWidth,
              //      ),
              //    ),
              //  ),
              //  Container(
              //  width: 150,
              //    color: Colors.grey,
              //    child: Text('ben'),
              //  ),
              //  Container(
              //    width: 50,
              //    child: Padding(
              //      padding: const EdgeInsets.all(8.0),
              //      child: SvgPicture.asset(
              //        'assets/images/Scanner 3.svg',
              //        width: 42.w,
              //
              //        fit: BoxFit.fitWidth,
              //      ),
              //    ),
              //  )
              //  ],
              //      ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 18,right: 18),
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Text('Recent List',style: TextStyle(
                   fontSize: 18.w,fontWeight: FontWeight.bold
                 ),),
                  Text('View All',style: TextStyle(
    fontSize: 18.w,fontWeight: FontWeight.bold,color: Colorutils.userdetailcolor
    ),),


                ],
              ),
            ),
          ),
Expanded(child: ListView.builder(  itemCount: 10,  itemBuilder: (context, index) =>  listcontainer()))
        ],
      )
    ,
      bottomNavigationBar: CustomBottomNavigationBar(),
    );

  }
}
class listcontainer extends StatelessWidget {
  const listcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: double.infinity,
        color: Colors.cyan,
      ),
    );
  }
}
