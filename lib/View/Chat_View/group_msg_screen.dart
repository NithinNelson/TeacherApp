import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';
import 'package:teacherapp/View/Chat_View/Chat_widgets/parent_select_bottomSheet.dart';
import '../../../Controller/ui_controllers/chat_controller.dart';
import '../Chat_List/Mychat/Chat_seen.dart';
import '../Chat_List/chat_list.dart';
import 'Chat_widgets/Grouped_view.dart';
import 'Chat_widgets/message_info_screen.dart';

class GroupMsgScreen extends StatefulWidget {
  const GroupMsgScreen({super.key});

  @override
  State<GroupMsgScreen> createState() => _GroupMsgScreenState();
}

class _GroupMsgScreenState extends State<GroupMsgScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController messageCtr = TextEditingController();

  // late bool isKeboardOpen;
  // late double keybordHeight;
  //
  // late double screenHeight;
  TabController? _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 2, vsync: this);
    // WidgetsBinding.instance.addObserver(this);
    // screenHeight = ScreenUtil().screenHeight;
    // isKeboardOpen = false;
    // keybordHeight = 0;
    Get.find<MessageController>().isReplay.value = false;
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void didChangeMetrics() async {
  //   super.didChangeMetrics();
  //
  //   double bottomInset = MediaQuery.of(context).viewInsets.bottom;
  //   if (keybordHeight < bottomInset) {
  //     keybordHeight = bottomInset;
  //     screenHeight = ScreenUtil().screenHeight;
  //     print(keybordHeight);
  //   }
  //
  //   bool isCurrentlyFocused = Get.find<MessageController>().focusNode.hasFocus;
  //   if (isKeboardOpen) {
  //     // If the keyboard was open and now the focus is lost
  //     if (!isCurrentlyFocused) {
  //       setState(() {
  //         print("close");
  //         isKeboardOpen = false;
  //         screenHeight = ScreenUtil().screenHeight;
  //       });
  //     }
  //   } else {
  //     // If the keyboard was closed and now the focus is gained
  //     if (isCurrentlyFocused) {
  //       setState(() {
  //         print("open");
  //         isKeboardOpen = true;
  //         screenHeight = screenHeight - keybordHeight;
  //       });
  //     }
  //   }
  //   print("Screen height = ${ScreenUtil().screenHeight}");
  // }

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
            Container(
              color: Colorutils.userdetailcolor,
              child: TabBar(
                onTap: (_) {
                  setState(() {});
                },
                tabAlignment: TabAlignment.center,
                controller: _tabcontroller,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: <Widget>[
                  Container(
                    // width: 150,
                    height: 50,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Feed View',
                          style: TeacherAppFonts.interW700_16sp_textWhite,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10,
                          child: Text(
                            "6",
                            style: GoogleFonts.inter(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // width: 160,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Grouped View',
                          style: GoogleFonts.inter(
                            color: Colorutils.Whitecolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10,
                          child: Text(
                            "3",
                            style: GoogleFonts.inter(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabcontroller, children: [
                Container(
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
                GroupedViewChat(),
              ]),
            ),
            if (_tabcontroller?.index == 0)
              GetX<MessageController>(
                builder: (controller) {
                  return Container(
                    width: double.infinity,
                    color: Colorutils.Whitecolor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.h),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 10.h,
                          ),
                          controller.isReplay.value
                              ? IntrinsicHeight(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.h),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 7.w,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.h),
                                              bottomLeft: Radius.circular(10.h),
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
                                                    controller.replayName.value,
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
                                )
                              : const SizedBox(),
                          SizedBox(
                            width: 10.h,
                          ),
                          Container(
                            height: 60.w,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10)
                                          .w,
                                  child: InkWell(
                                    child: SvgPicture.asset(
                                      'assets/images/Attachment.svg',
                                      height: 20.w,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    onTap: () {
                                      FocusScope.of(context).requestFocus(
                                          Get.find<MessageController>()
                                              .focusNode);
                                      // Handle attachment button press
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.2,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            focusNode: controller.focusNode,
                                            controller: messageCtr,
                                            decoration: InputDecoration(
                                              prefix: SizedBox(
                                                width: 10.w,
                                              ),

                                              border: InputBorder.none,
                                              // contentPadding: const EdgeInsets
                                              //     .all(0),
                                              isDense: true,
                                              hintText: "Message",
                                            ),
                                            onChanged: (value) {
                                              setState(() {});
                                              controller.ontype.value = value;
                                            },
                                          ),
                                        ),
                                        InkWell(
                                          child: SvgPicture.asset(
                                            'assets/images/profileplus.svg',
                                            height: 20.w,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          onTap: () {
                                            showModalBottomSheet(
                                                context: context,
                                              backgroundColor: Colors.transparent,
                                              isScrollControlled: true,
                                                builder: (context) {
                                                  return ParentSelectionBottomSheet();
                                                },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 5)
                                          .w,
                                  child: InkWell(
                                    child: SvgPicture.asset(
                                      'assets/images/Camera.svg',
                                      height: 20.w,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    onTap: () {
                                      // Handle camera button press
                                    },
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 10)
                                          .w,
                                  child: messageCtr.text.isEmpty
                                      ? InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.mic,
                                            color: Colorutils.userdetailcolor,
                                            size: 24,
                                          ),
                                        )
                                      : InkWell(
                                          child: Icon(
                                            Icons.send,
                                            color: Colorutils.userdetailcolor,
                                          ),
                                          onTap: () {
                                            setState(() {});
                                            Get.find<MessageController>()
                                                .sentMsg(messageCtr.text);
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
                                            messageCtr.clear();
                                            controller.ontype.value = "";
                                          },
                                        ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 35.w,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
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
