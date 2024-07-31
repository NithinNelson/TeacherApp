import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:teacherapp/Utils/Colors.dart';


class misbehav extends StatefulWidget {
  String? admissionNumber;
  String? employeeCode;
  String? nameOfLoginTeacher;
  String? fees;

  misbehav(
      {Key? key,
        this.nameOfLoginTeacher,
        this.employeeCode,
        this.admissionNumber,
        this.fees})
      : super(key: key);

  @override
  _misbehavState createState() => _misbehavState();
}

class _misbehavState extends State<misbehav> {
  var remarkController = TextEditingController();
  bool isPresses = false;

  var dropdownValue;
  var dropDownList = [
    {"id": "5", "status": "Abusive language"},
    {"id": "6", "status": "Did not agree to pay fees"},
    {"id": "7", "status": "Advised a call from higher authority"}
  ];

  getCurrentDate() {
    final DateFormat formatter = DateFormat('d-MMMM-y');
    String createDate = formatter.format(DateTime.now());
    return createDate;
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal:10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w,top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Misbehaviour",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Container(child: _getTypesView()),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                child: Column(
                  children: [
                    Container(

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1.0, 3.0), //(x,y)
                                blurRadius: 40),
                          ],
                        ),
                        child:  Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color:Colorutils.chatcolor),
                              // boxShadow: [
                              //   BoxShadow(color: ColorUtils.SHADOW_COLOR, blurRadius: 20)
                              // ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(14.r),
                              )),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextField(
                                  controller: remarkController,
                                  maxLength: 100,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    hintText: "Remarks",
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    isDense: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Center(
                      child: isPresses
                          ? CircularProgressIndicator(
                        color: Color(0xFF6FDCFF),
                      )
                          : GestureDetector(
                        onTap: () async {},
                        child:  Container(
                          height: 50.w,
                          width: 200.w,
                          child: FloatingActionButton(

                            onPressed: () {

                            },
                            child:Text(
                              'SUBMIT',
                              style: GoogleFonts.inter(
                                  fontSize: 15,color: Colorutils.chatcolor

                              ),
                            ),
                            backgroundColor:Colorutils.userdetailcolor,
                            elevation: 10,
                            shape: RoundedRectangleBorder(


                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getMisbehaviourText() => Text(
    "Misbehaviour",
    style: TextStyle(
      color: Colors.blueGrey,
      fontSize: 16,
    ),
  );
  Widget _getTypesView() => Container(
    alignment: Alignment.center,
    height: 50,
    padding: EdgeInsets.only(top: 5.h, left: 30.w, right: 22.w,bottom: 5),
    child: _DropDownListData(),
    decoration: BoxDecoration(
        color: Colorutils.chatcolor,
        borderRadius: BorderRadius.all(
          Radius.circular(14.r),
        )),
  );

  Widget _DropDownListData() {
    return DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        hint: const Text("Misbehaviour",style: TextStyle(fontSize: 14),),
        icon: const Icon(
          Icons.arrow_drop_down,
          size: 25,
          color: Colors.blueGrey,
        ),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.blueGrey),
        underline: Container(
          color: Colors.transparent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue;
            print(dropdownValue);
          });
        },
        items: dropDownList.map<DropdownMenuItem<String>>((item) {
          return DropdownMenuItem<String>(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    item['status'].toString(),
                    maxLines: 1,
                  )),
              value: item["id"]);
        }).toList());
  }

  Widget _getRemark() => Container(
    padding: EdgeInsets.symmetric(
        horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue),
        // boxShadow: [
        //   BoxShadow(color: ColorUtils.SHADOW_COLOR, blurRadius: 20)
        // ],
        borderRadius: BorderRadius.all(
          Radius.circular(14.r),
        )),
    child: ConstrainedBox(
      constraints: BoxConstraints(minHeight: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: remarkController,
            maxLines: null,
            maxLength: 100,
            decoration: const InputDecoration(
              hintText: "Remarks",
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              isDense: false,
            ),
          ),
        ],
      ),
    ),
  );


}
