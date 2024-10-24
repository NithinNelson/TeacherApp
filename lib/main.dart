import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:teacherapp/Services/fcm_service.dart';
import 'package:teacherapp/Utils/Colors.dart';
import 'Services/controller_handling.dart';
import 'Services/shared_preferences.dart';
import 'View/splash_screen.dart';
import 'firebase_options.dart';

// @pragma('vm:entry-point')
// void printHello() {
// final DateTime now = DateTime.now();
// final int isolateId = Isolate.current.hashCode;
// print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
// }

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Initialize local notifications
  // const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  // final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();
  //
  // final InitializationSettings initializationSettings = InitializationSettings(
  //   android: initializationSettingsAndroid,
  //   iOS: initializationSettingsIOS,
  // );
  //
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  //
  // FirebaseMessaging.onMessage.listen(handleNotification);

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
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => FcmService().init());
  Get.put(() => FcmService().handleBackground());
  final sharedPrefs = SharedPrefs();
  await sharedPrefs.initialize();
  runApp(const MyApp());

}

// void handleNotification(RemoteMessage message) async {
//   RemoteNotification? notification = message.notification;
//   AndroidNotification? android = message.notification?.android;
//
//   print("------gbfgb--------${message.data}");
//
//   if (notification != null && android != null) {
//     String? sound = message.data['sound']; // Extract custom sound from data payload
//     bool playSound = sound != null && sound.isNotEmpty;
//     String channelId = 'notification_id_${sound ?? 'default'}';
//
//     print("--------playSound--------$playSound");
//
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//       channelId, // The same id as the meta-data value
//       'NotificationName', // Name of the channel
//       description: '',
//       importance: Importance.max,
//       playSound: playSound,
//       sound: playSound ? RawResourceAndroidNotificationSound(sound) : null,
//     );
//
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           sound: playSound ? RawResourceAndroidNotificationSound(sound) : null,
//           importance: Importance.max,
//           priority: Priority.high,
//           playSound: playSound,
//         ),
//       ),
//     );
//   }
// }

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
