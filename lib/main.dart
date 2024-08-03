import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/ui_controllers/page_controller.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'Controller/api_controllers/feedViewController.dart';
import 'Controller/api_controllers/groupedViewController.dart';
import 'Controller/api_controllers/groupedViewListController.dart';
import 'Controller/api_controllers/leaveApprovalController.dart';
import 'Controller/api_controllers/leaveRequestController.dart';
import 'Controller/api_controllers/lessonObservationController.dart';
import 'Controller/api_controllers/chatClassGroupController.dart';
import 'Controller/api_controllers/markAsReadController.dart';
import 'Controller/api_controllers/notificationController.dart';
import 'Controller/api_controllers/parentChatController.dart';
import 'Controller/api_controllers/parentChatListController.dart';
import 'Controller/api_controllers/timeTableController.dart';
import 'Controller/api_controllers/userAuthController.dart';
import 'Services/shared_preferences.dart';
import 'View/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
    statusBarIconBrightness: Brightness.light, // dark icons
    statusBarBrightness: Brightness.light, // iOS uses this property
  ));
  final sharedPrefs = SharedPrefs();
  await sharedPrefs.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserAuthController());
    Get.put(PageIndexController());
    Get.put(TimeTableController());
    Get.put(ChatClassGroupController());
    Get.put(LessonObservationController());
    Get.put(ParentChatListController());
    Get.put(FeedViewController());
    Get.put(NotificationController());
    Get.put(MarkAsReadController());
    Get.put(GroupedViewListController());
    Get.put(GroupedViewController());
    Get.put(ParentChattingController());
    Get.put(LeaveRequestController());
    Get.put(LeaveApprovalController());
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) {
        return Center(
          child: SpinKitChasingDots(
            color: Colorutils.userdetailcolor,
            size: 28.w,
          ),
        );
      },
      child: ScreenUtilInit(
        designSize: Size(430, 930),
        minTextAdapt: true,
        splitScreenMode: true,
        
        child:  GetMaterialApp(
          title: 'Teacher App',theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
