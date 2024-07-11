import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Colors.dart';

class mychat extends StatelessWidget {
  const mychat({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 45, // Set the height here
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colorutils.buttoncolor,
                        // Change to your desired color
                        borderRadius: BorderRadius.circular(15),
                        // Adjust the radius as needed
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                0.1), // Change to your desired shadow color
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'All',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            // Change to your desired text color
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    height: 30,
                    width: 70, // Set the height here
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colorutils.buttoncolor,
                        // Change to your desired color
                        borderRadius: BorderRadius.circular(15),
                        // Adjust the radius as needed
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                0.1), // Change to your desired shadow color
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Unread',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            // Change to your desired text color
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    height: 30,
                    width: 90, // Set the height here
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colorutils.buttoncolor,
                        // Change to your desired color
                        borderRadius: BorderRadius.circular(15),
                        // Adjust the radius as needed
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                                0.1), // Change to your desired shadow color
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'By Class',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            // Change to your desired text color
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              ChatItem(
                className: 'My Class 2',
                message: 'Brineshben',
                time: '10:53 am',
                unreadMessages: 6,
                classs: '4A', Parentdetail: '', classsdetail: '',
              ),
              Divider(
                thickness: 0.3,
                indent: 8,
                endIndent: 8,
              ),
              ChatItem(
                className: 'Mathematics',
                message: '',
                time: '08:22 am',
                unreadMessages: 3,
                classs: '5A', Parentdetail: '', classsdetail: '',
              ),
              Divider(
                thickness: 0.3,
                indent: 8,
                endIndent: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String className;
  final String message;
  final String time;
  final int unreadMessages;
  final String classs;
  final String Parentdetail;
  final String classsdetail;

  ChatItem({
    required this.className,
    required this.message,
    required this.time,
    required this.unreadMessages,
    required this.classs,
    required this.Parentdetail,
    required this.classsdetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
    );
  }
}
