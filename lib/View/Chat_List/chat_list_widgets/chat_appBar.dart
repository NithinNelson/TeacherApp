

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'package:teacherapp/View/Chat_List/chat_list_widgets/new_parentChat_bottomSheet.dart';
import '../../../Controller/api_controllers/chatClassGroupController.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colorutils.letters1,
      padding: const EdgeInsets.symmetric(horizontal: 16).w,
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Text(
            'Chat with parents',
            style: GoogleFonts.inter(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/images/MagnifyingGlass.svg',
            width: 27.w,
            fit: BoxFit.fitWidth,
          ),
          GetX<ChatClassGroupController>(
            builder: (ChatClassGroupController controller) {
              if(controller.currentChatTab.value == 1) {
                return Padding(
                  padding: const EdgeInsets.only(left: 6).w,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (context) {
                            return const NewParentChat();
                          },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4.0).w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100).w
                      ),
                      child: Icon(
                          Icons.add,
                          color: Colorutils.letters1,
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  width: 0,
                  height: 0,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90.w);
}