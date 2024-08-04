import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/feedViewController.dart';
import 'package:teacherapp/Controller/api_controllers/parentChatController.dart';
import 'package:teacherapp/Controller/reaction_controller/reaction_controller.dart';

class ReactionContainerWidget extends StatelessWidget {
  const ReactionContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          const SingleReactionIcon(emoji: "👍"),
          SizedBox(width: 5.w),
          const SingleReactionIcon(emoji: "🥰"),
          SizedBox(width: 5.w),
          const SingleReactionIcon(emoji: "😁"),
          SizedBox(width: 5.w),
          const SingleReactionIcon(emoji: "😂"),
          SizedBox(width: 5.w),
          const SingleReactionIcon(emoji: "🔥"),
          SizedBox(width: 5.w),
          const SingleReactionIcon(emoji: "🙏"),
          SizedBox(width: 5.w),
          SizedBox(
            height: 32.h,
            width: 32.h,
            child: SvgPicture.asset("assets/svg/Add.svg"),
          )
        ],
      ),
    );
  }
}

class SingleReactionIcon extends StatelessWidget {
  const SingleReactionIcon({
    super.key,
    required this.emoji,
  });

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: () {
            // print("object");
            Get.find<ReactionController>().postReaction(
                context: context,
                reaction: emoji,
                messageId:
                    Get.find<FeedViewController>().seletedMsgData!.messageId!,
                parentId: Get.find<FeedViewController>()
                    .seletedMsgData!
                    .messageFromId!);
          },
          child: Text(emoji, style: TextStyle(fontSize: 30.h))),
    );
  }
}

class ReactionContainerWidget2 extends StatelessWidget {
  const ReactionContainerWidget2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          const SingleReactionIcon(emoji: "👍"),
          SizedBox(width: 5.w),
          const SingleReactionIcon(emoji: "🥰"),
          SizedBox(width: 5.w),
          const SingleReactionIcon(emoji: "😁"),
          SizedBox(width: 5.w),
          const SingleReactionIcon(emoji: "😂"),
          SizedBox(width: 5.w),
          const SingleReactionIcon(emoji: "🔥"),
          SizedBox(width: 5.w),
          const SingleReactionIcon(emoji: "🙏"),
          SizedBox(width: 5.w),
          SizedBox(
            height: 32.h,
            width: 32.h,
            child: SvgPicture.asset("assets/svg/Add.svg"),
          )
        ],
      ),
    );
  }
}

class SingleReactionIcon2 extends StatelessWidget {
  const SingleReactionIcon2({
    super.key,
    required this.emoji,
  });

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: () {
            // print("object");
            Get.find<ReactionController>().postReaction(
                context: context,
                reaction: emoji,
                messageId: Get.find<ParentChattingController>()
                    .seletedMsgData!
                    .messageId!,
                parentId: Get.find<ParentChattingController>()
                    .seletedMsgData!
                    .messageFromId!);
          },
          child: Text(emoji, style: TextStyle(fontSize: 30.h))),
    );
  }
}
