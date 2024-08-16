import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Services/reaction_service/reaction_service.dart';
import 'package:teacherapp/Services/snackBar.dart';
import 'package:teacherapp/View/Chat_View/feed_view%20_chat_screen.dart';

class ReactionController extends GetxController {
  postReaction(
      {required BuildContext context,
      required String reaction,
      required String messageId,
      required String parentId}) {
    checkInternet(
      context: context,
      function: () async {
        final status = await ReactionService.postReaction(
            reaction: reaction, messageId: messageId, parentId: parentId);

        if (status) {
          print("Reaction success");
        } else {
          snackBar(
              context: context,
              message: "Something went wrong.",
              color: Colors.black);
        }
      },
    );
    Navigator.pop(context);
  }
}
