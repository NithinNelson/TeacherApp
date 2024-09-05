import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'Services/controller_handling.dart';
import 'Services/shared_preferences.dart';
import 'View/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
    statusBarIconBrightness: Brightness.light, // dark icons
    statusBarBrightness: Brightness.light, // iOS uses this property
  ));
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ]
  );
  final sharedPrefs = SharedPrefs();
  await sharedPrefs.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HandleControllers.createGetControllers();
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
        child: GetMaterialApp(
          title: 'NIMS Teacher',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
