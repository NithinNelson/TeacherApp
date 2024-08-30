import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/message_info_controller/message_info_controller.dart';
import 'package:teacherapp/Services/common_services.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/font_util.dart';

class MessageInfoScreen extends StatelessWidget {
  const MessageInfoScreen({
    super.key,
    required this.widget,
    required this.messageId,
  });

  final Widget widget;
  final int messageId;

  @override
  Widget build(BuildContext context) {
    Get.find<MessageInfoController>()
        .getMessageInfo(context: context, messageId: messageId);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 121.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colorutils.letters1,
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        height: 24.h,
                        width: 24.h,
                        child: SvgPicture.asset("assets/images/back.svg"),
                      ),
                    ),
                    SizedBox(width: 20.h),
                    Text(
                      "Message info",
                      style: TeacherAppFonts.interW600_18sp_textWhite,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/chatBg.png",
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: widget,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/images/Checks.svg",
                          width: 20.w,
                          fit: BoxFit.fitWidth,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'SEEN BY',
                            style: TeacherAppFonts.interW600_14sp_black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetX<MessageInfoController>(builder: (controller) {
                    if (controller.viewsList.value == null) {
                      return SizedBox(
                          height: 400.h, child: Center(child: Text("No Data")));
                    } else {
                      return Column(
                        children: List.generate(
                            controller.viewsList.value!.length, (index) {
                          final data = controller.viewsList.value![index];

                          return ChatItem(
                            className: data.studentName ?? "--",
                            studentName:
                                "${data.relation} of ${data.parentName}",
                            date: data.seenOn!,
                            unreadMessages: "unreadMessages",
                            classs: "${data.studentName!.split("").first}",
                          );
                        }),
                      );
                    }
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String className;
  final String studentName;
  final String date;
  final String? unreadMessages;
  final String classs;

  const ChatItem({
    super.key,
    required this.className,
    required this.studentName,
    required this.date,
    required this.unreadMessages,
    required this.classs,
  });

  @override
  Widget build(BuildContext context) {
    final random = Random();
    int randomIndex = random.nextInt(Colorutils.chatLeadingColors.length);
    Color randomElement = Colorutils.chatLeadingColors[randomIndex];
    return Padding(
      padding: EdgeInsets.all(15.h),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: randomElement,
            radius: 20.r,
            child: FittedBox(
              child: Text(
                classs,
                style: TeacherAppFonts.interW600_14sp_textWhite,
              ),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.all(1).w,
          //   decoration: BoxDecoration(
          //     color: Colors.grey,
          //     borderRadius: BorderRadius.circular(100).r,
          //   ),
          //   child: Container(
          //     padding: const EdgeInsets.all(10).w,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(100).r,
          //     ),
          //     child: CachedNetworkImage(
          //       imageUrl: '--',
          //       errorWidget: (context, txt, obj) => const Icon(Icons.person, color: Colors.grey),
          //     ),
          //   ),
          // ),
          SizedBox(width: 15.h),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxWidth: 120),
                            child: Text(
                              // "English",
                              // "className",
                              className,
                              style: TeacherAppFonts.interW600_16sp_black,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              // "studentName",
                              studentName,
                              overflow: TextOverflow.ellipsis,
                              style: TeacherAppFonts
                                  .poppinsW400_12sp_lightGreenForParent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                // "02/04/24",
                convertDateFormat(date),
                style: TeacherAppFonts.interW400_14sp_textWhite.copyWith(
                  color: Colorutils.letters1,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                // "7:32PM",
                convertTimeFormat(date),
                style: TeacherAppFonts.interW500_14sp_letters1.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
