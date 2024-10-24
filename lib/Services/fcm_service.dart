import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/state_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class FcmService extends GetxService {
  //pre-config
  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'notification_id', // id
    'NotificationName', // name
    description: '',
    importance: Importance.max,
    // playSound: true,
    // sound: RawResourceAndroidNotificationSound("alarm"),
    enableVibration: true,
  );

  //init local notification
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

//Print Fcm Token
  Future<String?> getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    print(token);
    return token;
  }

  //Display Notification
  displayNotification(RemoteNotification notification, String? sound) {
    print("Sound parameter: $sound"); // Debug print

    // Determine if the sound should be played
    bool playSound = sound != null && sound.isNotEmpty; // Play sound only if it is "alarm"
    String channelId = 'notification_id_${sound ?? 'default'}';

    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channel.name,
          color: Colors.yellow,
          importance: Importance.max,
          playSound: playSound, // Use the boolean value to set this
          sound: playSound ? RawResourceAndroidNotificationSound(sound) : null,
          icon: '@mipmap/ic_launcher',
          enableVibration: true,
        ),
      ),
    );
  }


  //Background
  Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    print("------gbfgb--------${message.data}");
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      displayNotification(notification, message.data['sound']);
    }
  }

  handleBackground() {
    //BackGround Handler
    FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
  }

  handleForeground() {
    //Foreground Handler
    requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("------gbfgb--------${message.data}");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        displayNotification(notification, message.data['sound']);
      }
    });
  }

  Future<FcmService> init() async {
    print('$runtimeType is ready!');

    // await Firebase.initializeApp(
    //   //options: DefaultFirebaseOptions.currentPlatform,
    // );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    //
    handleForeground();
    //Token
    //getToken();
    return this;
  }

  Future<void> requestPermission() async {
    // Check for Android permissions
    if (Platform.isAndroid) {
      var status = await Permission.notification.status;
      // var audio = await Permission.audio.status;

      if (status.isDenied) {
        // Request notification permission
        await Permission.notification.request();
      }

      // if (audio.isDenied) {
      //   // Request audio permission
      //   var result = await Permission.audio.request();
      //   if (result.isGranted) {
      //     print("Audio permission granted");
      //   } else {
      //     print("Audio permission denied");
      //   }
      // }
    }

    // Request permission for iOS
    if (Platform.isIOS) {
      final bool? result = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
          alert: true, badge: true, sound: true);
      if (result == true) {
        print("Permission granted");
      } else {
        print("Permission denied");
      }
    }
  }
}