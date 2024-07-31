import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/api_controllers/groupedViewListController.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Models/api_models/sent_msg_by_teacher_model.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/Utils/font_util.dart';
import 'package:teacherapp/View/Chat_View/Chat_widgets/parent_select_bottomSheet.dart';
import '../../../Controller/ui_controllers/chat_controller.dart';
import '../../Models/api_models/chat_feed_view_model.dart';
import '../../Models/api_models/chat_group_api_model.dart';
import '../../Services/check_connectivity.dart';
import '../../Services/dialog_box.dart';
import '../../Services/snackBar.dart';
import '../Chat_List/Mychat/Chat_seen.dart';
import 'Chat_widgets/Grouped_view.dart';
import 'Chat_widgets/camera_screen.dart';
import 'Chat_widgets/chat_audioPlaying_widget.dart';
import 'Chat_widgets/chat_audioRecording_widget.dart';
import 'Chat_widgets/chat_date_widget.dart';
import 'Chat_widgets/message_info_screen.dart';
import 'Chat_widgets/more_option_widget.dart';
import 'Chat_widgets/reaction_widget.dart';
import 'Chat_widgets/receive_bubble_widget.dart';
import 'Chat_widgets/sent_bubble_widget.dart';
import 'Chat_widgets/swape_to.dart';

class GroupMsgScreen extends StatefulWidget {
  final ClassTeacherGroup? msgData;
  const GroupMsgScreen({super.key, this.msgData});

  @override
  State<GroupMsgScreen> createState() => _GroupMsgScreenState();
}

