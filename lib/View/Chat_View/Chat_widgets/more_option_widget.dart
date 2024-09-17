import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/api_controllers/parentChatController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/View/forward_screen.dart/forward_screen.dart';

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
                          // ScaffoldMessenger.of(context)
                          //     .showSnackBar(const SnackBar(
                          //   content: Text('Copied to clipboard'),
                          // ));
                          Navigator.pop(context);
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
            // MessageMoreSettingsTile(
            //   function: () {},
            //   text: "View Chat",
            //   icon: "assets/images/View_chat.svg",
            // ),
            // const Divider(
            //   color: Colorutils.dividerColor2,
            //   height: 0,
            // ),
            MessageMoreSettingsTile(
              function: () async {
                Get.find<FeedViewController>().isReplay.value =
                    Get.find<FeedViewController>().seletedMsgData!.messageId;
                Get.find<FeedViewController>().replayMessage =
                    Get.find<FeedViewController>().seletedMsgData!;
                Get.find<FeedViewController>().replayName.value =
                    Get.find<FeedViewController>()
                                .seletedMsgData!
                                .messageFromId ==
                            Get.find<UserAuthController>().userData.value.userId
                        ? "you"
                        : Get.find<FeedViewController>()
                            .seletedMsgData!
                            .messageFrom!;

                Navigator.pop(context);
                await Future.delayed(const Duration(milliseconds: 50))
                    .then((value) {
                  Get.find<FeedViewController>().focusNode.value.requestFocus();
                });
              },
              text: "Reply",
              icon: "assets/images/ArrowBendUpLeft.svg",
            ),
            const Divider(
              color: Colorutils.dividerColor2,
              height: 0,
            ),
            MessageMoreSettingsTile(
              function: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForwardScreen(),
                    ));
              },
              text: "Forward",
              icon: "assets/images/ArrowBendUpRight.svg",
            ),
            Get.find<UserAuthController>().userData.value.userId ==
                    Get.find<FeedViewController>()
                        .seletedMsgData!
                        .messageFromId!
                ? Column(
                    children: [
                      const Divider(
                        color: Colorutils.dividerColor2,
                        height: 0,
                      ),
                      MessageMoreSettingsTile(
                        function: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MessageInfoScreen(
                                  widget: widget,
                                  messageId: int.parse(
                                      Get.find<FeedViewController>()
                                          .seletedMsgData!
                                          .messageId!),
                                ),
                              ));
                        },
                        text: "Message info",
                        icon: "assets/images/Info.svg",
                      ),
                    ],
                  )
                : const SizedBox(),
            Get.find<FeedViewController>().showDelete(
                        Get.find<FeedViewController>().seletedMsgData!.sendAt ??
                            '--') &&
                    Get.find<UserAuthController>().userData.value.userId ==
                        Get.find<FeedViewController>()
                            .seletedMsgData!
                            .messageFromId!
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
                            print("working");
                            Get.find<FeedViewController>().deleteMsg(
                                context: context,
                                teacherId: Get.find<UserAuthController>()
                                    .userData
                                    .value
                                    .userId,
                                msgId: int.parse(Get.find<FeedViewController>()
                                    .seletedMsgData!
                                    .messageId!));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delete Chat",
                                style: TeacherAppFonts.interW400_16sp_letters1
                                    .copyWith(color: Colorutils.fontColor11),
                              ),
                              SizedBox(
                                height: 26.h,
                                width: 26.h,
                                child:
                                    SvgPicture.asset("assets/images/Trash.svg"),
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

class MessageMoreContainer2 extends StatelessWidget {
  const MessageMoreContainer2({
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
            Get.find<ParentChattingController>().seletedMsgData!.message == null
                ? const SizedBox()
                : Column(
                    children: [
                      MessageMoreSettingsTile(
                        function: () async {
                          await Clipboard.setData(ClipboardData(
                              text: Get.find<ParentChattingController>()
                                  .seletedMsgData!
                                  .message!));
                          // ScaffoldMessenger.of(context)
                          //     .showSnackBar(const SnackBar(
                          //   content: Text('Copied to clipboard'),
                          // ));
                          Navigator.pop(context);
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
            // MessageMoreSettingsTile(
            //   function: () {},
            //   text: "View Chat",
            //   icon: "assets/images/View_chat.svg",
            // ),
            // const Divider(
            //   color: Colorutils.dividerColor2,
            //   height: 0,
            // ),
            MessageMoreSettingsTile(
              function: () async {
                Get.find<ParentChattingController>().isReplay.value =
                    Get.find<ParentChattingController>()
                        .seletedMsgData!
                        .messageId;
                Get.find<ParentChattingController>().replayMessage =
                    Get.find<ParentChattingController>().seletedMsgData!;
                Get.find<ParentChattingController>().replayName.value =
                    Get.find<ParentChattingController>()
                                .seletedMsgData!
                                .messageFromId ==
                            Get.find<UserAuthController>().userData.value.userId
                        ? "you"
                        : Get.find<ParentChattingController>()
                            .seletedMsgData!
                            .messageFrom!;

                Navigator.pop(context);
                await Future.delayed(const Duration(milliseconds: 50))
                    .then((value) {
                  Get.find<ParentChattingController>()
                      .focusNode
                      .value
                      .requestFocus();
                });
              },
              text: "Reply",
              icon: "assets/images/ArrowBendUpLeft.svg",
            ),
            const Divider(
              color: Colorutils.dividerColor2,
              height: 0,
            ),
            MessageMoreSettingsTile(
              function: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForwardScreen(),
                    ));
              },
              text: "Forward",
              icon: "assets/images/ArrowBendUpRight.svg",
            ),

            Get.find<UserAuthController>().userData.value.userId ==
                    Get.find<ParentChattingController>()
                        .seletedMsgData!
                        .messageFromId!
                ? Column(
                    children: [
                      const Divider(
                        color: Colorutils.dividerColor2,
                        height: 0,
                      ),
                      MessageMoreSettingsTile(
                        function: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MessageInfoScreen(
                                  widget: widget,
                                  messageId: int.parse(
                                      Get.find<ParentChattingController>()
                                          .seletedMsgData!
                                          .messageId!),
                                ),
                              ));
                        },
                        text: "Message info",
                        icon: "assets/images/Info.svg",
                      ),
                    ],
                  )
                : const SizedBox(),
            Get.find<UserAuthController>().userData.value.userId ==
                        Get.find<ParentChattingController>()
                            .seletedMsgData!
                            .messageFromId! &&
                    Get.find<ParentChattingController>().showDelete(
                        Get.find<ParentChattingController>()
                                .seletedMsgData!
                                .sendAt ??
                            '--')
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
                            print("working");
                            Get.find<ParentChattingController>().deleteMsg(
                                context: context,
                                teacherId: Get.find<UserAuthController>()
                                    .userData
                                    .value
                                    .userId,
                                msgId: int.parse(
                                    Get.find<ParentChattingController>()
                                        .seletedMsgData!
                                        .messageId!));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delete Chat",
                                style: TeacherAppFonts.interW400_16sp_letters1
                                    .copyWith(color: Colorutils.fontColor11),
                              ),
                              SizedBox(
                                height: 26.h,
                                width: 26.h,
                                child:
                                    SvgPicture.asset("assets/images/Trash.svg"),
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
              style: TeacherAppFonts.interW400_16sp_letters1
                  .copyWith(color: Colors.black),
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
