
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/Chat_View/Chat_widgets/text_and_file_widget.dart';
import '../../../Models/api_models/chat_feed_view_model.dart';

class ReplayMessageWidget extends StatelessWidget {
  const ReplayMessageWidget({super.key, required this.replyData, this.senderId});
  final ReplyData replyData;
  final String? senderId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 5.w,
              decoration: BoxDecoration(
                  color: Colorutils.userdetailcolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.h),
                      bottomLeft: Radius.circular(5.h))),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: senderId == Get.find<UserAuthController>().userData.value.userId
                        ? Colorutils.userdetailcolor.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.h),
                        bottomRight: Radius.circular(5.h))),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextAndFileWidget(replyData: replyData)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
