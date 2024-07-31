import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';
import '../../../Controller/ui_controllers/chat_controller.dart';
import '../../Utils/font_util.dart';
import '../Chat_List/Mychat/Chat_seen.dart';
import 'Chat_widgets/message_info_screen.dart';

class ParentMsgScreen extends StatefulWidget {
  const ParentMsgScreen({super.key});

  @override
  State<ParentMsgScreen> createState() => _ParentMsgScreenState();
}

class _ParentMsgScreenState extends State<ParentMsgScreen> {
  TextEditingController messageCtr = TextEditingController();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
    // screenHeight = ScreenUtil().screenHeight;
    // isKeboardOpen = false;
    // keybordHeight = 0;
    Get.find<MessageController>().isReplay.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorutils.userdetailcolor,
        leadingWidth: 40.w,
        titleSpacing: 5,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ],
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(radius: 20.r, backgroundColor: Colors.white),
            SizedBox(width: 10.w),
            Text(
              'My Class',
              style: GoogleFonts.inter(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 27.w,
              width: 27.w,
              child: SvgPicture.asset(
                'assets/images/MagnifyingGlass.svg',
                width: 200,
                height: 200,
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        // height: screenHeight,

        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/chatBg.png",
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    const ChatList(),
                  ],
                ),
              ),
            ),
            GetX<MessageController>(
              builder: (controller) {
                return Container(
                  width: double.infinity,
                  color: Color(0xffF6F6F6),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        controller.isReplay.value
                            ? Column(
                          children: [
                            IntrinsicHeight(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(10.h),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 7.w,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.h),
                                          bottomLeft:
                                          Radius.circular(10.h),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(5.w),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                controller
                                                    .replayName.value,
                                                style: TeacherAppFonts.interW600_16sp_black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                controller
                                                    .replayMessage.value,
                                                maxLines: 3,
                                                overflow:
                                                TextOverflow.ellipsis,
                                                style: TeacherAppFonts.interW400_16sp_letters1.copyWith(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Get.find<MessageController>()
                                              .isReplay
                                              .value = false;
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                          ],
                        )
                            : const SizedBox(),
                        Row(
                          children: [
                            InkWell(
                              onTap: () async {},
                              child: SizedBox(
                                height: 25.w,
                                width: 25.w,
                                child: SvgPicture.asset(
                                    "assets/images/Attachment.svg"),
                              ),
                            ),
                            SizedBox(width: 20.h),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(50.h),
                                    border: Border.all(
                                      width: 0.5.w,
                                      color: Color(0xff8E8E93),
                                    )),
                                child: Center(
                                  child: TextField(
                                    focusNode: controller.focusNode,
                                    controller: messageCtr,
                                    decoration: InputDecoration(
                                      prefix: SizedBox(width: 15.w),
                                      border: InputBorder.none,
                                      contentPadding:
                                      const EdgeInsets.all(0),
                                      isDense: true,
                                      hintText: "Message",
                                      hintStyle: TeacherAppFonts.interW400_16sp_letters1
                                          .copyWith(
                                          color: Colors.black
                                              .withOpacity(0.2)),
                                    ),
                                    onChanged: (value) {
                                      controller.ontype.value = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            InkWell(
                              onTap: () async {
                                // bool permission =
                                // await Get.find<MessageController>()
                                //     .permissionCheck(context);
                                // if (permission) {
                                //   Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //       builder: (context) {
                                //         return CameraScreen(
                                //           setImgPath: (String image) {
                                //             setState(() {
                                //               // _selectedFile = image;
                                //               // _ismessageIconEnabled =
                                //               //     true;
                                //             });
                                //           },
                                //         );
                                //       },
                                //     ),
                                //   );
                                // }
                              },
                              child: SizedBox(
                                height: 25.w,
                                width: 25.w,
                                child: SvgPicture.asset(
                                    "assets/images/Camera.svg"),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            controller.ontype.value == ""
                                ? InkWell(
                              onTap: () {
                                // Get.find<MessageController>()
                                //     .sentMsg(messageCtr.text);
                                // //delaying for completing the message tile update after rebuild//
                                // Future.delayed(
                                //     const Duration(milliseconds: 50), () {
                                //   Get.find<MessageController>()
                                //       .chatListscrollController
                                //       .value
                                //       .animateTo(
                                //         controller
                                //             .chatListscrollController
                                //             .value
                                //             .position
                                //             .maxScrollExtent,
                                //         duration: const Duration(
                                //             milliseconds: 200),
                                //         curve: Curves.easeOut,
                                //       );
                                // });
                              },
                              child: GestureDetector(
                                onLongPress: () async {
                                  // await Permission.microphone
                                  //     .request();
                                  //
                                  // if (await Permission.microphone
                                  //     .status.isGranted) {
                                  //   // if (!_ismessageIconEnabled) {
                                  //   // final provider =
                                  //   //     Provider.of<ChatProvider>(
                                  //   //         context,
                                  //   //         listen: false);
                                  //   HapticFeedback.vibrate();
                                  //   Get.find<MessageController>()
                                  //       .showAudioWidget
                                  //       .value = true;
                                  //   // }
                                  // } else {
                                  //   ShowWarnDialog().showWarn(
                                  //       context: context,
                                  //       message:
                                  //       "Enable microphone permission.",
                                  //       iconData: Icons.mic_none);
                                  // }
                                },
                                child: SizedBox(
                                  height: 25.w,
                                  width: 25.w,
                                  child: SvgPicture.asset(
                                      "assets/images/Record Audio.svg"),
                                ),
                              ),
                            )
                                : InkWell(
                              onTap: () async {
                                // await checkInternet(
                                //   context: context,
                                //   function: () async {
                                //     if (Get.find<MessageController>()
                                //         .audioPath
                                //         .value !=
                                //         null ||
                                //         Get.find<MessageController>()
                                //             .filePath
                                //             .value !=
                                //             null) {
                                //       await Get.find<
                                //           MessageController>()
                                //           .sendAttach(
                                //         classs: widget.studentClass,
                                //         batch: widget.batch,
                                //         subId: widget.subId,
                                //         parentId: Get.find<
                                //             StudentController>()
                                //             .parentId,
                                //         sub: widget.subName,
                                //         studentId: Get.find<
                                //             StudentController>()
                                //             .studentList[Get.find<
                                //             StudentController>()
                                //             .currentStudentIndex
                                //             .value]
                                //             .userId!,
                                //         studentName: Get.find<
                                //             StudentController>()
                                //             .studentList[Get.find<
                                //             StudentController>()
                                //             .currentStudentIndex
                                //             .value]
                                //             .name!,
                                //         teacherId: widget.teacherId,
                                //         context: context,
                                //         filePath: Get.find<
                                //             MessageController>()
                                //             .audioPath
                                //             .value ??
                                //             Get.find<
                                //                 MessageController>()
                                //                 .filePath
                                //                 .value,
                                //         message: messageCtr
                                //             .text.isNotEmpty
                                //             ? messageCtr.text
                                //             : null,
                                //       );
                                //     } else {
                                //       if (messageCtr
                                //           .text.isNotEmpty) {
                                //         await Get.find<
                                //             MessageController>()
                                //             .sendAttachMsg(
                                //           classs:
                                //           widget.studentClass,
                                //           batch: widget.batch,
                                //           subId: widget.subId,
                                //           parentId: Get.find<
                                //               StudentController>()
                                //               .parentId,
                                //           sub: widget.subName,
                                //           studentId: Get.find<
                                //               StudentController>()
                                //               .studentList[Get.find<
                                //               StudentController>()
                                //               .currentStudentIndex
                                //               .value]
                                //               .userId!,
                                //           studentName: Get.find<
                                //               StudentController>()
                                //               .studentList[Get.find<
                                //               StudentController>()
                                //               .currentStudentIndex
                                //               .value]
                                //               .name!,
                                //           teacherId:
                                //           widget.teacherId,
                                //           context: context,
                                //           fileName: null,
                                //           orgName: null,
                                //           extension: null,
                                //           msgText: messageCtr.text,
                                //         );
                                //       }
                                //     }
                                //   },
                                // );

                                //delaying for completing the message tile update after rebuild//
                                Future.delayed(
                                    const Duration(
                                        milliseconds: 50), () {
                                  Get.find<MessageController>()
                                      .chatListscrollController
                                      .value
                                      .animateTo(
                                    controller
                                        .chatListscrollController
                                        .value
                                        .position
                                        .maxScrollExtent,
                                    duration: const Duration(
                                        milliseconds: 200),
                                    curve: Curves.easeOut,
                                  );
                                });
                                print("clear worked");
                                messageCtr.clear();
                                controller.ontype.value = "";
                              },
                              child: SizedBox(
                                  height: 25.w,
                                  width: 25.w,
                                  child: const Icon(
                                    Icons.send,
                                    color: Color(0xff118376),
                                  )
                                // SvgPicture.asset(
                                //     "assets/svg/Record Audio.svg"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 35.h),
                      ],
                    ),
                  ),
                );
              },
            ),
            // GetX<MessageController>(
            //   builder: (controller) {
            //     return Container(
            //       width: double.infinity,
            //       color: Colorutils.Whitecolor,
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 5.h),
            //         child: Column(
            //           children: [
            //             SizedBox(
            //               width: 10.h,
            //             ),
            //             controller.isReplay.value
            //                 ? IntrinsicHeight(
            //                     child: Container(
            //                       width: double.infinity,
            //                       decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         borderRadius: BorderRadius.circular(10.h),
            //                       ),
            //                       child: Row(
            //                         children: [
            //                           Container(
            //                             width: 7.w,
            //                             decoration: BoxDecoration(
            //                               color: Colors.green,
            //                               borderRadius: BorderRadius.only(
            //                                 topLeft: Radius.circular(10.h),
            //                                 bottomLeft: Radius.circular(10.h),
            //                               ),
            //                             ),
            //                           ),
            //                           Expanded(
            //                             child: Padding(
            //                               padding: EdgeInsets.all(5.w),
            //                               child: Column(
            //                                 crossAxisAlignment:
            //                                     CrossAxisAlignment.start,
            //                                 children: [
            //                                   SizedBox(
            //                                     width: double.infinity,
            //                                     child: Text(
            //                                       controller.replayName.value,
            //                                     ),
            //                                   ),
            //                                   SizedBox(
            //                                     width: double.infinity,
            //                                     child: Text(
            //                                       controller
            //                                           .replayMessage.value,
            //                                       maxLines: 3,
            //                                       overflow:
            //                                           TextOverflow.ellipsis,
            //                                     ),
            //                                   ),
            //                                 ],
            //                               ),
            //                             ),
            //                           ),
            //                           IconButton(
            //                               onPressed: () {
            //                                 Get.find<MessageController>()
            //                                     .isReplay
            //                                     .value = false;
            //                               },
            //                               icon: const Icon(Icons.close))
            //                         ],
            //                       ),
            //                     ),
            //                   )
            //                 : const SizedBox(),
            //             SizedBox(
            //               width: 10.h,
            //             ),
            //             Container(
            //               height: 60.w,
            //               child: Row(
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 children: [
            //                   Padding(
            //                     padding:
            //                         const EdgeInsets.symmetric(horizontal: 10)
            //                             .w,
            //                     child: InkWell(
            //                       child: SvgPicture.asset(
            //                         'assets/images/Attachment.svg',
            //                         height: 20.w,
            //                         fit: BoxFit.fitHeight,
            //                       ),
            //                       onTap: () {
            //                         FocusScope.of(context).requestFocus(
            //                             Get.find<MessageController>()
            //                                 .focusNode);
            //                         // Handle attachment button press
            //                       },
            //                     ),
            //                   ),
            //                   Expanded(
            //                     child: Container(
            //                       padding: EdgeInsets.symmetric(horizontal: 10),
            //                       decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(30),
            //                         border: Border.all(
            //                           color: Colors.grey,
            //                           width: 0.2,
            //                         ),
            //                       ),
            //                       child: Row(
            //                         children: [
            //                           Expanded(
            //                             child: TextField(
            //                               focusNode: controller.focusNode,
            //                               controller: messageCtr,
            //                               decoration: InputDecoration(
            //                                 prefix: SizedBox(
            //                                   width: 10.w,
            //                                 ),
            //
            //                                 border: InputBorder.none,
            //                                 // contentPadding: const EdgeInsets
            //                                 //     .all(0),
            //                                 isDense: true,
            //                                 hintText: "Message",
            //                               ),
            //                               onChanged: (value) {
            //                                 setState(() {});
            //                                 controller.ontype.value = value;
            //                               },
            //                             ),
            //                           ),
            //                           // IconButton(
            //                           //   icon: SvgPicture.asset(
            //                           //     'assets/images/profileplus.svg',
            //                           //     width: 24,
            //                           //     height: 24,
            //                           //   ),
            //                           //   onPressed: () {
            //                           //     // Handle profile plus button press
            //                           //   },
            //                           // ),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding:
            //                         const EdgeInsets.only(left: 10, right: 5).w,
            //                     child: InkWell(
            //                       child: SvgPicture.asset(
            //                         'assets/images/Camera.svg',
            //                         height: 20.w,
            //                         fit: BoxFit.fitHeight,
            //                       ),
            //                       onTap: () {
            //                         // Handle camera button press
            //                       },
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding:
            //                         const EdgeInsets.only(left: 5, right: 10).w,
            //                     child: messageCtr.text.isEmpty
            //                         ? InkWell(
            //                             onTap: () {},
            //                             child: Icon(
            //                               Icons.mic,
            //                               color: Colorutils.userdetailcolor,
            //                               size: 24,
            //                             ),
            //                           )
            //                         : InkWell(
            //                             child: Icon(
            //                               Icons.send,
            //                               color: Colorutils.userdetailcolor,
            //                             ),
            //                             onTap: () {
            //                               setState(() {});
            //                               Get.find<MessageController>()
            //                                   .sentMsg(messageCtr.text);
            //                               Future.delayed(
            //                                   const Duration(milliseconds: 50),
            //                                   () {
            //                                 Get.find<MessageController>()
            //                                     .chatListscrollController
            //                                     .value
            //                                     .animateTo(
            //                                       controller
            //                                           .chatListscrollController
            //                                           .value
            //                                           .position
            //                                           .maxScrollExtent,
            //                                       duration: const Duration(
            //                                           milliseconds: 200),
            //                                       curve: Curves.easeOut,
            //                                     );
            //                               });
            //                               messageCtr.clear();
            //                               controller.ontype.value = "";
            //                             },
            //                           ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //             SizedBox(
            //               width: 35.w,
            //             )
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MessageController>(
      builder: (controller) {
        return ListView.separated(
          padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
          controller: controller.chatListscrollController.value,
          itemBuilder: (context, index) {
            return index % 2 == 0
                ? SwapeToWidget(
                    function: () {
                      FocusScope.of(context).requestFocus(
                          Get.find<MessageController>().focusNode);
                      Get.find<MessageController>().isReplay.value = true;
                      Get.find<MessageController>().replayName.value = "You";
                      Get.find<MessageController>().replayMessage.value =
                          Get.find<MessageController>().messageList[index];
                    },
                    iconWidget:
                        SvgPicture.asset("assets/svg/ArrowBendUpLeft.svg"),
                    child: SentMessageBubble(
                      message: Get.find<MessageController>().messageList[index],
                      replay: true,
                    ),
                  )
                : SwapeToWidget(
                    function: () {
                      FocusScope.of(context).requestFocus(
                          Get.find<MessageController>().focusNode);
                      Get.find<MessageController>().isReplay.value = true;
                      Get.find<MessageController>().replayName.value =
                          "~ Ali bin";
                      Get.find<MessageController>().replayMessage.value =
                          Get.find<MessageController>().messageList[index];
                    },
                    iconWidget:
                        SvgPicture.asset("assets/svg/ArrowBendUpLeft.svg"),
                    child: ReceiveMessageBubble(
                      message: Get.find<MessageController>().messageList[index],
                    ),
                  );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 5.h,
            );
          },
          itemCount: Get.find<MessageController>().messageList.length,
        );
      },
    );
  }
}

class SentMessageBubble extends StatelessWidget {
  SentMessageBubble({
    super.key,
    required this.message,
    required this.replay,
  });

  late Offset _tapPosition;
  final String message;
  final bool replay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                  width: 15.h,
                  child: SvgPicture.asset(
                    "assets/images/MessageBubbleShape.svg",
                    fit: BoxFit.contain,
                    color: Colorutils.chatcolor,
                  )),
            ),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      _tapPosition = details.globalPosition;
                      print(_tapPosition);
                      print(ScreenUtil().screenHeight);
                    },
                    onLongPress: () {
                      final renderObject =
                          context.findRenderObject() as RenderBox;
                      final position = renderObject.localToGlobal(Offset.zero);

                      messageMoreShowDialog(
                          context, this, position, _tapPosition);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colorutils.chatcolor,
                          borderRadius: BorderRadius.circular(10.h)),
                      child: Padding(
                        padding: EdgeInsets.all(10.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 180.w,
                                  ),
                                  child: Text(
                                    message,
                                    maxLines: 100,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "17:47",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 5.h,
                                ),
                                SizedBox(
                                  height: 18.h,
                                  width: 18.h,
                                  child: SvgPicture.asset(
                                      "assets/images/Checks.svg"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReceiveMessageBubble extends StatelessWidget {
  const ReceiveMessageBubble({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 5.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 15.h, // Adjust the radius as needed
                  backgroundImage: AssetImage(
                      'assets/images/profile image.png'), // Replace with your avatar image
                ),
              ],
            ),
            SizedBox(width: 2.w),
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(-1.0, 1.0),
                    child: SizedBox(
                        width: 15.h,
                        child: SvgPicture.asset(
                          "assets/images/MessageBubbleShape.svg",
                          fit: BoxFit.contain,
                          color: Colors.white,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colorutils.Whitecolor,
                        borderRadius: BorderRadius.circular(10.h)),
                    child: Padding(
                      padding: EdgeInsets.all(10.h),
                      child: Stack(
                        children: [
                          IntrinsicWidth(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "~ Ali bin",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colorutils.userdetailcolor,
                                          fontSize: 12.w),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.right,
                                      "Arabic",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12.w),
                                      // "9189079hfudshfudsh",
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: 200.w,
                                          ),
                                          child: Text(
                                            message,
                                            maxLines: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20.h,
                                    ),
                                    Text(
                                      "17:47",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// messageMoreShowDialog(
//     BuildContext context, Widget widget, Offset position, Offset tapPosition) {
//   double safeAreaVerticalPadding = MediaQuery.of(context).padding.top +
//       MediaQuery.of(context).padding.bottom;
//
//   showDialog(
//     context: context,
//     builder: (context) {
//       return BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.h),
//           child: Stack(
//             children: [
//               Positioned(
//                 top: position.dy - safeAreaVerticalPadding,
//                 left: 0,
//                 right: 0,
//                 child: Container(child: widget),
//               ),
//               Positioned(
//                 top: tapPosition.dy -
//                     safeAreaVerticalPadding -
//                     ((ScreenUtil().screenHeight / 1.7) > tapPosition.dy
//                         ? 100.h
//                         : 420.h),
//                 right: 0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     ScreenUtil().screenHeight / 1.7 < tapPosition.dy
//                         ? MessageMoreContainer(
//                       widget: widget,
//                     )
//                         : const SizedBox(),
//                     SizedBox(width: 20.h,),
//
//                     const ReactionContainerWidget(),
//                     SizedBox(width: 80.h,),
//
//                     ScreenUtil().screenHeight / 1.7 > tapPosition.dy
//                         ? MessageMoreContainer(
//                       widget: widget,
//                     )
//                         : const SizedBox(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
messageMoreShowDialog(
    BuildContext context, Widget widget, Offset position, Offset tapPosition) {
  double safeAreaVerticalPadding = MediaQuery.of(context).padding.top +
      MediaQuery.of(context).padding.bottom;

  showDialog(
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Stack(
            children: [
              Positioned(
                top: position.dy - safeAreaVerticalPadding,
                left: 0,
                right: 0,
                child: Container(child: widget),
              ),
              Positioned(
                top: tapPosition.dy -
                    safeAreaVerticalPadding -
                    ((ScreenUtil().screenHeight / 1.7) > tapPosition.dy
                        ? 100.h
                        : 420.h),
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ScreenUtil().screenHeight / 1.7 < tapPosition.dy
                        ? MessageMoreContainer(
                            widget: widget,
                          )
                        : const SizedBox(),
                    SizedBox(height: 20.h),
                    const ReactionContainerWidget(),
                    SizedBox(height: 80.h),
                    ScreenUtil().screenHeight / 1.7 > tapPosition.dy
                        ? MessageMoreContainer(
                            widget: widget,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class ReactionContainerWidget extends StatelessWidget {
  const ReactionContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.h),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("👍", style: TextStyle(fontSize: 25.h)),
          SizedBox(
            width: 5.h,
          ),
          Text("🥰", style: TextStyle(fontSize: 25.h)),
          SizedBox(
            width: 5.h,
          ),
          Text("😁", style: TextStyle(fontSize: 25.h)),
          SizedBox(
            width: 5.h,
          ),
          Text("😂", style: TextStyle(fontSize: 25.h)),
          SizedBox(
            width: 5.h,
          ),
          Text("🔥", style: TextStyle(fontSize: 25.h)),
          SizedBox(
            width: 5.h,
          ),
          Text("🙏", style: TextStyle(fontSize: 25.h)),
          SizedBox(
            width: 5.h,
          ),
          SizedBox(
            height: 32.h,
            width: 32.h,
            child: SvgPicture.asset("assets/images/Group 137.svg"),
          )
        ],
      ),
    );
  }
}

class MessageMoreContainer extends StatelessWidget {
  const MessageMoreContainer({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
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
              MessageMoreSettingsTile(
                function: () {},
                text: "Copy",
                icon: "assets/images/Frame 72.svg",
              ),
              const Divider(
                color: Colors.grey,
                height: 0,
              ),
              MessageMoreSettingsTile(
                function: () {},
                text: "View Chat",
                icon: "assets/images/ChatCircleDots.svg",
              ),
              const Divider(
                color: Colors.grey,
                height: 0,
              ),
              MessageMoreSettingsTile(
                function: () {},
                text: "Reply",
                icon: "assets/images/ArrowBendUpLeft.svg",
              ),
              const Divider(
                color: Colors.grey,
                height: 0,
              ),
              MessageMoreSettingsTile(
                function: () {},
                text: "Forward",
                icon: "assets/images/ArrowBendUpRight.svg",
              ),
              const Divider(
                color: Colors.grey,
                height: 0,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => SeenByBottomSheet(),
                  );
                },
                child: MessageMoreSettingsTile(
                  function: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => MessageInfoScreen(widget: widget),
                    );
                  },
                  text: "Message info",
                  icon: "assets/images/Info.svg",
                ),
              ),
              const Divider(
                color: Colors.grey,
                height: 0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delete Chat",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    SizedBox(
                      height: 26.h,
                      width: 26.h,
                      child: SvgPicture.asset("assets/images/Trash.svg"),
                    )
                  ],
                ),
              )
            ],
          ),
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
              style: TextStyle(color: Colors.black, fontSize: 16),
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

class SwapeToWidget extends StatefulWidget {
  const SwapeToWidget({
    super.key,
    required this.child,
    required this.function,
    required this.iconWidget,
  });
  final Widget child;
  final Widget iconWidget;

  final Function function;

  @override
  State<SwapeToWidget> createState() => _SwapeToWidgetState();
}

class _SwapeToWidgetState extends State<SwapeToWidget> {
  late ValueNotifier<double> value;

  @override
  void initState() {
    value = ValueNotifier(0.0);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          widget.function();
        }

        Timer.periodic(const Duration(milliseconds: 5), (timer) {
          if (value.value <= 0) {
            value.value += 10;
            if (value.value >= 0) {
              timer.cancel();
              value.value = 0;
            }
          } else {
            value.value -= 10;
            if (value.value <= 0) {
              timer.cancel();
              value.value = 0;
            }
          }
        });
      },
      onHorizontalDragUpdate: (details) {
        if (value.value >= 0 && value.value <= size.width / 8) {
          value.value = value.value + details.delta.dx;
          print(value);
        } else {
          value.value = value.value + details.delta.dx / 5;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: value,
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(value, 0),
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(-50, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [widget.iconWidget],
                    ),
                  ),
                  widget.child,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
