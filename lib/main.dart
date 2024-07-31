import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Controller/ui_controllers/chat_controller.dart';
import 'package:teacherapp/Controller/ui_controllers/page_controller.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'Controller/api_controllers/feedViewController.dart';
import 'Controller/api_controllers/groupedViewListController.dart';
import 'Controller/api_controllers/lessonObservationController.dart';
import 'Controller/api_controllers/chatClassGroupController.dart';
import 'Controller/api_controllers/notificationController.dart';
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
    Get.put(MessageController());
    Get.put(UserAuthController());
    Get.put(PageIndexController());
    Get.put(TimeTableController());
    Get.put(ChatClassGroupController());
    Get.put(LessonObservationController());
    Get.put(ParentChatListController());
    Get.put(FeedViewController());
    Get.put(NotificationController());
    Get.put(GroupedViewListController());
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
        child: const GetMaterialApp(
          title: 'Teacher App',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
