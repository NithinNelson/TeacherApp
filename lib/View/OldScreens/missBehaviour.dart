import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:teacherapp/Services/snackBar.dart';
import 'package:teacherapp/Utils/Colors.dart';
import '../../Controller/api_controllers/userAuthController.dart';
import '../../Utils/api_constants.dart';

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

  SubmitRequest() async {
    UserAuthController userAuthController = Get.find<UserAuthController>();
    var url = Uri.parse(ApiConstants.DOCME_URL);
    var header = {
      "API-Key": "525-777-777",
      "Content-Type": "application/json",
    };
    var bdy = {
      "action": "addArrearFollowupData",
      "token": userAuthController.schoolToken.value,
      "admn_no": widget.admissionNumber,
      "date": getCurrentDate().toString(),
      "feedback": remarkController.text,
      "employee_name": widget.nameOfLoginTeacher,
      "status": dropdownValue.toString(),
      "commited_date": getCurrentDate().toString(),
      "employee_code": widget.employeeCode,
      "followup_fee_amount": widget.fees
    };
    print(bdy);
    var _encoded_req = json.encode(bdy);
    var jsonresponse =
        await http.post(url, headers: header, body: _encoded_req);
    print(jsonresponse.body);
    if (jsonresponse.statusCode == 200) {
      if (mounted) {
        await snackBar(
            context: context,
            message: "Submitted Successfully",
            color: Colors.green);
        // Navigator.of(context).pop();
        // Utils.showToastSuccess("Submitted Successfully")
        //     .show(context)
        //     .then((_) {
        //   NavigationUtils.goBack(context);
        // });
      }
      print("submit success");
    } else {
      await snackBar(
          context: context, message: "Submit Failed", color: Colors.green);
      Navigator.of(context).pop();
      // Utils.showToastError("Submit Failed").show(context).then((_) {
      //   NavigationUtils.goBack(context);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _getMisbehaviourText(),
              SizedBox(height: 10.w),
              _getTypesView(),
              SizedBox(height: 20.w),
              _getRemark(),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: isPresses
                    ? CircularProgressIndicator(
                        color: Color(0xFFFEA2A2),
                      )
                    : Container(
                        height: 50.w,
                        width: 200.w,
                        child: FloatingActionButton(
                          onPressed: () async {
                            if (dropdownValue == null) {
                              snackBar(
                                  context: context,
                                  message:
                                      "Please select one option to continue",
                                  color: Colors.red);
                              // Utils.showToastError(
                              //     "Please select one option to continue")
                              //     .show(context);
                            } else {
                              print(dropdownValue == null);
                              if (remarkController.text == null ||
                                  remarkController.text.isEmpty) {
                                snackBar(
                                    context: context,
                                    message:
                                        "Please select one option to continue",
                                    color: Colors.red);
                                // Utils.showToastError(
                                //     "Please Fill the Required Field")
                                //     .show(context);
                              } else {
                                setState(() {
                                  isPresses = true;
                                });
                                SubmitRequest();
                                Navigator.of(context).pop();
                              }
                            }
                          },
                          child: Text(
                            'SUBMIT',
                            style: GoogleFonts.inter(
                                fontSize: 15, color: Colorutils.chatcolor),
                          ),
                          backgroundColor: Colorutils.userdetailcolor,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),

              ),
              SizedBox(
                height: 10.h,
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
          color: Colors.black,
          fontSize: 18.sp,
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
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colorutils.chatcolor),
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

// _submitFailed(context) {
//   return Alert(
//     context: context,
//     type: AlertType.success,
//     title: "Submitted Successfully",
//     style: AlertStyle(
//         isCloseButton: false,
//         titleStyle: TextStyle(color: Color.fromRGBO(66, 69, 147, 7))),
//     buttons: [
//       DialogButton(
//         color: Colors.white,
//         child: Text(
//           "",
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         onPressed: () async {
//           Navigator.pop(context);
//         },
//         // print(widget.academicyear);
//         //width: 120,
//       )
//     ],
//   ).show();
// }
}
