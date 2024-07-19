import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/Colors.dart';
import '../../Chat_List/Mychat/my_chat.dart';

class grouped_view extends StatelessWidget {
  const grouped_view({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ChatItem(
          className: 'English',
          message: 'Brineshben',
          time: '10:53 am',
          unreadMessages: 6,
          classs: '4A',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Arabic',
          message: 'check this',
          time: '08:22 am',
          unreadMessages: 3,
          classs: '5A',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Science',
          message: 'Letzz hv fun',
          time: 'Yesterday',
          unreadMessages: 1,
          classs: '6A',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Maths',
          message: '',
          time: '11:30 pm',
          unreadMessages: 0,
          classs: '7B',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Zology',
          message: 'Plz contact hime',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Science',
          message: '',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '6A',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Maths 2',
          message: 'hod',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Chemistry',
          message: 'Letz do it',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Biology',
          message: 'document it',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Mechanical',
          message: '',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: 'Physics',
          message: '',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),
        ChatItem(
          className: '',
          message: '',
          time: '20-04-2024',
          unreadMessages: 0,
          classs: '8A',
        ),
        Divider(
          thickness: 0.3,
          indent: 8,
          endIndent: 8,
        ),


      ],
    );
  }
}
class ChatItem extends StatelessWidget {
  final String className;
  final String message;
  final String time;
  final int unreadMessages;
  final String classs;

  ChatItem({
    required this.className,
    required this.message,
    required this.time,
    required this.unreadMessages,
    required this.classs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: GestureDetector(
        onTap: (){

        },
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            child: Text(
              classs,
              style: GoogleFonts.inter(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          title: Text(
            className,
            style: GoogleFonts.inter(
                fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          subtitle: Text(
            message,
            style: GoogleFonts.inter(
                fontSize: 13.0, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(time),
              SizedBox(height: 5),
              if (unreadMessages > 0)
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colorutils.userdetailcolor,
                  child: Text(
                    unreadMessages.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}