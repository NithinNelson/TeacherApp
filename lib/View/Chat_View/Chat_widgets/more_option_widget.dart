
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';

import '../../../Utils/Colors.dart';
import '../../../Utils/font_util.dart';
import 'message_info_screen.dart';

class MessageMoreContainer extends StatelessWidget {
  const MessageMoreContainer({
    super.key,
    required this.widget,
  });

  final Widget widget;

  // bool showDelete = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.h),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Column(
          children: [
            Get.find<FeedViewController>().seletedMsgData!.message == null
                ? const SizedBox()
                : Column(
                    children: [
                      MessageMoreSettingsTile(
                        function: () async {
                          await Clipboard.setData(ClipboardData(
                              text: Get.find<FeedViewController>()
                                  .seletedMsgData!
                                  .message!));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Copied to clipboard'),
                          ));
                          // snackBar(
                          //     context: context,
                          //     message: "Copy to clipboard",
                          //     color: Colorutils.black);
                        },
                        text: "Copy",
                        icon: "assets/images/Copy.svg",
                      ),
                      const Divider(
                        color: Colorutils.dividerColor2,
                        height: 0,
                      ),
                    ],
                  ),
            MessageMoreSettingsTile(
              function: () {},
              text: "View Chat",
              icon: "assets/images/View_chat.svg",
            ),
            const Divider(
              color: Colorutils.dividerColor2,
              height: 0,
            ),
            MessageMoreSettingsTile(
              function: () {},
              text: "Reply",
              icon: "assets/images/ArrowBendUpLeft.svg",
            ),
            const Divider(
              color: Colorutils.dividerColor2,
              height: 0,
            ),
            MessageMoreSettingsTile(
              function: () {},
              text: "Forward",
              icon: "assets/images/ArrowBendUpRight.svg",
            ),
            const Divider(
              color: Colorutils.dividerColor2,
              height: 0,
            ),
            MessageMoreSettingsTile(
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessageInfoScreen(widget: widget),
                    ));
              },
              text: "Message info",
              icon: "assets/images/Info.svg",
            ),
            Get.find<FeedViewController>().showDelete(Get.find<FeedViewController>().seletedMsgData!.sendAt ?? '--')
                ? Column(
                    children: [
                      const Divider(
                        color: Colorutils.dividerColor2,
                        height: 0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 10.h),
                        child: GestureDetector(
                          onTap: () {
                            Get.find<FeedViewController>().deleteMsg(
                                context: context,
                                teacherId: Get.find<UserAuthController>().userData.value.userId,
                                msgId: int.parse(Get.find<FeedViewController>()
                                    .seletedMsgData!
                                    .messageId!));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delete Chat",
                                style: TeacherAppFonts
                                    .interW400_16sp_letters1
                                    .copyWith(color: Colorutils.fontColor11),
                              ),
                              SizedBox(
                                height: 26.h,
                                width: 26.h,
                                child: SvgPicture.asset("assets/images/Trash.svg"),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class MessageMoreSettingsTile extends StatelessWidget {
  const MessageMoreSettingsTile({
    super.key,
    required this.text,
    required this.icon,
    required this.function,
  });

  final String text;
  final String icon;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      child: GestureDetector(
        onTap: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style:
                  TeacherAppFonts.interW400_16sp_letters1.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 26.h,
              width: 26.h,
              child: SvgPicture.asset(icon),
            )
          ],
        ),
      ),
    );
  }
}
