import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/reaction_controller/reaction_controller.dart';
import 'package:teacherapp/Services/common_services.dart';
import 'package:flutter/foundation.dart' as foundation;

class ReactionContainerWidget extends StatelessWidget {
  const ReactionContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> width = ValueNotifier(120.h);
    ValueNotifier<double> rotate = ValueNotifier(0);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        width.value = 360.h;
        rotate.value = 0.5;
      },
    );
    return ValueListenableBuilder(
      valueListenable: width,
      builder: (context, value, child) {
        return AnimatedContainer(
          width: value,
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.h),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              const SingleReactionIcon(emoji: "👍", delay: 50),
              wSpace(10.h),
              const SingleReactionIcon(emoji: "🥰", delay: 75),
              wSpace(10.h),
              const SingleReactionIcon(emoji: "😁", delay: 100),
              wSpace(10.h),
              const SingleReactionIcon(emoji: "😂", delay: 125),
              wSpace(10.h),
              const SingleReactionIcon(emoji: "🔥", delay: 150),
              wSpace(10.h),
              const SingleReactionIcon(emoji: "🙏", delay: 175),
              wSpace(10.h),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return EmojiPicker(
                        textEditingController: null,
                        onEmojiSelected: (Category? category, Emoji emoji) {
                          Get.find<ReactionController>().postReaction(
                              context: context,
                              reaction: emoji.emoji,
                              messageId: Get.find<FeedViewController>()
                                  .seletedMsgData!
                                  .messageId!,
                              parentId: Get.find<FeedViewController>()
                                  .seletedMsgData!
                                  .messageFromId!);
                          Navigator.pop(context);
                        },
                        config: Config(
                          // customSearchIcon: null,
                          height: 256,
                          checkPlatformCompatibility: true,
                          emojiViewConfig: EmojiViewConfig(
                            backgroundColor: Colors.white,
                            emojiSizeMax: 28 *
                                (foundation.defaultTargetPlatform ==
                                        TargetPlatform.iOS
                                    ? 1.20
                                    : 1.0),
                          ),
                          swapCategoryAndBottomBar: false,
                          categoryViewConfig: const CategoryViewConfig(
                              iconColorSelected: Colors.teal,
                              indicatorColor: Colors.teal),
                          bottomActionBarConfig: const BottomActionBarConfig(
                            enabled: false,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: ValueListenableBuilder(
                  valueListenable: rotate,
                  builder: (context, value, child) {
                    return Center(
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 400),
                        turns: rotate.value,
                        child: SizedBox(
                          height: 40.h,
                          width: 40.h,
                          child: SvgPicture.asset("assets/images/AddMore.svg"),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class SingleReactionIcon extends StatelessWidget {
  const SingleReactionIcon({
    super.key,
    required this.emoji,
    required this.delay,
  });

  final String emoji;
  final int delay;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> iconSize = ValueNotifier(0.h);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Future.delayed(Duration(milliseconds: delay));
        iconSize.value = 40.h;
      },
    );
    return GestureDetector(
      onTap: () {
        Get.find<ReactionController>().postReaction(
            context: context,
            reaction: emoji,
            messageId:
                Get.find<FeedViewController>().seletedMsgData!.messageId!,
            parentId:
                Get.find<FeedViewController>().seletedMsgData!.messageFromId!);
      },
      child: ValueListenableBuilder(
        valueListenable: iconSize,
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: iconSize.value,
            width: iconSize.value,
            child: FittedBox(
              child: Text(
                emoji,
                // style: TextStyle(fontSize: 30.h),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ReactionContainerWidget2 extends StatelessWidget {
  const ReactionContainerWidget2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> width = ValueNotifier(120.h);
    ValueNotifier<double> rotate = ValueNotifier(0);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        width.value = 360.h;
        rotate.value = 0.5;
      },
    );
    return ValueListenableBuilder(
      valueListenable: width,
      builder: (context, value, child) {
        return AnimatedContainer(
          width: value,
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.h),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              const SingleReactionIcon(emoji: "👍", delay: 50),
              wSpace(10.h),
              const SingleReactionIcon(emoji: "🥰", delay: 75),
              wSpace(10.h),
              const SingleReactionIcon(emoji: "😁", delay: 100),
              wSpace(10.h),
              const SingleReactionIcon(emoji: "😂", delay: 125),
              wSpace(10.h),
              const SingleReactionIcon(emoji: "🔥", delay: 150),
              wSpace(10.h),
              const SingleReactionIcon(emoji: "🙏", delay: 175),
              wSpace(10.h),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return EmojiPicker(
                        textEditingController: null,
                        onEmojiSelected: (Category? category, Emoji emoji) {
                          Get.find<ReactionController>().postReaction(
                              context: context,
                              reaction: emoji.emoji,
                              messageId: Get.find<FeedViewController>()
                                  .seletedMsgData!
                                  .messageId!,
                              parentId: Get.find<FeedViewController>()
                                  .seletedMsgData!
                                  .messageFromId!);
                          Navigator.pop(context);
                        },
                        config: Config(
                          // customSearchIcon: null,
                          height: 256,
                          checkPlatformCompatibility: true,
                          emojiViewConfig: EmojiViewConfig(
                            backgroundColor: Colors.white,
                            emojiSizeMax: 28 *
                                (foundation.defaultTargetPlatform ==
                                        TargetPlatform.iOS
                                    ? 1.20
                                    : 1.0),
                          ),
                          swapCategoryAndBottomBar: false,
                          categoryViewConfig: const CategoryViewConfig(
                              iconColorSelected: Colors.teal,
                              indicatorColor: Colors.teal),
                          bottomActionBarConfig: const BottomActionBarConfig(
                            enabled: false,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: ValueListenableBuilder(
                  valueListenable: rotate,
                  builder: (context, value, child) {
                    return Center(
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 400),
                        turns: rotate.value,
                        child: SizedBox(
                          height: 40.h,
                          width: 40.h,
                          child: SvgPicture.asset("assets/images/AddMore.svg"),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// class ReactionContainerWidget extends StatelessWidget {
//   const ReactionContainerWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(100.h),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 10,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const SingleReactionIcon(emoji: "👍"),
//           SizedBox(width: 5.w),
//           const SingleReactionIcon(emoji: "🥰"),
//           SizedBox(width: 5.w),
//           const SingleReactionIcon(emoji: "😁"),
//           SizedBox(width: 5.w),
//           const SingleReactionIcon(emoji: "😂"),
//           SizedBox(width: 5.w),
//           const SingleReactionIcon(emoji: "🔥"),
//           SizedBox(width: 5.w),
//           const SingleReactionIcon(emoji: "🙏"),
//           SizedBox(width: 5.w),
//           SizedBox(
//             height: 32.h,
//             width: 32.h,
//             child: SvgPicture.asset("assets/svg/Add.svg"),
//           )
//         ],
//       ),
//     );
//   }
// }

// class SingleReactionIcon extends StatelessWidget {
//   const SingleReactionIcon({
//     super.key,
//     required this.emoji,
//   });

//   final String emoji;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: InkWell(
//           onTap: () {
//             // print("object");
//             Get.find<ReactionController>().postReaction(
//                 context: context,
//                 reaction: emoji,
//                 messageId:
//                     Get.find<FeedViewController>().seletedMsgData!.messageId!,
//                 parentId: Get.find<FeedViewController>()
//                     .seletedMsgData!
//                     .messageFromId!);
//           },
//           child: Text(emoji, style: TextStyle(fontSize: 30.h))),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////////////// reaction 2 ////////////////////////////////////////////////////////

// class ReactionContainerWidget2 extends StatelessWidget {
//   const ReactionContainerWidget2({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(100.h),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 10,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const SingleReactionIcon(emoji: "👍"),
//           SizedBox(width: 5.w),
//           const SingleReactionIcon(emoji: "🥰"),
//           SizedBox(width: 5.w),
//           const SingleReactionIcon(emoji: "😁"),
//           SizedBox(width: 5.w),
//           const SingleReactionIcon(emoji: "😂"),
//           SizedBox(width: 5.w),
//           const SingleReactionIcon(emoji: "🔥"),
//           SizedBox(width: 5.w),
//           const SingleReactionIcon(emoji: "🙏"),
//           SizedBox(width: 5.w),
//           SizedBox(
//             height: 32.h,
//             width: 32.h,
//             child: SvgPicture.asset("assets/svg/Add.svg"),
//           )
//         ],
//       ),
//     );
//   }
// }

// class SingleReactionIcon2 extends StatelessWidget {
//   const SingleReactionIcon2({
//     super.key,
//     required this.emoji,
//   });

//   final String emoji;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: InkWell(
//           onTap: () {
//             // print("object");
//             Get.find<ReactionController>().postReaction(
//                 context: context,
//                 reaction: emoji,
//                 messageId: Get.find<ParentChattingController>()
//                     .seletedMsgData!
//                     .messageId!,
//                 parentId: Get.find<ParentChattingController>()
//                     .seletedMsgData!
//                     .messageFromId!);
//           },
//           child: Text(emoji, style: TextStyle(fontSize: 30.h))),
//     );
//   }
// }
