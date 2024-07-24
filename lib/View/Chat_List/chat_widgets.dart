

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Chat with parents',
            style: GoogleFonts.inter(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SvgPicture.asset(
            'assets/images/MagnifyingGlass.svg',
            width: 27.w,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90.w);
}