class _GroupMsgScreenState extends State<GroupMsgScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController messageCtr = TextEditingController();
  FeedViewController feedViewController = Get.find<FeedViewController>();
  UserAuthController userAuthController = Get.find<UserAuthController>();
  GroupedViewListController groupedViewListController = Get.find<GroupedViewListController>();
  Timer? chatUpdate;

  // late bool isKeboardOpen;
  // late double keybordHeight;
  //
  // late double screenHeight;
  TabController? _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 2, vsync: this);
    initialize();
    // WidgetsBinding.instance.addObserver(this);
    // screenHeight = ScreenUtil().screenHeight;
    // isKeboardOpen = false;
    // keybordHeight = 0;
    feedViewController.isReplay.value = null;
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    chatUpdate!.cancel();
    super.dispose();
  }

  Future<void> initialize() async {
    context.loaderOverlay.show();
    ChatFeedViewReqModel chatFeedViewReqModel = ChatFeedViewReqModel(
      teacherId: userAuthController.userData.value.userId,
      schoolId: userAuthController.userData.value.schoolId,
      classs: widget.msgData?.classTeacherClass,
      batch: widget.msgData?.batch,
      subjectId: widget.msgData?.subjectId,
      offset: 0,
      limit: 100,
    );
    await feedViewController.fetchFeedViewMsgList(chatFeedViewReqModel);
    await groupedViewListController.fetchGroupedViewList();
    if (!mounted) return;
    context.loaderOverlay.hide();
    await Future.delayed(const Duration(milliseconds: 50), () {
      feedViewController.chatFeedViewScrollController.value.animateTo(
        feedViewController
            .chatFeedViewScrollController.value.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
    chatUpdate = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await feedViewController.fetchFeedViewMsgListPeriodically(chatFeedViewReqModel);
        await groupedViewListController.fetchGroupedViewListPeriodically();
      },
    );
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
  //   bool isCurrentlyFocused = feedViewController.focusNode.hasFocus;
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
        leadingWidth: 50.w,
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
            Container(
              width: 44.w,
              height: 44.w,
              padding: const EdgeInsets.all(10).w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: FittedBox(
                child: Text(
                  "${widget.msgData?.classTeacherClass}${widget.msgData?.batch}",
                  style: TeacherAppFonts.interW600_16sp_black,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              widget.msgData?.subjectName ?? '--',
              style: GoogleFonts.inter(
                  fontSize: 18.0,
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
            Container(height: 10.h, color: Colorutils.userdetailcolor),
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
                    width: 180.w,
                    height: 40.h,
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
                        GetX<FeedViewController>(
                          builder: (FeedViewController controller) {
                            if (controller.feedUnreadCount.value != 0) {
                              return CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 11.r,
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0).w,
                                    child: Text(
                                      controller.feedUnreadCount.value.toString(),
                                      style: GoogleFonts.inter(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 180.w,
                    height: 40.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Grouped View',
                          style: TeacherAppFonts.interW700_16sp_textWhite,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 11.r,
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0).w,
                              child: Text(
                                "3",
                                style: GoogleFonts.inter(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green),
                              ),
                            ),
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
                const GroupedViewChat(),
              ]),
            ),
            if (_tabcontroller?.index == 0)
              GetX<FeedViewController>(
                builder: (FeedViewController controller) {
                  return Container(
                    width: double.infinity,
                    color: Colorutils.bgcolor9,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Column(
                        children: [
                          controller.filePath.value == null
                              ? const SizedBox()
                              : Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.h),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 35.w,
                                            height: 30.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    "assets/images/new-document.png"),
                                              ),
                                            ),
                                            child: Center(
                                                child: Text(
                                              feedViewController.filePath.value!
                                                  .split(".")
                                                  .last,
                                              style: TeacherAppFonts
                                                  .interW500_12sp_textWhite
                                                  .copyWith(
                                                fontSize: 10.sp,
                                                color: Colors.black,
                                              ),
                                            )),
                                          ),
                                          SizedBox(width: 5.w),
                                          Expanded(
                                            child: Text(
                                              feedViewController.filePath.value!
                                                  .split("/")
                                                  .last,
                                              style: TeacherAppFonts
                                                  .interW400_16sp_letters1
                                                  .copyWith(
                                                      color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              feedViewController
                                                  .filePath.value = null;
                                            },
                                            child: SizedBox(
                                              width: 25.w,
                                              height: 40.w,
                                              child: const Icon(
                                                Icons.close,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          controller.showAudioPlayingWidget.value == true
                              ? const ChatAudioPlayingWidget()
                              : const SizedBox(),
                          SizedBox(height: 10.w),
                          controller.isReplay.value != null
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
                                                color: Colorutils.letters1,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.h),
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
                                                        style: TeacherAppFonts
                                                            .interW600_16sp_letters1,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.h),
                                                    Builder(
                                                      builder: (context) {
                                                        if (Get.find<
                                                                    FeedViewController>()
                                                                .replayMessage
                                                                .type ==
                                                            "file") {
                                                          return Row(
                                                            children: [
                                                              Container(
                                                                width: 17,
                                                                height: 18,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: AssetImage(
                                                                        "assets/images/new-document.png"),
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      SizedBox(
                                                                    height: 8,
                                                                    width: 12,
                                                                    child:
                                                                        FittedBox(
                                                                      child:
                                                                          Text(
                                                                        Get.find<FeedViewController>()
                                                                            .replayMessage
                                                                            .fileName!
                                                                            .split(".")
                                                                            .last,
                                                                        style: TeacherAppFonts
                                                                            .interW400_14sp_textWhite
                                                                            .copyWith(
                                                                          fontSize:
                                                                              8.sp,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 5.h),
                                                              Expanded(
                                                                child: Text(
                                                                  Get.find<
                                                                          FeedViewController>()
                                                                      .replayMessage
                                                                      .fileName!,
                                                                  style: TeacherAppFonts
                                                                      .interW400_14sp_textWhite
                                                                      .copyWith(
                                                                    color: Colorutils
                                                                        .fontColor6
                                                                        .withOpacity(
                                                                            0.8),
                                                                  ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        } else if (Get.find<
                                                                    FeedViewController>()
                                                                .replayMessage
                                                                .type ==
                                                            "text") {
                                                          return Text(
                                                            // "Can you pls share the pdf adsdaddsf.",
                                                            feedViewController
                                                                    .replayMessage
                                                                    .message ??
                                                                "",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,

                                                            style: TeacherAppFonts
                                                                .interW400_14sp_textWhite
                                                                .copyWith(
                                                                    color: Colorutils
                                                                        .fontColor6
                                                                        .withOpacity(
                                                                            0.8)),
                                                          );
                                                        } else if (Get.find<
                                                                    FeedViewController>()
                                                                .replayMessage
                                                                .type ==
                                                            "audio") {
                                                          return Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 22,
                                                                height: 15.h,
                                                                child: SvgPicture
                                                                    .asset(
                                                                        "assets/images/Record Audio.svg"),
                                                              ),
                                                              SizedBox(
                                                                  width: 1.w),
                                                              Expanded(
                                                                child: Text(
                                                                  "Audio",
                                                                  style: TeacherAppFonts
                                                                      .interW400_14sp_textWhite
                                                                      .copyWith(
                                                                    color: Colorutils
                                                                        .fontColor6
                                                                        .withOpacity(
                                                                            0.8),
                                                                  ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        } else if (Get.find<
                                                                        FeedViewController>()
                                                                    .replayMessage
                                                                    .type ==
                                                                "text_file" ||
                                                            feedViewController
                                                                    .replayMessage
                                                                    .type ==
                                                                "text_audio") {
                                                          return Text(
                                                            // "Can you pls share the pdf adsdaddsf.",
                                                            feedViewController
                                                                    .replayMessage
                                                                    .message ??
                                                                "",

                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,

                                                            style: TeacherAppFonts
                                                                .interW400_14sp_textWhite
                                                                .copyWith(
                                                                    color: Colorutils
                                                                        .fontColor6
                                                                        .withOpacity(
                                                                            0.8)),
                                                          );
                                                        }

                                                        return const SizedBox();
                                                      },
                                                    ),
                                                    // SizedBox(
                                                    //   width: double.infinity,
                                                    //   child: Text(
                                                    //     controller
                                                    //         .replayMessage.value,
                                                    //     maxLines: 3,
                                                    //     overflow:
                                                    //         TextOverflow.ellipsis,
                                                    //     style: FontsStyle()
                                                    //         .interW400_16sp
                                                    //         .copyWith(
                                                    //             color: ColorUtil
                                                    //                 .black),
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                feedViewController
                                                    .isReplay.value = null;
                                              },
                                              child: SizedBox(
                                                width: 25.w,
                                                height: 40.w,
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5.w)
                                            // InkWell(
                                            //   onTap: () {},
                                            //   child: const Icon(
                                            //     Icons.close,
                                            //     color: ColorUtil.grey,
                                            //   ),
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                )
                              : const SizedBox(),
                          controller.showAudioRecordWidget.value
                              ? const ChatAudioRecordingWidget()
                              : Row(
                                  children: [
                                    controller.audioPath.value == null
                                        ? InkWell(
                                            onTap: () async {
                                              await feedViewController
                                                  .selectAttachment(
                                                      context: context);

                                              // feedViewController
                                              //     .selectAttachment(context: context);
                                            },
                                            child: SizedBox(
                                              height: 25.w,
                                              width: 25.w,
                                              child: SvgPicture.asset(
                                                  "assets/images/Attachment.svg"),
                                            ),
                                          )
                                        : const SizedBox(),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 40.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50.h),
                                            border: Border.all(
                                              width: 0.5.w,
                                              color: Colorutils.bordercolor1,
                                            )),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
                                                focusNode:
                                                    controller.focusNode.value,
                                                controller: messageCtr,
                                                decoration: InputDecoration(
                                                  prefix: SizedBox(
                                                    width: 15.w,
                                                  ),
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      const EdgeInsets.all(0),
                                                  isDense: true,
                                                  hintText: "Message",
                                                  hintStyle: TeacherAppFonts
                                                      .interW400_16sp_letters1
                                                      .copyWith(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.2)),
                                                ),
                                                onChanged: (value) {
                                                  controller.ontype.value =
                                                      value;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                      right: 8)
                                                  .w,
                                              child: InkWell(
                                                child: SvgPicture.asset(
                                                  'assets/images/profileplus.svg',
                                                  height: 24.w,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    isScrollControlled: true,
                                                    builder: (context) {
                                                      return ParentSelectionBottomSheet();
                                                    },
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    controller.audioPath.value == null
                                        ? InkWell(
                                            onTap: () async {
                                              bool permission = await Get.find<
                                                      FeedViewController>()
                                                  .permissionCheck(context);
                                              if (permission) {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return const CameraScreen();
                                                    },
                                                  ),
                                                );
                                              }
                                            },
                                            child: SizedBox(
                                              height: 25.w,
                                              width: 25.w,
                                              child: SvgPicture.asset(
                                                  "assets/images/Camera.svg"),
                                            ),
                                          )
                                        : const SizedBox(),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    controller.ontype.value == "" &&
                                            controller.audioPath.value ==
                                                null &&
                                            controller.filePath.value == null
                                        ? GestureDetector(
                                            onLongPress: () async {
                                              await Permission.microphone
                                                  .request();

                                              if (await Permission.microphone
                                                  .status.isGranted) {
                                                HapticFeedback.vibrate();
                                                feedViewController
                                                    .showAudioRecordWidget
                                                    .value = true;
                                              } else {
                                                ShowWarnDialog().showWarn(
                                                    context: context,
                                                    message:
                                                        "Enable microphone permission.",
                                                    iconData: Icons.mic_none);
                                              }
                                            },
                                            child: SizedBox(
                                              height: 25.w,
                                              width: 25.w,
                                              child: SvgPicture.asset(
                                                  "assets/images/Record Audio.svg"),
                                            ),
                                          )
                                        : controller.isSentLoading.value == true
                                            ? SizedBox(
                                                height: 25.w,
                                                width: 25.w,
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : InkWell(
                                                onTap: () async {
                                                  controller.isSentLoading
                                                      .value = true;
                                                  await checkInternet(
                                                    context: context,
                                                    function: () async {
                                                      if (feedViewController
                                                                  .audioPath
                                                                  .value !=
                                                              null ||
                                                          feedViewController
                                                                  .filePath
                                                                  .value !=
                                                              null) {
                                                        await Get.find<
                                                                FeedViewController>()
                                                            .sendAttach(
                                                          classs: widget.msgData
                                                                  ?.classTeacherClass ??
                                                              '--',
                                                          batch: widget.msgData
                                                                  ?.batch ??
                                                              '--',
                                                          subId: widget.msgData
                                                                  ?.subjectId ??
                                                              '--',
                                                          sub: widget.msgData
                                                                  ?.subjectName ??
                                                              '--',
                                                          teacherId:
                                                              userAuthController
                                                                      .userData
                                                                      .value
                                                                      .userId ??
                                                                  '--',
                                                          context: context,
                                                          filePath: Get.find<
                                                                      FeedViewController>()
                                                                  .audioPath
                                                                  .value ??
                                                              Get.find<
                                                                      FeedViewController>()
                                                                  .filePath
                                                                  .value,
                                                          message: messageCtr
                                                                  .text
                                                                  .isNotEmpty
                                                              ? messageCtr.text
                                                              : null,
                                                        );
                                                      } else {
                                                        if (messageCtr
                                                            .text.isNotEmpty) {
                                                          SentMsgByTeacherModel
                                                              sentMsgData =
                                                              SentMsgByTeacherModel(
                                                            subjectId: widget
                                                                    .msgData
                                                                    ?.subjectId ??
                                                                '--',
                                                            batch: widget
                                                                    .msgData
                                                                    ?.batch ??
                                                                '--',
                                                            classs: widget
                                                                    .msgData
                                                                    ?.classTeacherClass ??
                                                                '--',
                                                            message: messageCtr
                                                                    .text
                                                                    .isNotEmpty
                                                                ? messageCtr
                                                                    .text
                                                                : null,
                                                            messageFrom:
                                                                userAuthController
                                                                        .userData
                                                                        .value
                                                                        .userId ??
                                                                    '--',
                                                            parents:
                                                                feedViewController
                                                                    .finalParentDataList
                                                                    .value,
                                                            subject: widget
                                                                    .msgData
                                                                    ?.subjectName ??
                                                                '--',
                                                            replyId: controller
                                                                .isReplay.value,
                                                            fileData: FileData(
                                                              name: null,
                                                              orgName: null,
                                                              extension: null,
                                                            ),
                                                          );
                                                          await feedViewController
                                                              .sendAttachMsg(
                                                            sentMsgData:
                                                                sentMsgData,
                                                            context: context,
                                                          );
                                                        }
                                                      }
                                                    },
                                                  );
                                                  controller.isSentLoading
                                                      .value = false;

                                                  //delaying for completing the message tile update after rebuild//
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 50),
                                                      () {
                                                    feedViewController
                                                        .chatFeedViewScrollController
                                                        .value
                                                        .animateTo(
                                                      controller
                                                          .chatFeedViewScrollController
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

                                                  //delaying for completing the message tile update after rebuild//
                                                  Future.delayed(
                                                    const Duration(
                                                        milliseconds: 50),
                                                    () {
                                                      Get.find<
                                                              FeedViewController>()
                                                          .chatFeedViewScrollController
                                                          .value
                                                          .animateTo(
                                                            controller
                                                                .chatFeedViewScrollController
                                                                .value
                                                                .position
                                                                .maxScrollExtent,
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        200),
                                                            curve:
                                                                Curves.easeOut,
                                                          );
                                                    },
                                                  );
                                                },
                                                child: SizedBox(
                                                  height: 25.w,
                                                  width: 25.w,
                                                  child: const Icon(
                                                    Icons.send,
                                                    color: Colorutils.bgcolor13,
                                                  ),
                                                ),
                                              )
                                  ],
                                ),
                          SizedBox(
                            height: 35.w,
                          ),
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
    String userId =
        Get.find<UserAuthController>().userData.value.userId ?? '--';
    return GetX<FeedViewController>(
      builder: (FeedViewController controller) {
        List<MsgData> msgList = controller.chatMsgList.value;
        return GroupedListView<MsgData, String>(
          useStickyGroupSeparators: true,
          cacheExtent: 1000,
          floatingHeader: true,
          padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
          controller: controller.chatFeedViewScrollController.value,
          groupBy: (element) {
            try {
              return DateFormat('yyyy-MM-dd')
                  .format(DateTime.parse(element.sendAt!));
            } catch (e) {
              return "--";
            }
          },
          elements: msgList,
          groupSeparatorBuilder: (String groupByValue) {
            return ChatDateWidget(date: groupByValue);
          },
          itemBuilder: (context, messageData) {
            // final messageData = msgList[index];
            return "${messageData.messageFromId}" == userId
                ? Column(
                    children: [
                      SwapeToWidget(
                        function: () {
                          controller.focusTextField();
                          // FocusScope.of(context).requestFocus(controller.focusNode);
                          controller.isReplay.value = messageData.messageId;
                          controller.replayName.value = "You";
                          controller.replayMessage = messageData;
                        },
                        iconWidget: SvgPicture.asset(
                            "assets/images/ArrowBendUpLeft.svg"),
                        child: SentMessageBubble(
                          message: messageData.message ?? '',
                          time: messageData.sendAt,
                          replay: true,
                          audio: messageData.messageAudio,
                          fileName: messageData.fileName,
                          fileLink: messageData.messageFile,
                          messageData: messageData,
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SwapeToWidget(
                        function: () {
                          controller.focusTextField();
                          // FocusScope.of(context)
                          //     .requestFocus(controller.focusNode);
                          controller.isReplay.value = messageData.messageId;
                          controller.replayName.value =
                              messageData.messageFrom ?? "";
                          controller.replayMessage = messageData;
                        },
                        iconWidget: SvgPicture.asset(
                            "assets/images/ArrowBendUpLeft.svg"),
                        child: ReceiveMessageBubble(
                          senderName: messageData.messageFrom,
                          message: messageData.message,
                          time: messageData.sendAt,
                          replay: true,
                          audio: messageData.messageAudio,
                          fileName: messageData.fileName,
                          fileLink: messageData.messageFile,
                          subject: messageData.subjectName,
                          messageData: messageData,
                        ),
                      ),
                    ],
                  );
          },
          separator: SizedBox(
            height: 5.h,
          ),
          // separatorBuilder: (context, index) {
          //   return SizedBox(
          //     height: 5.h,
          //   );
          // },
          // itemCount: msgList.length,
        );
      },
    );
  }
}

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

Future<void> checkInternet(
    {required BuildContext context, required Function() function}) async {
  bool connected = await CheckConnectivity().check();
  bool isConnectionGood = await CheckConnectivity().goodConnection();
  print("internect connection is $connected");
  print("internect Good connection is $isConnectionGood");
  if (connected) {
    if (isConnectionGood) {
      function();
    } else {
      snackBar(
          context: context,
          message: "Something went wrong.",
          color: Colors.red);
    }
  } else {
    snackBar(
        context: context,
        message: "No Internet Connection.",
        color: Colors.red);
  }
}
