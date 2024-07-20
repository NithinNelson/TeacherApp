
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:teacherapp/View/Home_Page/Home_Widjets/my_class.dart';
import 'Home_Widjets/class_list.dart';
import 'Home_Widjets/subject_list.dart';
import 'Home_Widjets/time_table.dart';
import 'Home_Widjets/topics.dart';
import 'Home_Widjets/user_details.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const UserDetails(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 50).w,
                  children: const [
                    MyClass(),
                    ClassList(),
                    SubjectList(),
                    TimeTable(),
                    Topic(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
