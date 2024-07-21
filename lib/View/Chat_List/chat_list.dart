
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teacherapp/Utils/Colors.dart';
import '../Chat_View/Chat_widgets/chatnew.dart';
import 'Mychat/my_chat.dart';

class ChatWithParentsPage extends StatefulWidget {
  const ChatWithParentsPage({super.key});

  @override
  State<ChatWithParentsPage> createState() => _ChatWithParentsPageState();
}

class _ChatWithParentsPageState extends State<ChatWithParentsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabcontroller;

  @override
  void initState() {
    _tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colorutils.userdetailcolor,
        title: Text(
          'Chat with parents',
          style: GoogleFonts.inter(
              fontSize: 25.0, fontWeight: FontWeight.w600, color: Colors.white),
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
      body: Column(
        children: [
          Container(
            color: Colorutils.userdetailcolor,
            child: TabBar(
              tabAlignment: TabAlignment.center,
              controller: _tabcontroller,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs: <Widget>[
                Container(
                  // width: 100,
                  height: 50,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chatlist',
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
                  // width: 100,
                  height: 50,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chat',
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
              ListView(
                shrinkWrap: true,
                children: [
                  ChatItem(
                    className: 'My Class',
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
                    className: 'Mathematics',
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
                    className: 'Mathematics',
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
                    className: 'Discipline',
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
                    className: 'Mathematics',
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
              ),
              mychat()
            ]),
          ),
        ],
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   zoomDrawerController: widget.zoomDrawerController,
      // ),
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
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ChatScreen()));
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
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          subtitle: Text(
            message,
            style: GoogleFonts.inter(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: Colors.black),
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
